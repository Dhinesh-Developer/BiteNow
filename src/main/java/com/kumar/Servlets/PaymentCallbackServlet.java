package com.kumar.Servlets;

import com.kumar.DAOImpl.OrderDaoImpl;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/paymentCallback")
public class PaymentCallbackServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        String status = request.getParameter("status");
        
        OrderDaoImpl orderDao = new OrderDaoImpl();
        
        if ("success".equals(status)) {
            orderDao.updateOrderStatus(orderId, "confirmed");
            orderDao.updatePaymentStatus(orderId, "completed");
            session.setAttribute("message", "Payment successful! Order ID: " + orderId);
        } else {
            orderDao.updateOrderStatus(orderId, "failed");
            orderDao.updatePaymentStatus(orderId, "failed");
            session.setAttribute("error", "Payment failed for Order ID: " + orderId);
        }
        
        // Clear session attributes
        session.removeAttribute("orderId");
        session.removeAttribute("totalAmount");
        
        response.sendRedirect("orders");
    }
}