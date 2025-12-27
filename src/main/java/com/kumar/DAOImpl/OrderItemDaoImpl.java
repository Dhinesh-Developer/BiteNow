package com.kumar.DAOImpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.kumar.DAO.OrderItemDao;
import com.kumar.Models.OrderItem;

public class OrderItemDaoImpl implements OrderItemDao {
    
    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/swiggy_clone", 
            "root", 
            "yourpassword"
        );
    }
    
    @Override
    public int createOrderItem(OrderItem orderItem) {
        String sql = "INSERT INTO order_items (order_id, item_id, item_name, price, quantity) VALUES (?, ?, ?, ?, ?)";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            pstmt.setInt(1, orderItem.getOrder_id());
            pstmt.setInt(2, orderItem.getItem_id());
            pstmt.setString(3, orderItem.getItem_name());
            pstmt.setDouble(4, orderItem.getPrice());
            pstmt.setInt(5, orderItem.getQuantity());
            
            int affectedRows = pstmt.executeUpdate();
            
            if (affectedRows > 0) {
                try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        return generatedKeys.getInt(1);
                    }
                }
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
}