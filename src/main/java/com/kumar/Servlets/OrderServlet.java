package com.kumar.Servlets;

import com.kumar.DAOImpl.OrderDaoImpl;
import com.kumar.Models.Order;
import com.kumar.Models.UserModel;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/orders")
public class OrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        UserModel user = (UserModel) session.getAttribute("user");
        OrderDaoImpl orderDao = new OrderDaoImpl();
        
        // Get user's orders
        List<Order> orders = orderDao.getOrdersByUserId(user.getuId());
        
        request.setAttribute("orders", orders);
        RequestDispatcher rd = request.getRequestDispatcher("orders.jsp");
        rd.forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        UserModel user = (UserModel) session.getAttribute("user");
        OrderDaoImpl orderDao = new OrderDaoImpl();
        
        String action = request.getParameter("action");
        
        if ("cancel".equals(action)) {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            boolean success = orderDao.cancelOrder(orderId, user.getuId());
            
            if (success) {
                session.setAttribute("message", "Order cancelled successfully!");
            } else {
                session.setAttribute("error", "Failed to cancel order!");
            }
            
            // Redirect back to orders page
            response.sendRedirect("orders");
        }
    }
}