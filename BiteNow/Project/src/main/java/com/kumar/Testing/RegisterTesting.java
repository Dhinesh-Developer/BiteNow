package com.kumar.Testing;

import java.util.Scanner;

import com.kumar.DAO.UserDao;
import com.kumar.DAOImpl.UserDaoImpl;
import com.kumar.Models.UserModel;

public class RegisterTesting {
	
	static Scanner in = new Scanner(System.in);
	public static void main(String[] args) {
		
		System.out.println("enter the name: ");
		String name = in.nextLine();
		System.out.println("Enter the email: ");
		String email = in.nextLine();
		System.out.println("Enter the password: ");
		String password = in.nextLine();
		
		System.out.println("Enter the Mobile");
		String mobile = in.nextLine();
		System.out.println("Enter the Address");
		String address = in.nextLine();
		
		UserModel newUser = new UserModel(name,email,password,address,mobile);
		
		UserDao udao = new UserDaoImpl();
		int status = udao.addUser(newUser);
		
		if(status == -1) {
			System.out.println("Failed to create a new User");
		}else {
			System.out.println("New User added successfully");
		}
	}
}	
