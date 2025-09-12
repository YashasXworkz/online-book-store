package com.shashirajraja.onlinebookstore.service;

import java.util.HashSet;
import java.util.Set;

import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shashirajraja.onlinebookstore.dao.CustomerRepository;
import com.shashirajraja.onlinebookstore.dao.ShoppingCartRepository;
import com.shashirajraja.onlinebookstore.entity.Book;
import com.shashirajraja.onlinebookstore.entity.Customer;
import com.shashirajraja.onlinebookstore.entity.ShoppingCart;

@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {

	private static final Logger logger = LoggerFactory.getLogger(ShoppingCartServiceImpl.class);

	@Autowired
	private CustomerRepository theCustomerRepository;
	
	@Autowired
	private ShoppingCartRepository theCartRepository;

	@Override
	@Transactional
	public Set<ShoppingCart> getAllItems(Customer customer) {
		Set<ShoppingCart> items = new HashSet<ShoppingCart>();
		items.addAll(theCartRepository.getItemsByCustomer(customer));
		return items;
	
	}

	@Override
	@Transactional
	public String removeItem(Customer customer, Book book) {
		try {
			int res = theCartRepository.removeByIds(customer.getUsername(), book.getId());
			if(res > 0 ) {
				customer.getShoppingCart().remove(new ShoppingCart(customer,book,1));
			}
		} catch(Exception ex) {
			logger.error("Error removing item from cart for customer: {} and book: {}", customer.getUsername(), book.getId(), ex);
		}
		return "Book: \""+book.getName()+" \" removed from cart!";
	}

	
	@Override
	@Transactional
	public String decreaseItem(Customer customer, Book book, int count) {
		return "Item is already removed from cart!";
	}
	
	@Override
	@Transactional
	public String addItem(Customer customer, Book book) {
		try {
			int res = theCartRepository.addByIds(customer.getUsername(),book.getId(),1);
			if(res > 0) {
				customer.addShoppingCart(new ShoppingCart(customer,book,1));
			}
		} catch(Exception ex) {
			logger.error("Error adding item to cart for customer: {} and book: {}", customer.getUsername(), book.getId(), ex);
		}
		return "Book: \""+book.getName()+"\" added to cart successfully";
	}

	@Override
	public String increaseItem(Customer customer, Book book, int count) {
		// This method is not implemented yet
		logger.warn("increaseItem method called but not implemented for customer: {} and book: {}", customer.getUsername(), book.getId());
		return "Function not implemented yet.";
	}

	@Override
	@Transactional
	public Set<ShoppingCart> getByUsername(Customer customer) {
		Set<ShoppingCart> items = new HashSet<ShoppingCart>();
		items.addAll(theCartRepository.getItemsByCustomer(customer));
		customer.setShoppingCart(items);
		return customer.getShoppingCart();
	}

}
