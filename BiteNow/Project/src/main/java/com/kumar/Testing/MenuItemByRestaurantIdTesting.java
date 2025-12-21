package com.kumar.Testing;

import java.util.List;
import java.util.Scanner;

import com.kumar.DAO.MenuItemDao;
import com.kumar.DAOImpl.MenuItemDaoImpl;
import com.kumar.Models.MenuItem;

public class MenuItemByRestaurantIdTesting {
	public static void main(String[] args) {
		
		Scanner in = new Scanner(System.in);
		System.out.println("Enter the restaurant Id");
		int id = in.nextInt();
		
		MenuItemDao mdao = new MenuItemDaoImpl();
		List<MenuItem> items = mdao.getMenuItemByRestaurnantId(id);
		
		for(MenuItem x : items) {
			System.out.println(x);
		}
	}
}
