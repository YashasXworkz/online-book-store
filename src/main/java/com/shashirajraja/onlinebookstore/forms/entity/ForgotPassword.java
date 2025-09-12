package com.shashirajraja.onlinebookstore.forms.entity;

public class ForgotPassword {

	private String email;
	
	private String newPassword;
	
	private String confirmPassword;
	
	public ForgotPassword() {}
	
	public ForgotPassword(String email) {
		this.email = email;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	
}