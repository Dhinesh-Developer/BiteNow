package com.kumar.Testing;

import java.util.List;
import java.util.Scanner;

import com.kumar.DAO.UserDao;
import com.kumar.DAOImpl.UserDaoImpl;
import com.kumar.Models.UserModel;

public class LoginTesting {
	
	private static Scanner in = new Scanner(System.in);
	public static void main(String[] args) {
		
		System.out.println("Enter the email: ");
		String email = in.nextLine();
		System.out.println("Enter the password: ");
		String password = in.nextLine();
		
		UserDao udao = new UserDaoImpl();
		List<UserModel> listOfUsers = udao.getUserByEmail(email, password);
		
		for(UserModel x : listOfUsers) {
			UserModel user = x;
			if(user.getEmail().equals(email) && user.getPassword().equals(password)) {
				System.out.println("Login successfully");
			}else {
				System.out.println("Please! Signup...");
			}
		}
		
		System.out.println("program Terminated");
	}
}
