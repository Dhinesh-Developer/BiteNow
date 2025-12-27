<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.kumar.Models.Restaurant, com.kumar.Models.MenuItem, com.kumar.Models.UserModel" %>
<%
    Restaurant restaurant = (Restaurant) request.getAttribute("restaurant");
    List<MenuItem> items = (List<MenuItem>) request.getAttribute("menuItems");
    
    HttpSession sessionObj = request.getSession(false);
    UserModel user = (sessionObj != null) ? (UserModel) sessionObj.getAttribute("user") : null;
    String username = (user != null && user.getName() != null) ? user.getName() : "kumar";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= restaurant.getName() %> - BiteNow</title>
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
        
        /* Restaurant Hero */
        .restaurant-hero {
            background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)), 
                        url('<%= restaurant.getImage_url() != null ? restaurant.getImage_url() : "https://images.pexels.com/photos/67468/pexels-photo-67468.jpeg" %>');
            background-size: cover;
            background-position: center;
            color: white;
            padding: 60px 5%;
            position: relative;
        }
        
        .back-button {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            color: white;
            text-decoration: none;
            font-weight: 600;
            margin-bottom: 30px;
            padding: 10px 20px;
            background-color: rgba(0,0,0,0.5);
            border-radius: 8px;
            transition: background-color 0.3s;
        }
        
        .back-button:hover {
            background-color: rgba(0,0,0,0.8);
        }
        
        .restaurant-header {
            max-width: 800px;
        }
        
        .restaurant-name {
            font-size: 48px;
            font-weight: 700;
            margin-bottom: 15px;
        }
        
        .restaurant-meta {
            display: flex;
            align-items: center;
            gap: 20px;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }
        
        .restaurant-rating {
            background-color: var(--bite-green);
            color: white;
            padding: 8px 15px;
            border-radius: 8px;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        .restaurant-cuisine {
            font-size: 18px;
            background-color: rgba(255,255,255,0.2);
            padding: 8px 15px;
            border-radius: 20px;
        }
        
        .restaurant-details {
            display: flex;
            gap: 30px;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }
        
        .detail-item {
            display: flex;
            align-items: center;
            gap: 10px;
            color: rgba(255,255,255,0.9);
        }
        
        .detail-item i {
            color: var(--bite-orange);
        }
        
        .restaurant-description {
            font-size: 16px;
            line-height: 1.6;
            opacity: 0.9;
            margin-top: 20px;
        }
        
        /* Menu Section */
        .menu-section {
            padding: 40px 5%;
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .section-title {
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 30px;
            color: var(--bite-dark);
        }
        
        .menu-filters {
            display: flex;
            gap: 15px;
            margin-bottom: 30px;
            overflow-x: auto;
            padding-bottom: 10px;
        }
        
        .filter-btn {
            padding: 10px 25px;
            background: white;
            border: 2px solid #e0e0e0;
            border-radius: 25px;
            color: var(--bite-dark);
            font-weight: 500;
            cursor: pointer;
            white-space: nowrap;
            transition: all 0.3s;
        }
        
        .filter-btn:hover {
            border-color: var(--bite-orange);
            color: var(--bite-orange);
        }
        
        .filter-btn.active {
            background-color: var(--bite-orange);
            color: white;
            border-color: var(--bite-orange);
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
            border-color: var(--bite-orange);
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
            color: var(--bite-dark);
        }
        
        .item-price {
            font-size: 18px;
            font-weight: 600;
            color: var(--bite-orange);
        }
        
        .item-description {
            color: var(--bite-gray);
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
            color: var(--bite-orange);
            background-color: #FFF5EB;
            padding: 4px 10px;
            border-radius: 20px;
            font-weight: 500;
        }
        
        .add-to-cart-btn {
            background-color: var(--bite-orange);
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
            border: 2px solid var(--bite-orange);
            background: white;
            color: var(--bite-orange);
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
        
        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 60px 20px;
            grid-column: 1 / -1;
        }
        
        .empty-icon {
            font-size: 60px;
            color: #ccc;
            margin-bottom: 20px;
        }
        
        .empty-text {
            color: var(--bite-gray);
            font-size: 18px;
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
            color: var(--bite-dark);
        }
        
        .cart-total span {
            color: var(--bite-orange);
        }
        
        .checkout-btn {
            background-color: var(--bite-orange);
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
                font-size: 32px;
            }
            
            .restaurant-meta {
                flex-direction: column;
                align-items: flex-start;
                gap: 10px;
            }
            
            .menu-filters {
                flex-wrap: wrap;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="header-content">
            <a href="rest" class="logo">
                <i class="fas fa-arrow-left"></i>
                <span>BiteNow</span>
            </a>
            
            <div class="user-menu">
                <a href="rest" class="nav-icon">
                    <i class="fas fa-home"></i>
                    <span>Home</span>
                </a>
                <a href="cart.jsp" class="nav-icon">
                    <i class="fas fa-shopping-cart"></i>
                    <span>Cart</span>
                    <span class="badge" id="cartCount">0</span>
                </a>
                <div class="user-profile">
                    <div class="profile-img">
                        <%= username.charAt(0) %>
                    </div>
                    <span><%= username %></span>
                </div>
            </div>
        </div>
    </header>
    
    <!-- Restaurant Hero Section -->
    <div class="restaurant-hero">
        <a href="rest" class="back-button">
            <i class="fas fa-arrow-left"></i> Back to Restaurants
        </a>
        
        <div class="restaurant-header">
            <h1 class="restaurant-name"><%= restaurant.getName() %></h1>
            
            <div class="restaurant-meta">
                <span class="restaurant-rating">
                    <i class="fas fa-star"></i> <%= restaurant.getRating() != 0.0 ? restaurant.getRating() : "4.0" %>
                </span>
                <span class="restaurant-cuisine"><%= restaurant.getCuisine_type() != null ? restaurant.getCuisine_type() : "Multi-cuisine" %></span>
            </div>
            
            <div class="restaurant-details">
                <div class="detail-item">
                    <i class="fas fa-clock"></i>
                    <span>30-40 mins • Free Delivery</span>
                </div>
                <div class="detail-item">
                    <i class="fas fa-rupee-sign"></i>
                    <span>₹600 for two</span>
                </div>
                <div class="detail-item">
                    <i class="fas fa-map-marker-alt"></i>
                    <span><%= restaurant.getAddress() != null ? restaurant.getAddress() : "Bangalore" %></span>
                </div>
            </div>
            
            <p class="restaurant-description">
                <%= restaurant.getDescription() != null ? restaurant.getDescription() : "Delicious food served with love and care." %>
            </p>
        </div>
    </div>
    
    <!-- Menu Section -->
    <section class="menu-section">
        <h2 class="section-title">Menu</h2>
        
        <% if (items != null && !items.isEmpty()) { 
            // Get unique categories
            java.util.Set<String> categories = new java.util.HashSet<>();
            for (MenuItem item : items) {
                if (item.getCategory() != null) {
                    categories.add(item.getCategory());
                }
            }
            
            if (!categories.isEmpty()) {
        %>
        <div class="menu-filters" id="menuFilters">
            <button class="filter-btn active" onclick="filterMenu('all')">All</button>
            <% for (String category : categories) { %>
            <button class="filter-btn" onclick="filterMenu('<%= category %>')"><%= category %></button>
            <% } %>
        </div>
        <% } %>
        
        <div class="menu-items" id="menuItems">
            <% for (MenuItem item : items) { %>
            <div class="menu-item-card" data-category="<%= item.getCategory() != null ? item.getCategory() : "Other" %>">
                <% if (item.getImage_url() != null && !item.getImage_url().isEmpty()) { %>
                <img src="<%= item.getImage_url() %>" alt="<%= item.getName() %>" class="item-image">
                <% } else { %>
                <div class="item-image" style="background: linear-gradient(135deg, #FFE8D6 0%, #FFF5EB 100%); display: flex; align-items: center; justify-content: center;">
                    <i class="fas fa-utensils" style="font-size: 40px; color: var(--bite-orange);"></i>
                </div>
                <% } %>
                
                <div class="item-details">
                    <div class="item-header">
                        <h3 class="item-name"><%= item.getName() %></h3>
                        <span class="item-price">₹<%= item.getPrice() %></span>
                    </div>
                    <p class="item-description">
                        <%= item.getDescription() != null ? item.getDescription() : "Delicious and flavorful dish" %>
                    </p>
                    <div class="item-actions">
                        <span class="item-category"><%= item.getCategory() != null ? item.getCategory() : "Main Course" %></span>
                        <div class="quantity-controls" id="controls-<%= item.getItem_id() %>" style="display: none;">
                            <button class="quantity-btn minus" onclick="updateQuantity(<%= item.getItem_id() %>, -1)">-</button>
                            <span class="quantity" id="quantity-<%= item.getItem_id()%>">1</span>
                            <button class="quantity-btn plus" onclick="updateQuantity(<%= item.getItem_id() %>, 1)">+</button>
                        </div>
                        <button class="add-to-cart-btn" onclick="addToCart(<%= item.getItem_id() %>, '<%= item.getName().replace("'", "\\'") %>', <%= item.getPrice() %>)" id="btn-<%= item.getItem_id() %>">
                            <i class="fas fa-plus"></i> ADD
                        </button>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
        <% } else { %>
        <div class="empty-state">
            <div class="empty-icon">
                <i class="fas fa-utensils"></i>
            </div>
            <h3 class="empty-text">No menu items available</h3>
            <p>This restaurant hasn't added any menu items yet.</p>
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
        
        // Update cart display
        function updateCartDisplay() {
            let totalItems = 0;
            let totalPrice = 0;
            
            Object.values(cart).forEach(item => {
                totalItems += item.quantity;
                totalPrice += item.quantity * item.price;
            });
            
            document.getElementById('cartCount').textContent = totalItems;
            document.getElementById('totalItems').textContent = totalItems;
            document.getElementById('totalPrice').textContent = totalPrice.toFixed(2);
            
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
            
            localStorage.setItem('cart', JSON.stringify(cart));
        }
        
        // Add item to cart
        function addToCart(itemId, itemName, price) {
            if (!cart[itemId]) {
                cart[itemId] = {
                    name: itemName,
                    price: price,
                    quantity: 1,
                    restaurantId: <%= restaurant.getRestaurant_id() %>,
                    restaurantName: '<%= restaurant.getName().replace("'", "\\'") %>'
                };
            } else {
                cart[itemId].quantity++;
            }
            
            updateCartDisplay();
            showNotification(`${itemName} added to cart!`);
        }
        
        // Update quantity
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
        
        // Proceed to checkout
        function proceedToCheckout() {
            fetch('cart?action=save', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(cart)
            })
            .then(() => {
                window.location.href = 'cart.jsp';
            })
            .catch(error => {
                console.error('Error:', error);
                showNotification('Error saving cart. Please try again.', 'error');
            });
        }
        
        // Filter menu by category
        function filterMenu(category) {
            // Update active filter button
            document.querySelectorAll('.filter-btn').forEach(btn => {
                btn.classList.remove('active');
            });
            event.target.classList.add('active');
            
            // Filter menu items
            const items = document.querySelectorAll('.menu-item-card');
            items.forEach(item => {
                if (category === 'all' || item.dataset.category === category) {
                    item.style.display = 'flex';
                } else {
                    item.style.display = 'none';
                }
            });
        }
        
        // Show notification
        function showNotification(message, type = 'success') {
            const notification = document.createElement('div');
            notification.style.cssText = `
                position: fixed;
                top: 20px;
                right: 20px;
                background: ${type === 'error' ? 'var(--bite-red)' : 'var(--bite-orange)'};
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
                <i class="fas fa-${type === 'error' ? 'exclamation-circle' : 'check-circle'}"></i>
                <span>${message}</span>
            `;
            
            document.body.appendChild(notification);
            
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
            
            .badge {
                position: absolute;
                top: -5px;
                right: -5px;
                background-color: var(--bite-orange);
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
            
            .nav-icon {
                position: relative;
            }
        `;
        document.head.appendChild(style);
        
        // Initialize
        updateCartDisplay();
    </script>
</body>
</html>