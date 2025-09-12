package com.shashirajraja.onlinebookstore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shashirajraja.onlinebookstore.dao.AuthorityRepository;
import com.shashirajraja.onlinebookstore.dao.BookUserRepository;
import com.shashirajraja.onlinebookstore.dao.CustomerRepository;
import com.shashirajraja.onlinebookstore.dao.PurchaseDetailRepository;
import com.shashirajraja.onlinebookstore.dao.PurchaseHistoryRepository;
import com.shashirajraja.onlinebookstore.dao.ShoppingCartRepository;
import com.shashirajraja.onlinebookstore.dao.UserRepository;
import com.shashirajraja.onlinebookstore.entity.Book;
import com.shashirajraja.onlinebookstore.entity.BookDetail;
import com.shashirajraja.onlinebookstore.entity.Authority;
import com.shashirajraja.onlinebookstore.service.BookService;

import java.util.Set;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private BookService bookService;
    
    @Autowired
    private AuthorityRepository authorityRepository;
    
    @Autowired
    private BookUserRepository bookUserRepository;
    
    @Autowired
    private PurchaseDetailRepository purchaseDetailRepository;
    
    @Autowired
    private PurchaseHistoryRepository purchaseHistoryRepository;
    
    @Autowired
    private ShoppingCartRepository shoppingCartRepository;
    
    @Autowired
    private CustomerRepository customerRepository;
    
    @Autowired
    private UserRepository userRepository;

    // Admin Dashboard
    @GetMapping({"", "/"})
    public String adminDashboard(Model model) {
        Set<Book> books = bookService.getAllBooks();
        model.addAttribute("books", books);
        model.addAttribute("totalBooks", books.size());
        return "admin-dashboard";
    }
    
    // View all books - Redirect to dashboard since books management is now centralized there
    @GetMapping("/books")
    public String viewBooks(RedirectAttributes redirectAttributes) {
        redirectAttributes.addFlashAttribute("message", "Book management has been moved to the main dashboard for better user experience.");
        redirectAttributes.addFlashAttribute("messageType", "success");
        return "redirect:/admin";
    }
    
    // Add new book form
    @GetMapping("/books/add")
    public String showAddBookForm(Model model) {
        Book book = new Book();
        book.setBookDetail(new BookDetail());
        model.addAttribute("book", book);
        return "admin-add-book";
    }
    
    // Process add book
    @PostMapping("/books/add")
    public String addBook(@ModelAttribute("book") Book book, RedirectAttributes redirectAttributes) {
        try {
            String result = bookService.addBook(book);
            redirectAttributes.addFlashAttribute("message", result);
            redirectAttributes.addFlashAttribute("messageType", "success");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", "Error adding book: " + e.getMessage());
            redirectAttributes.addFlashAttribute("messageType", "error");
        }
        return "redirect:/admin";
    }
    
    // Edit book form
    @GetMapping("/books/edit")
    public String showEditBookForm(@RequestParam("bookId") int bookId, Model model) {
        Book book = bookService.getBookById(bookId);
        if (book != null) {
            model.addAttribute("book", book);
            return "admin-edit-book";
        } else {
            model.addAttribute("message", "Book not found!");
            return "redirect:/admin/books";
        }
    }
    
    // Process edit book
    @PostMapping("/books/edit")
    public String editBook(@ModelAttribute("book") Book book, RedirectAttributes redirectAttributes) {
        try {
            String result = bookService.updateBook(book);
            redirectAttributes.addFlashAttribute("message", result);
            redirectAttributes.addFlashAttribute("messageType", "success");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", "Error updating book: " + e.getMessage());
            redirectAttributes.addFlashAttribute("messageType", "error");
        }
        return "redirect:/admin";
    }
    
    // Delete book
    @GetMapping("/books/delete")
    public String deleteBook(@RequestParam("bookId") int bookId, RedirectAttributes redirectAttributes) {
        try {
            String result = bookService.removeBookById(bookId);
            redirectAttributes.addFlashAttribute("message", result);
            redirectAttributes.addFlashAttribute("messageType", "success");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", "Error deleting book: " + e.getMessage());
            redirectAttributes.addFlashAttribute("messageType", "error");
        }
        return "redirect:/admin";
    }
    
    // Increase book quantity
    @PostMapping("/books/increase-quantity")
    @ResponseBody
    public String increaseBookQuantity(@RequestParam("bookId") int bookId, 
                                     @RequestParam("quantity") int quantity) {
        try {
            Book book = bookService.getBookById(bookId);
            if (book != null) {
                book.setQuantity(book.getQuantity() + quantity);
                bookService.updateBook(book);
                return "Quantity increased successfully! New quantity: " + book.getQuantity();
            } else {
                return "Book not found!";
            }
        } catch (Exception e) {
            return "Error increasing quantity: " + e.getMessage();
        }
    }

    @DeleteMapping("/clear-all-users")
    public String clearAllUsersAndCustomers() {
        try {
            // Delete in proper order to maintain referential integrity
            authorityRepository.deleteAll();
            bookUserRepository.deleteAll();
            purchaseDetailRepository.deleteAll();
            purchaseHistoryRepository.deleteAll();
            shoppingCartRepository.deleteAll();
            customerRepository.deleteAll();
            userRepository.deleteAll();
            
            return "All users and customers have been successfully deleted!";
        } catch (Exception e) {
            return "Error occurred while deleting users and customers: " + e.getMessage();
        }
    }
    
    // Promote user to admin (temporary endpoint for setup)
    @PostMapping("/promote-user")
    @ResponseBody
    public String promoteUserToAdmin(@RequestParam("username") String username) {
        try {
            // Check if user exists
            if (userRepository.findByUsername(username) == null) {
                return "User not found: " + username;
            }
            
            // Check if user already has admin role
            if (authorityRepository.findByUserUsernameAndRole(username, "ROLE_ADMIN") != null) {
                return "User " + username + " already has admin role!";
            }
            
            // Create authority entity
            Authority adminAuthority = new Authority();
            adminAuthority.setuser(userRepository.findByUsername(username));
            adminAuthority.setRole("ROLE_ADMIN");
            
            // Save authority
            authorityRepository.save(adminAuthority);
            
            return "User " + username + " has been promoted to admin successfully!";
        } catch (Exception e) {
            return "Error promoting user to admin: " + e.getMessage();
        }
    }
}