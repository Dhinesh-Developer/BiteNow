package com.kumar.Testing;

import java.util.Scanner;

import com.kumar.DAO.RestaurantDao;
import com.kumar.DAOImpl.RestaurantDaoImpl;
import com.kumar.Models.Restaurant;

public class RestaurntByIdTesting {
	public static void main(String[] args) {
		
		Scanner in = new Scanner(System.in);
		System.out.println("Enter the Restaurant ID: ");
		int id = in.nextInt();
		
		RestaurantDao rdao = new RestaurantDaoImpl();
		Restaurant res = rdao.getRestaurantById(id);
		
		System.out.println(res.toString());
	}
}
