package com.shashirajraja.onlinebookstore.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.shashirajraja.onlinebookstore.entity.CurrentSession;
import com.shashirajraja.onlinebookstore.forms.entity.ForgotPassword;
import com.shashirajraja.onlinebookstore.service.CustomerService;
import com.shashirajraja.onlinebookstore.service.UserService;

@Controller
public class LoginController {

	@Autowired
	UserService theUserService;
	
	@Autowired
	CurrentSession currentSession;
	
	@Autowired
	CustomerService theCustomerService;
	
	@GetMapping("/login")
	public String showLoginForm(HttpSession session) {
		session.setAttribute("var", "My Variable");
		return "login-form";
	}
	
	@GetMapping({"/",""})
	public String showHome(Model theModel) {
		//theModel.addAttribute("username", currentSession.getUser().getUsername());
		return "customer-home";
	}
	
	@GetMapping("/access-denied")
	public String accessDenied() {
		return "access-denied";
	}
	
	@GetMapping("/forgot-password")
	public String showForgotPasswordForm(Model theModel) {
		theModel.addAttribute("forgotPassword", new ForgotPassword());
		String message = null;
		theModel.addAttribute("message", message);
		return "forgot-password-form";
	}
	
	@PostMapping("/forgot-password/reset")
	public String processForgotPassword(@ModelAttribute("forgotPassword") ForgotPassword forgotPassword, Model theModel) {
		String message = theCustomerService.resetPassword(forgotPassword);
		theModel.addAttribute("message", message);
		theModel.addAttribute("forgotPassword", new ForgotPassword());
		return "forgot-password-form";
	}
	
}