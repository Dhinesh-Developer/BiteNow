package com.kumar.Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kumar.DAO.MenuItemDao;
import com.kumar.DAO.RestaurantDao;
import com.kumar.DAOImpl.MenuItemDaoImpl;
import com.kumar.DAOImpl.RestaurantDaoImpl;
import com.kumar.Models.MenuItem;
import com.kumar.Models.Restaurant;

@WebServlet("/restaurantDetails")
public class RestaurantMenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int rId = Integer.parseInt(req.getParameter("id"));
		
		RestaurantDao rdao = new RestaurantDaoImpl();
		MenuItemDao mdao = new MenuItemDaoImpl();
		
		Restaurant restaurant = rdao.getRestaurantById(rId);
		List<MenuItem> menuItems = mdao.getMenuItemByRestaurnantId(rId);
		
		req.setAttribute("restaurant", restaurant);
		req.setAttribute("menuItems", menuItems);
		
		RequestDispatcher rd = req.getRequestDispatcher("RestaurantMenu.jsp");
		rd.forward(req, resp);
	}
}
