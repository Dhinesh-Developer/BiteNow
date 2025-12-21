<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.kumar.Models.Restaurant, com.kumar.Models.MenuItem" %>
<%
    Restaurant restaurant = (Restaurant) request.getAttribute("restaurant");
    List<MenuItem> items = (List<MenuItem>) request.getAttribute("menuItems");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= restaurant.getName() %> - Menu</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --swiggy-orange: #FC8019;
            --swiggy-dark: #282C3F;
            --swiggy-gray: #686B78;
            --swiggy-light: #F8F8F8;
            --swiggy-green: #48C479;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Montserrat', sans-serif;
        }
        
        body {
            background-color: #fff;
            color: var(--swiggy-dark);
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
            color: var(--swiggy-orange);
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
            color: var(--swiggy-dark);
            text-decoration: none;
            font-size: 12px;
            gap: 5px;
            transition: color 0.3s;
        }
        
        .nav-icon i {
            font-size: 20px;
        }
        
        .nav-icon:hover {
            color: var(--swiggy-orange);
        }
        
        .cart-badge {
            position: relative;
        }
        
        .badge {
            position: absolute;
            top: -5px;
            right: -5px;
            background-color: var(--swiggy-orange);
            color: white;
            width: 20px;
            height: 20px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 12px;
            font-weight: 600;
        }
        
        /* Restaurant Header */
        .restaurant-header {
            padding: 30px 5%;
            background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)), url('<%= restaurant.getImage_url() %>');
            background-size: cover;
            background-position: center;
            color: white;
        }
        
        .restaurant-info {
            max-width: 800px;
        }
        
        .restaurant-name {
            font-size: 36px;
            font-weight: 700;
            margin-bottom: 10px;
        }
        
        .restaurant-meta {
            display: flex;
            align-items: center;
            gap: 20px;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }
        
        .restaurant-rating {
            background-color: var(--swiggy-green);
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 5px;
        }
        
        .restaurant-cuisine {
            font-size: 18px;
            opacity: 0.9;
        }
        
        .restaurant-address {
            margin-bottom: 20px;
            opacity: 0.9;
        }
        
        .restaurant-details {
            display: flex;
            gap: 30px;
            flex-wrap: wrap;
        }
        
        .detail-item {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .detail-item i {
            color: var(--swiggy-orange);
        }
        
        /* Menu Section */
        .menu-section {
            padding: 40px 5%;
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .menu-category {
            margin-bottom: 50px;
        }
        
        .category-title {
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 25px;
            padding-bottom: 10px;
            border-bottom: 2px solid #eee;
            color: var(--swiggy-dark);
        }
        
        .menu-items {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
            gap: 30px;
        }
        
        .menu-item-card {
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            display: flex;
            gap: 20px;
            transition: all 0.3s;
            border: 1px solid transparent;
        }
        
        .menu-item-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            border-color: var(--swiggy-orange);
        }
        
        .item-image {
            width: 120px;
            height: 120px;
            border-radius: 10px;
            object-fit: cover;
            flex-shrink: 0;
        }
        
        .item-details {
            flex: 1;
        }
        
        .item-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 10px;
        }
        
        .item-name {
            font-size: 18px;
            font-weight: 600;
            color: var(--swiggy-dark);
        }
        
        .item-price {
            font-size: 18px;
            font-weight: 600;
            color: var(--swiggy-orange);
        }
        
        .item-description {
            color: var(--swiggy-gray);
            margin-bottom: 15px;
            font-size: 14px;
            line-height: 1.5;
        }
        
        .item-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .item-category {
            font-size: 12px;
            color: var(--swiggy-orange);
            background-color: #FFF5EB;
            padding: 4px 10px;
            border-radius: 20px;
            font-weight: 500;
        }
        
        .add-to-cart-btn {
            background-color: var(--swiggy-orange);
            color: white;
            border: none;
            padding: 10px 25px;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        .add-to-cart-btn:hover {
            background-color: #e57200;
        }
        
        .quantity-controls {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .quantity-btn {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            border: 2px solid var(--swiggy-orange);
            background: white;
            color: var(--swiggy-orange);
            font-size: 18px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .quantity {
            font-weight: 600;
            min-width: 30px;
            text-align: center;
        }
        
        /* Cart Summary */
        .cart-summary {
            position: fixed;
            bottom: 0;
            left: 0;
            right: 0;
            background: white;
            box-shadow: 0 -2px 20px rgba(0,0,0,0.1);
            padding: 20px 5%;
            display: none;
            z-index: 1000;
        }
        
        .cart-summary.active {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .cart-total {
            font-size: 20px;
            font-weight: 600;
            color: var(--swiggy-dark);
        }
        
        .cart-total span {
            color: var(--swiggy-orange);
        }
        
        .checkout-btn {
            background-color: var(--swiggy-orange);
            color: white;
            border: none;
            padding: 15px 40px;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        
        .checkout-btn:hover {
            background-color: #e57200;
        }
        
        /* Back Button */
        .back-button {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            color: var(--swiggy-orange);
            text-decoration: none;
            font-weight: 600;
            margin-top: 20px;
            padding: 10px 20px;
            border-radius: 8px;
            background-color: #FFF5EB;
            transition: all 0.3s;
        }
        
        .back-button:hover {
            background-color: #FFE8D6;
        }
        
        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 60px 20px;
        }
        
        .empty-icon {
            font-size: 60px;
            color: #ccc;
            margin-bottom: 20px;
        }
        
        .empty-text {
            color: var(--swiggy-gray);
            font-size: 18px;
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .menu-items {
                grid-template-columns: 1fr;
            }
            
            .menu-item-card {
                flex-direction: column;
            }
            
            .item-image {
                width: 100%;
                height: 200px;
            }
            
            .restaurant-name {
                font-size: 28px;
            }
            
            .restaurant-meta {
                flex-direction: column;
                align-items: flex-start;
                gap: 10px;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="header-content">
            <a href="restaurants" class="logo">
                <i class="fas fa-arrow-left"></i>
                <span>Back to Restaurants</span>
            </a>
            
            <div class="user-menu">
                <a href="home.jsp" class="nav-icon">
                    <i class="fas fa-home"></i>
                    <span>Home</span>
                </a>
                <a href="cart.jsp" class="nav-icon cart-badge">
                    <i class="fas fa-shopping-cart"></i>
                    <span>Cart</span>
                    <span class="badge" id="cartCount">0</span>
                </a>
            </div>
        </div>
    </header>
    
    <!-- Restaurant Header -->
    <div class="restaurant-header">
        <div class="restaurant-info">
            <h1 class="restaurant-name"><%= restaurant.getName() %></h1>
            <div class="restaurant-meta">
                <span class="restaurant-rating">
                    <i class="fas fa-star"></i> <%= restaurant.getRating() %>
                </span>
                <span class="restaurant-cuisine"><%= restaurant.getCuisine_type() %></span>
            </div>
            <p class="restaurant-address"><%= restaurant.getAddress() %></p>
            <div class="restaurant-details">
                <div class="detail-item">
                    <i class="fas fa-clock"></i>
                    <span>30-40 mins</span>
                </div>
                <div class="detail-item">
                    <i class="fas fa-rupee-sign"></i>
                    <span>₹600 for two</span>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Menu Section -->
    <section class="menu-section">
        <%
            if (items != null && !items.isEmpty()) {
                // Group items by category
                java.util.Map<String, java.util.List<MenuItem>> categoryMap = new java.util.HashMap<>();
                for (MenuItem item : items) {
                    categoryMap.computeIfAbsent(item.getCategory(), k -> new java.util.ArrayList<>()).add(item);
                }
                
                for (java.util.Map.Entry<String, java.util.List<MenuItem>> entry : categoryMap.entrySet()) {
        %>
        <div class="menu-category">
            <h2 class="category-title"><%= entry.getKey() %></h2>
            <div class="menu-items">
                <% for (MenuItem item : entry.getValue()) { %>
                <div class="menu-item-card" data-item-id="<%= item.getItem_id() %>">
                    <% if (item.getImage_url() != null && !item.getImage_url().isEmpty()) { %>
                    <img src="<%= item.getImage_url() %>" alt="<%= item.getName() %>" class="item-image">
                    <% } else { %>
                    <div class="item-image" style="background-color: #f5f5f5; display: flex; align-items: center; justify-content: center;">
                        <i class="fas fa-utensils" style="font-size: 40px; color: #ccc;"></i>
                    </div>
                    <% } %>
                    
                    <div class="item-details">
                        <div class="item-header">
                            <h3 class="item-name"><%= item.getName() %></h3>
                            <span class="item-price">₹<%= item.getPrice() %></span>
                        </div>
                        <p class="item-description"><%= item.getDescription() %></p>
                        <div class="item-actions">
                            <span class="item-category"><%= item.getCategory() %></span>
                            <div class="quantity-controls" id="controls-<%= item.getItem_id() %>" style="display: none;">
                                <button class="quantity-btn minus" onclick="updateQuantity(<%= item.getItem_id() %>, -1)">-</button>
                                <span class="quantity" id="quantity-<%= item.getItem_id() %>">1</span>
                                <button class="quantity-btn plus" onclick="updateQuantity(<%= item.getItem_id() %>, 1)">+</button>
                            </div>
                            <button class="add-to-cart-btn" onclick="addToCart(<%= item.getItem_id() %>, '<%= item.getName() %>', <%= item.getPrice() %>)" id="btn-<%= item.getItem_id() %>">
                                <i class="fas fa-plus"></i> ADD
                            </button>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
        <%
                }
            } else {
        %>
        <div class="empty-state">
            <div class="empty-icon">
                <i class="fas fa-utensils"></i>
            </div>
            <h3 class="empty-text">No menu items available</h3>
        </div>
        <% } %>
    </section>
    
    <!-- Cart Summary -->
    <div class="cart-summary" id="cartSummary">
        <div class="cart-total">
            <span id="totalItems">0</span> items • ₹<span id="totalPrice">0</span>
        </div>
        <button class="checkout-btn" onclick="proceedToCheckout()">
            <i class="fas fa-shopping-bag"></i> VIEW CART
        </button>
    </div>
    
    <script>
        let cart = JSON.parse(localStorage.getItem('cart')) || {};
        
        function updateCartDisplay() {
            // Update cart badge
            let totalItems = 0;
            let totalPrice = 0;
            
            Object.values(cart).forEach(item => {
                totalItems += item.quantity;
                totalPrice += item.quantity * item.price;
            });
            
            document.getElementById('cartCount').textContent = totalItems;
            document.getElementById('totalItems').textContent = totalItems;
            document.getElementById('totalPrice').textContent = totalPrice.toFixed(2);
            
            // Show/hide cart summary
            const cartSummary = document.getElementById('cartSummary');
            if (totalItems > 0) {
                cartSummary.classList.add('active');
            } else {
                cartSummary.classList.remove('active');
            }
            
            // Update item controls
            Object.keys(cart).forEach(itemId => {
                const controls = document.getElementById(`controls-${itemId}`);
                const button = document.getElementById(`btn-${itemId}`);
                const quantity = document.getElementById(`quantity-${itemId}`);
                
                if (controls && button && quantity) {
                    controls.style.display = 'flex';
                    button.style.display = 'none';
                    quantity.textContent = cart[itemId].quantity;
                }
            });
            
            // Save to localStorage
            localStorage.setItem('cart', JSON.stringify(cart));
        }
        
        function addToCart(itemId, itemName, price) {
            if (!cart[itemId]) {
                cart[itemId] = {
                    name: itemName,
                    price: price,
                    quantity: 1
                };
            } else {
                cart[itemId].quantity++;
            }
            
            updateCartDisplay();
            showNotification(`${itemName} added to cart!`);
        }
        
        function updateQuantity(itemId, delta) {
            if (cart[itemId]) {
                cart[itemId].quantity += delta;
                
                if (cart[itemId].quantity <= 0) {
                    delete cart[itemId];
                    const controls = document.getElementById(`controls-${itemId}`);
                    const button = document.getElementById(`btn-${itemId}`);
                    if (controls && button) {
                        controls.style.display = 'none';
                        button.style.display = 'flex';
                    }
                }
            }
            
            updateCartDisplay();
        }
        
        function proceedToCheckout() {
            // Save cart to session and redirect to cart page
            fetch('cart?action=save', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(cart)
            })
            .then(() => {
                window.location.href = 'cart.jsp';
            });
        }
        
        function showNotification(message) {
            // Create notification element
            const notification = document.createElement('div');
            notification.style.cssText = `
                position: fixed;
                top: 20px;
                right: 20px;
                background: var(--swiggy-orange);
                color: white;
                padding: 15px 25px;
                border-radius: 10px;
                box-shadow: 0 5px 15px rgba(0,0,0,0.2);
                z-index: 9999;
                animation: slideIn 0.3s ease;
                display: flex;
                align-items: center;
                gap: 10px;
            `;
            
            notification.innerHTML = `
                <i class="fas fa-check-circle"></i>
                <span>${message}</span>
            `;
            
            document.body.appendChild(notification);
            
            // Remove after 3 seconds
            setTimeout(() => {
                notification.style.animation = 'slideOut 0.3s ease';
                setTimeout(() => {
                    document.body.removeChild(notification);
                }, 300);
            }, 3000);
        }
        
        // Add CSS animations
        const style = document.createElement('style');
        style.textContent = `
            @keyframes slideIn {
                from {
                    transform: translateX(100%);
                    opacity: 0;
                }
                to {
                    transform: translateX(0);
                    opacity: 1;
                }
            }
            
            @keyframes slideOut {
                from {
                    transform: translateX(0);
                    opacity: 1;
                }
                to {
                    transform: translateX(100%);
                    opacity: 0;
                }
            }
            
            @keyframes pulse {
                0% { transform: scale(1); }
                50% { transform: scale(1.1); }
                100% { transform: scale(1); }
            }
            
            .pulse {
                animation: pulse 0.5s ease;
            }
        `;
        document.head.appendChild(style);
        
        // Initialize cart display
        updateCartDisplay();
    </script>
</body>
</html>