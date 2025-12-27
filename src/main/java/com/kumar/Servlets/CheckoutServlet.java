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

import com.kumar.DAOImpl.CartDaoImpl;
import com.kumar.DAOImpl.OrderDaoImpl;
import com.kumar.DAOImpl.OrderItemDaoImpl;
import com.kumar.Models.CartItem;
import com.kumar.Models.Order;
import com.kumar.Models.OrderItem;
import com.kumar.Models.UserModel;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        UserModel user = (UserModel) session.getAttribute("user");
        CartDaoImpl cartDao = new CartDaoImpl();
        
        // Get cart items for the user
        List<CartItem> cartItems = cartDao.getCartItems(user.getuId());
        double cartTotal = cartDao.getCartTotal(user.getuId());
        
        if (cartItems.isEmpty()) {
            response.sendRedirect("cart");
            return;
        }
        
        request.setAttribute("cartItems", cartItems);
        request.setAttribute("cartTotal", cartTotal);
        
        RequestDispatcher rd = request.getRequestDispatcher("payment.jsp");
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
        
        // Get parameters from payment form
        String deliveryAddress = request.getParameter("deliveryAddress");
        String paymentMethod = request.getParameter("paymentMethod");
        int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));
        
        // Get cart details
        CartDaoImpl cartDao = new CartDaoImpl();
        List<CartItem> cartItems = cartDao.getCartItems(user.getuId());
        double totalAmount = cartDao.getCartTotal(user.getuId());
        
        if (cartItems.isEmpty()) {
            session.setAttribute("error", "Your cart is empty!");
            response.sendRedirect("cart");
            return;
        }
        
        // Create order
        Order order = new Order();
        order.setUser_id(user.getuId());
        order.setRestaurant_id(restaurantId);
        order.setTotal_amount(totalAmount + 40 + (totalAmount * 0.05)); // Add delivery and tax
        order.setStatus("pending");
        order.setDelivery_address(deliveryAddress);
        order.setPayment_method(paymentMethod);
        order.setPayment_status("pending");
        
        OrderDaoImpl orderDao = new OrderDaoImpl();
        int orderId = orderDao.createOrder(order);
        
        if (orderId > 0) {
            // Create order items
            OrderItemDaoImpl orderItemDao = new OrderItemDaoImpl();
            for (CartItem cartItem : cartItems) {
                OrderItem orderItem = new OrderItem();
                orderItem.setOrder_id(orderId);
                orderItem.setItem_id(cartItem.getItemId());
                orderItem.setItem_name(cartItem.getItemName());
                orderItem.setPrice(cartItem.getPrice());
                orderItem.setQuantity(cartItem.getQuantity());
                
                orderItemDao.createOrderItem(orderItem);
            }
            
            // Clear cart after successful order
            cartDao.clearCart(user.getuId());
            
            // Process payment
            if ("cash".equals(paymentMethod)) {
                // For cash on delivery, mark as completed
                orderDao.updateOrderStatus(orderId, "confirmed");
                orderDao.updatePaymentStatus(orderId, "completed");
                session.setAttribute("message", "Order placed successfully! Your order ID is: " + orderId);
            } else {
                // For online payment, redirect to payment gateway
                session.setAttribute("orderId", orderId);
                session.setAttribute("totalAmount", totalAmount + 40 + (totalAmount * 0.05));
                response.sendRedirect("payment-gateway.jsp");
                return;
            }
        } else {
            session.setAttribute("error", "Failed to place order. Please try again.");
        }
        
        response.sendRedirect("orders");
    }
}