package com.kumar.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.kumar.DAO.RestaurantDao;
import com.kumar.DBUtils.DbConnectionData;
import com.kumar.Models.Restaurant;

public class RestaurantDaoImpl implements RestaurantDao{
	
	private static final String GET_ALL_RESTAURANT = "select * from restaurants";
	private static final String GET_RESTAURANT_BY_Id = "select * from restaurants where restaurant_id = ?";
	
	@Override
	public List<Restaurant> getAllRestaurant() {
		List<Restaurant> rest = new ArrayList<>();
		
		try {
			Connection con = DbConnectionData.getConnection();
			Statement stmt = con.createStatement();
			ResultSet res = stmt.executeQuery(GET_ALL_RESTAURANT);
			while(res.next()) {
				Restaurant r = new Restaurant(res.getInt("restaurant_id"),res.getInt("owner_id"),
						res.getString("name"),res.getString("description"),
						res.getString("cuisine_type"),res.getString("address"),
						res.getString("phone"),res.getDouble("rating")
						,res.getString("image_url"),res.getBoolean("is_active"));
				rest.add(r);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rest;
	}

	@Override
	public Restaurant getRestaurantById(int id) {
		Restaurant rest = null;
		
		try {
			Connection con = DbConnectionData.getConnection();
			PreparedStatement pstmt = con.prepareStatement(GET_RESTAURANT_BY_Id);
			pstmt.setInt(1, id);
			ResultSet res = pstmt.executeQuery();
			while(res.next()) {
				rest= new Restaurant(res.getInt("restaurant_id"),res.getInt("owner_id"),
						res.getString("name"),res.getString("description"),
						res.getString("cuisine_type"),res.getString("address"),
						res.getString("phone"),res.getDouble("rating")
						,res.getString("image_url"),res.getBoolean("is_active"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rest;
	}

}
