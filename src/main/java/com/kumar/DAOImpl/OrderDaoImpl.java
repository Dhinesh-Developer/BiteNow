package com.kumar.DAOImpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.kumar.DAO.OrderDao;
import com.kumar.Models.Order;

public class OrderDaoImpl implements OrderDao {

	private Connection getConnection() throws SQLException {
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/swiggy_clone", "root", "yourpassword");
	}

	@Override
	public int createOrder(Order order) {
		String sql = "INSERT INTO orders (user_id, restaurant_id, total_amount, status, delivery_address, payment_method, payment_status) VALUES (?, ?, ?, ?, ?, ?, ?)";

		try (Connection conn = getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

			pstmt.setInt(1, order.getUser_id());
			pstmt.setInt(2, order.getRestaurant_id());
			pstmt.setDouble(3, order.getTotal_amount());
			pstmt.setString(4, order.getStatus());
			pstmt.setString(5, order.getDelivery_address());
			pstmt.setString(6, order.getPayment_method());
			pstmt.setString(7, order.getPayment_status());

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

	@Override
	public List<Order> getOrdersByUserId(int userId) {
		List<Order> orders = new ArrayList<>();
		String sql = """
				SELECT o.*, r.name as restaurant_name
				FROM orders o
				LEFT JOIN restaurants r ON o.restaurant_id = r.restaurant_id
				WHERE o.user_id = ?
				ORDER BY o.order_date DESC
				""";

		try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setInt(1, userId);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				Order order = new Order();
				order.setOrder_id(rs.getInt("order_id"));
				order.setUser_id(rs.getInt("user_id"));
				order.setRestaurant_id(rs.getInt("restaurant_id"));
				order.setRestaurant_name(rs.getString("restaurant_name"));
				order.setTotal_amount(rs.getDouble("total_amount"));
				order.setStatus(rs.getString("status"));
				order.setDelivery_address(rs.getString("delivery_address"));
				order.setPayment_method(rs.getString("payment_method"));
				order.setPayment_status(rs.getString("payment_status"));
				order.setOrder_date(rs.getTimestamp("order_date"));

				orders.add(order);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orders;
	}

	@Override
	public Order getOrderById(int orderId) {
		String sql = """
				SELECT o.*, r.name as restaurant_name
				FROM orders o
				LEFT JOIN restaurants r ON o.restaurant_id = r.restaurant_id
				WHERE o.order_id = ?
				""";

		try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setInt(1, orderId);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				Order order = new Order();
				order.setOrder_id(rs.getInt("order_id"));
				order.setUser_id(rs.getInt("user_id"));
				order.setRestaurant_id(rs.getInt("restaurant_id"));
				order.setRestaurant_name(rs.getString("restaurant_name"));
				order.setTotal_amount(rs.getDouble("total_amount"));
				order.setStatus(rs.getString("status"));
				order.setDelivery_address(rs.getString("delivery_address"));
				order.setPayment_method(rs.getString("payment_method"));
				order.setPayment_status(rs.getString("payment_status"));
				order.setOrder_date(rs.getTimestamp("order_date"));

				return order;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean updateOrderStatus(int orderId, String status) {
		String sql = "UPDATE orders SET status = ? WHERE order_id = ?";

		try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setString(1, status);
			pstmt.setInt(2, orderId);

			return pstmt.executeUpdate() > 0;

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean cancelOrder(int orderId, int userId) {
		String sql = "UPDATE orders SET status = 'cancelled' WHERE order_id = ? AND user_id = ? AND status = 'pending'";

		try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setInt(1, orderId);
			pstmt.setInt(2, userId);

			return pstmt.executeUpdate() > 0;

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	// In OrderDaoImpl class
	@Override
	public boolean updatePaymentStatus(int orderId, String paymentStatus) {
	    String sql = "UPDATE orders SET payment_status = ? WHERE order_id = ?";
	    
	    try (Connection conn = getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        
	        pstmt.setString(1, paymentStatus);
	        pstmt.setInt(2, orderId);
	        
	        return pstmt.executeUpdate() > 0;
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	}
}