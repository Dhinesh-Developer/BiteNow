package com.kumar.DAO;

import java.util.List;
import com.kumar.Models.Order;

public interface OrderDao {
    // Create a new order
    int createOrder(Order order);
    
    // Get orders by user ID
    List<Order> getOrdersByUserId(int userId);
    
    // Get order by ID
    Order getOrderById(int orderId);
    
    // Update order status
    boolean updateOrderStatus(int orderId, String status);
    
    // Cancel order
    boolean cancelOrder(int orderId, int userId);
    
 // In OrderDao interface
    boolean updatePaymentStatus(int orderId, String paymentStatus);
}