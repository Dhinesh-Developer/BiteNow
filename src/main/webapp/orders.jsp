<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.kumar.Models.Order, com.kumar.Models.UserModel, java.text.SimpleDateFormat" %>
<%
    
    List<Order> orders = (List<Order>) request.getAttribute("orders");
    SimpleDateFormat sdf = new SimpleDateFormat("dd MMM yyyy, hh:mm a");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Orders - BiteNow</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --bite-orange: #FC8019;
            --bite-dark: #282C3F;
            --bite-gray: #686B78;
            --bite-light: #F8F8F8;
            --bite-green: #48C479;
            --bite-red: #FF6161;
            --bite-yellow: #FFA700;
            --bite-blue: #60B5CC;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Montserrat', sans-serif;
        }
        
        body {
            background-color: #fff;
            color: var(--bite-dark);
        }
        
        /* Header */
        .header {
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            padding: 15px 5%;
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        
        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .logo {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 24px;
            font-weight: 700;
            color: var(--bite-orange);
            text-decoration: none;
        }
        
        .logo i {
            font-size: 28px;
        }
        
        .user-menu {
            display: flex;
            align-items: center;
            gap: 25px;
        }
        
        .nav-icon {
            display: flex;
            flex-direction: column;
            align-items: center;
            color: var(--bite-dark);
            text-decoration: none;
            font-size: 12px;
            gap: 5px;
            transition: color 0.3s;
        }
        
        .nav-icon i {
            font-size: 20px;
        }
        
        .nav-icon:hover {
            color: var(--bite-orange);
        }
        
        .user-profile {
            display: flex;
            align-items: center;
            gap: 10px;
            cursor: pointer;
        }
        
        .profile-img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: var(--bite-orange);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
        }
        
        /* Orders Container */
        .orders-container {
            padding: 40px 5%;
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .orders-header {
            margin-bottom: 40px;
        }
        
        .orders-title {
            font-size: 32px;
            font-weight: 700;
            color: var(--bite-dark);
            margin-bottom: 10px;
        }
        
        .orders-subtitle {
            color: var(--bite-gray);
            font-size: 16px;
        }
        
        /* Orders Grid */
        .orders-grid {
            display: flex;
            flex-direction: column;
            gap: 25px;
        }
        
        .order-card {
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            transition: all 0.3s;
            border-left: 5px solid var(--bite-orange);
        }
        
        .order-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }
        
        .order-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 20px;
            padding-bottom: 20px;
            border-bottom: 1px solid #eee;
        }
        
        .order-info h3 {
            font-size: 20px;
            font-weight: 600;
            color: var(--bite-dark);
            margin-bottom: 8px;
        }
        
        .order-id {
            color: var(--bite-gray);
            font-size: 14px;
            margin-bottom: 5px;
        }
        
        .order-date {
            color: var(--bite-gray);
            font-size: 14px;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        .order-status {
            padding: 8px 16px;
            border-radius: 20px;
            font-weight: 600;
            font-size: 14px;
            text-transform: uppercase;
        }
        
        .status-pending { background-color: #FFF5EB; color: var(--bite-orange); }
        .status-confirmed { background-color: #E8F5E9; color: var(--bite-green); }
        .status-preparing { background-color: #E3F2FD; color: var(--bite-blue); }
        .status-delivered { background-color: #E8F5E9; color: var(--bite-green); }
        .status-cancelled { background-color: #FFEBEE; color: var(--bite-red); }
        .status-out_for_delivery { background-color: #FFF3E0; color: var(--bite-yellow); }
        
        .order-details {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 30px;
            margin-bottom: 25px;
        }
        
        .order-restaurant {
            display: flex;
            align-items: center;
            gap: 15px;
            margin-bottom: 20px;
        }
        
        .restaurant-icon {
            width: 50px;
            height: 50px;
            background-color: var(--bite-light);
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--bite-orange);
        }
        
        .restaurant-info h4 {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 5px;
        }
        
        .restaurant-address {
            color: var(--bite-gray);
            font-size: 14px;
        }
        
        .order-summary {
            background-color: var(--bite-light);
            padding: 20px;
            border-radius: 10px;
        }
        
        .summary-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 12px;
        }
        
        .summary-label {
            color: var(--bite-gray);
        }
        
        .summary-value {
            font-weight: 500;
        }
        
        .summary-total {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 15px;
            padding-top: 15px;
            border-top: 2px solid var(--bite-dark);
        }
        
        .total-label {
            font-weight: 700;
            color: var(--bite-dark);
        }
        
        .total-value {
            font-size: 18px;
            font-weight: 700;
            color: var(--bite-orange);
        }
        
        .order-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-top: 20px;
            border-top: 1px solid #eee;
        }
        
        .delivery-info {
            display: flex;
            align-items: center;
            gap: 15px;
        }
        
        .delivery-address {
            color: var(--bite-gray);
            font-size: 14px;
        }
        
        .payment-info {
            display: flex;
            align-items: center;
            gap: 10px;
            color: var(--bite-gray);
            font-size: 14px;
        }
        
        .action-buttons {
            display: flex;
            gap: 15px;
        }
        
        .action-btn {
            padding: 10px 20px;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: all 0.3s;
            text-decoration: none;
            border: none;
            font-size: 14px;
        }
        
        .btn-primary {
            background-color: var(--bite-orange);
            color: white;
        }
        
        .btn-primary:hover {
            background-color: #e57200;
        }
        
        .btn-secondary {
            background-color: white;
            color: var(--bite-dark);
            border: 2px solid var(--bite-dark);
        }
        
        .btn-secondary:hover {
            background-color: var(--bite-dark);
            color: white;
        }
        
        .btn-danger {
            background-color: white;
            color: var(--bite-red);
            border: 2px solid var(--bite-red);
        }
        
        .btn-danger:hover {
            background-color: var(--bite-red);
            color: white;
        }
        
        /* Empty Orders */
        .empty-orders {
            text-align: center;
            padding: 80px 20px;
        }
        
        .empty-icon {
            font-size: 80px;
            color: #ccc;
            margin-bottom: 20px;
        }
        
        .empty-title {
            font-size: 28px;
            color: var(--bite-dark);
            margin-bottom: 10px;
        }
        
        .empty-message {
            color: var(--bite-gray);
            margin-bottom: 30px;
            font-size: 16px;
        }
        
        .order-now {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            background-color: var(--bite-orange);
            color: white;
            padding: 15px 30px;
            border-radius: 10px;
            text-decoration: none;
            font-weight: 600;
            transition: background-color 0.3s;
        }
        
        .order-now:hover {
            background-color: #e57200;
        }
        
        /* Payment Status Badge */
        .payment-status {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 12px;
            font-size: 12px;
            font-weight: 600;
            margin-left: 10px;
        }
        
        .payment-pending { background-color: #FFF5EB; color: var(--bite-orange); }
        .payment-completed { background-color: #E8F5E9; color: var(--bite-green); }
        .payment-failed { background-color: #FFEBEE; color: var(--bite-red); }
        
        /* Message Styles */
        .message-box {
            background-color: #E8F5E9;
            color: var(--bite-green);
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .error-box {
            background-color: #FFEBEE;
            color: var(--bite-red);
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .order-details {
                grid-template-columns: 1fr;
            }
            
            .order-header {
                flex-direction: column;
                gap: 15px;
            }
            
            .order-actions {
                flex-direction: column;
                gap: 15px;
                align-items: flex-start;
            }
            
            .action-buttons {
                width: 100%;
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="header-content">
            <a href="rest" class="logo">
                <i class="fas fa-utensils"></i> BiteNow
            </a>
            
            <div class="user-menu">
                <a href="rest" class="nav-icon">
                    <i class="fas fa-home"></i>
                    <span>Home</span>
                </a>
                <a href="cart" class="nav-icon">
                    <i class="fas fa-shopping-cart"></i>
                    <span>Cart</span>
                </a>
               
            </div>
        </div>
    </header>
    
    <!-- Orders Container -->
    <div class="orders-container">
        <div class="orders-header">
            <h1 class="orders-title">My Orders</h1>
            <p class="orders-subtitle">Track your food delivery orders</p>
        </div>
        
        <% 
            String message = (String) session.getAttribute("message");
            String error = (String) session.getAttribute("error");
            
            if (message != null) {
        %>
        <div class="message-box">
            <i class="fas fa-check-circle"></i> <%= message %>
        </div>
        <%
            // Clear the message after displaying
            session.removeAttribute("message");
            } 
        %>
        
        <% if (error != null) { %>
        <div class="error-box">
            <i class="fas fa-exclamation-circle"></i> <%= error %>
        </div>
        <%
            // Clear the error after displaying
            session.removeAttribute("error");
            } 
        %>
        
        <% if (orders != null && !orders.isEmpty()) { %>
        <div class="orders-grid">
            <% for (Order order : orders) { 
                String status = (order.getStatus() != null) ? order.getStatus().toLowerCase() : "pending";
                String paymentStatus = (order.getPayment_status() != null) ? order.getPayment_status().toLowerCase() : "pending";
                String statusClass = "status-" + status.replace(" ", "_");
                String paymentStatusClass = "payment-" + paymentStatus;
                String restaurantName = (order.getRestaurant_name() != null) ? order.getRestaurant_name() : "Restaurant";
                String deliveryAddress = (order.getDelivery_address() != null) ? order.getDelivery_address() : "Address not specified";
                String paymentMethod = (order.getPayment_method() != null) ? order.getPayment_method() : "Cash on Delivery";
                
                // Calculate breakdown values
                double itemsTotal = order.getTotal_amount() - 40 - (order.getTotal_amount() * 0.05);
                if (itemsTotal < 0) itemsTotal = 0;
            %>
            <div class="order-card">
                <!-- Order Header -->
                <div class="order-header">
                    <div class="order-info">
                        <h3>Order #<%= order.getOrder_id() %></h3>
                        <p class="order-id">Order ID: <%= order.getOrder_id() %></p>
                        <% if (order.getOrder_date() != null) { %>
                        <p class="order-date">
                            <i class="far fa-calendar"></i>
                            <%= sdf.format(order.getOrder_date()) %>
                        </p>
                        <% } else { %>
                        <p class="order-date">
                            <i class="far fa-calendar"></i>
                            Date not available
                        </p>
                        <% } %>
                    </div>
                    <div>
                        <span class="order-status <%= statusClass %>">
                            <%= status.toUpperCase() %>
                        </span>
                        <span class="payment-status <%= paymentStatusClass %>">
                            <%= paymentStatus.toUpperCase() %>
                        </span>
                    </div>
                </div>
                
                <!-- Order Details -->
                <div class="order-details">
                    <div>
                        <div class="order-restaurant">
                            <div class="restaurant-icon">
                                <i class="fas fa-store"></i>
                            </div>
                            <div class="restaurant-info">
                                <h4><%= restaurantName %></h4>
                                <p class="restaurant-address">Delivery Address: <%= deliveryAddress %></p>
                            </div>
                        </div>
                        
                        <div class="payment-info">
                            <i class="fas fa-credit-card"></i>
                            <span>Payment: <%= paymentMethod.toUpperCase() %> • <%= paymentStatus.toUpperCase() %></span>
                        </div>
                    </div>
                    
                    <div class="order-summary">
                        <h4 style="margin-bottom: 20px; color: var(--bite-dark);">Order Summary</h4>
                        <div class="summary-row">
                            <span class="summary-label">Items Total</span>
                            <span class="summary-value">₹<%= String.format("%.2f", itemsTotal) %></span>
                        </div>
                        <div class="summary-row">
                            <span class="summary-label">Delivery Fee</span>
                            <span class="summary-value">₹40.00</span>
                        </div>
                        <div class="summary-row">
                            <span class="summary-label">Tax & Charges</span>
                            <span class="summary-value">₹<%= String.format("%.2f", order.getTotal_amount() * 0.05) %></span>
                        </div>
                        <div class="summary-total">
                            <span class="total-label">Total Amount</span>
                            <span class="total-value">₹<%= String.format("%.2f", order.getTotal_amount()) %></span>
                        </div>
                    </div>
                </div>
                
                <!-- Order Actions -->
                <div class="order-actions">
                    <div class="delivery-info">
                        <i class="fas fa-truck"></i>
                        <span class="delivery-address">Delivered to: <%= deliveryAddress %></span>
                    </div>
                    
                    <div class="action-buttons">
                        <% if ("pending".equals(status)) { %>
                        <form action="orders" method="post" onsubmit="return confirm('Are you sure you want to cancel this order?');">
                            <input type="hidden" name="action" value="cancel">
                            <input type="hidden" name="orderId" value="<%= order.getOrder_id() %>">
                            <button type="submit" class="action-btn btn-danger">
                                <i class="fas fa-times"></i> Cancel Order
                            </button>
                        </form>
                        <% } %>
                        
                        <a href="rest" class="action-btn btn-primary">
                            <i class="fas fa-utensils"></i> Order Again
                        </a>
                        
                        <button class="action-btn btn-secondary" onclick="showOrderDetails(<%= order.getOrder_id() %>)">
                            <i class="fas fa-eye"></i> View Details
                        </button>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
        <% } else { %>
        <!-- Empty Orders -->
        <div class="empty-orders">
            <div class="empty-icon">
                <i class="fas fa-clipboard-list"></i>
            </div>
            <h2 class="empty-title">No orders yet</h2>
            <p class="empty-message">You haven't placed any orders. Start ordering delicious food!</p>
            <a href="rest" class="order-now">
                <i class="fas fa-utensils"></i> Order Now
            </a>
        </div>
        <% } %>
    </div>
    
    <script>
        // Show order details
        function showOrderDetails(orderId) {
            alert('Order details for Order #' + orderId + ' would open here.');
            // In a real app, this would open a modal or redirect to order details page
            // window.location.href = 'order-details.jsp?orderId=' + orderId;
        }
        
        // Cancel order confirmation
        document.querySelectorAll('form[action="orders"]').forEach(form => {
            form.addEventListener('submit', function(e) {
                const orderId = this.querySelector('input[name="orderId"]').value;
                if (!confirm('Are you sure you want to cancel Order #' + orderId + '?')) {
                    e.preventDefault();
                }
            });
        });
        
        // Auto-remove messages after 5 seconds
        setTimeout(() => {
            const messageBox = document.querySelector('.message-box');
            const errorBox = document.querySelector('.error-box');
            
            if (messageBox) {
                messageBox.style.transition = 'opacity 0.5s';
                messageBox.style.opacity = '0';
                setTimeout(() => messageBox.remove(), 500);
            }
            
            if (errorBox) {
                errorBox.style.transition = 'opacity 0.5s';
                errorBox.style.opacity = '0';
                setTimeout(() => errorBox.remove(), 500);
            }
        }, 5000);
    </script>
</body>
</html>