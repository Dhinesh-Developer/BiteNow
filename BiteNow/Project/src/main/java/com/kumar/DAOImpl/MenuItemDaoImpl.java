package com.kumar.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kumar.DAO.MenuItemDao;
import com.kumar.DBUtils.DbConnectionData;
import com.kumar.Models.MenuItem;

public class MenuItemDaoImpl implements MenuItemDao{
	
	private static final String GET_MENUITEM_BY_RESTAURANT_ID = "select * from menu_items where restaurant_id = ?";

	@Override
	public List<MenuItem> getAllMenuItems() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MenuItem> getMenuItemByRestaurnantId(int restaurant_id) {
		List<MenuItem> items = new ArrayList<>();
		
		try {
			Connection con = DbConnectionData.getConnection();
			PreparedStatement pstmt = con.prepareStatement(GET_MENUITEM_BY_RESTAURANT_ID);
			pstmt.setInt(1, restaurant_id);
			ResultSet res = pstmt.executeQuery();
			while(res.next()) {
				MenuItem it = new MenuItem(res.getInt("item_id"),
						res.getInt("restaurant_id"),
						res.getString("name"),
						res.getString("description"),
						res.getDouble("price"),
						res.getString("category"),
						res.getString("image_url"),
						res.getBoolean("is_available"));
				items.add(it);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return items;
	}
	
}
