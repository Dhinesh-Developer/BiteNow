package com.kumar.DAO;

import java.util.List;

import com.kumar.Models.Restaurant;

public interface RestaurantDao {
	
	List<Restaurant> getAllRestaurant();
	Restaurant getRestaurantById(int id);
	
}
