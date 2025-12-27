package com.kumar.Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kumar.DAO.RestaurantDao;
import com.kumar.DAOImpl.RestaurantDaoImpl;
import com.kumar.Models.Restaurant;

@WebServlet("/rest")
public class HomeRestaurant extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        // 🔒 Session validation
        if (session == null || session.getAttribute("name") == null) {
            resp.sendRedirect("Login.jsp");
            return;
        }

        RestaurantDao rdao = new RestaurantDaoImpl();
        List<Restaurant> lists = rdao.getAllRestaurant();

        req.setAttribute("lists", lists);

        RequestDispatcher rd = req.getRequestDispatcher("Home.jsp");
        rd.forward(req, resp);
    }
}
