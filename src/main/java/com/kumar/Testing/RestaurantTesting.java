package com.kumar.Testing;

import java.util.List;
import java.util.Scanner;

import com.kumar.DAO.RestaurantDao;
import com.kumar.DAOImpl.RestaurantDaoImpl;
import com.kumar.Models.Restaurant;

public class RestaurantTesting {
	public static void main(String[] args) {
		
		Scanner in = new Scanner(System.in);
		
		RestaurantDao rdao = new RestaurantDaoImpl();
		List<Restaurant> lists = rdao.getAllRestaurant();
		for(Restaurant x: lists) {
			System.out.println(x);
		}
	}
}	
