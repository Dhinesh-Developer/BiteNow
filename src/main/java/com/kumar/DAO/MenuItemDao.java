package com.kumar.DAO;

import java.util.List;

import com.kumar.Models.MenuItem;

public interface MenuItemDao {
	List<MenuItem> getAllMenuItems();
	List<MenuItem> getMenuItemByRestaurnantId(int restaurant_id);
}
