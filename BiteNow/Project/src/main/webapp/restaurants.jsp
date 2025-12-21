<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.kumar.Models.Restaurant" %>
<%
    List<Restaurant> restaurants = (List<Restaurant>) request.getAttribute("lists");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Restaurants - Swiggy Clone</title>
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
        
        /* Filters */
        .filters-section {
            padding: 20px 5%;
            background-color: var(--swiggy-light);
            border-bottom: 1px solid #eee;
        }
        
        .filters-container {
            display: flex;
            gap: 20px;
            overflow-x: auto;
            padding-bottom: 10px;
        }
        
        .filter-btn {
            padding: 10px 20px;
            background: white;
            border: 1px solid #e0e0e0;
            border-radius: 25px;
            color: var(--swiggy-dark);
            font-weight: 500;
            cursor: pointer;
            white-space: nowrap;
            transition: all 0.3s;
        }
        
        .filter-btn:hover {
            border-color: var(--swiggy-orange);
            color: var(--swiggy-orange);
        }
        
        .filter-btn.active {
            background-color: var(--swiggy-orange);
            color: white;
            border-color: var(--swiggy-orange);
        }
        
        /* Restaurant Count */
        .restaurant-count {
            padding: 20px 5%;
            border-bottom: 1px solid #eee;
        }
        
        .count-text {
            font-size: 20px;
            font-weight: 600;
            color: var(--swiggy-dark);
        }
        
        /* Restaurants Grid */
        .restaurants-grid {
            padding: 30px 5%;
        }
        
        .restaurant-card {
            display: flex;
            gap: 25px;
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            margin-bottom: 30px;
            transition: all 0.3s;
            text-decoration: none;
            color: inherit;
        }
        
        .restaurant-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
        }
        
        .restaurant-image {
            width: 300px;
            height: 200px;
            object-fit: cover;
            flex-shrink: 0;
        }
        
        .restaurant-info {
            flex: 1;
            padding: 25px 25px 25px 0;
        }
        
        .restaurant-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 15px;
        }
        
        .restaurant-name {
            font-size: 24px;
            font-weight: 700;
            color: var(--swiggy-dark);
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
            color: var(--swiggy-gray);
            margin-bottom: 15px;
            font-size: 16px;
        }
        
        .restaurant-description {
            color: var(--swiggy-gray);
            margin-bottom: 20px;
            line-height: 1.6;
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
            color: var(--swiggy-gray);
        }
        
        .detail-item i {
            color: var(--swiggy-orange);
        }
        
        .view-menu-btn {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            background-color: var(--swiggy-orange);
            color: white;
            padding: 12px 30px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            transition: background-color 0.3s;
        }
        
        .view-menu-btn:hover {
            background-color: #e57200;
        }
        
        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 80px 20px;
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
        
        /* Back Button */
        .back-button {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            color: var(--swiggy-orange);
            text-decoration: none;
            font-weight: 600;
            margin: 20px 5%;
            padding: 10px 20px;
            border-radius: 8px;
            background-color: #FFF5EB;
            transition: all 0.3s;
        }
        
        .back-button:hover {
            background-color: #FFE8D6;
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .restaurant-card {
                flex-direction: column;
            }
            
            .restaurant-image {
                width: 100%;
                height: 200px;
            }
            
            .restaurant-info {
                padding: 25px;
            }
            
            .restaurant-header {
                flex-direction: column;
                gap: 10px;
            }
            
            .filters-container {
                flex-wrap: wrap;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="header-content">
            <a href="home.jsp" class="logo">
                <i class="fas fa-utensils"></i> SwiggyClone
            </a>
            
            <div class="user-menu">
                <a href="home.jsp" class="nav-icon">
                    <i class="fas fa-home"></i>
                    <span>Home</span>
                </a>
                <a href="orders.jsp" class="nav-icon">
                    <i class="fas fa-clipboard-list"></i>
                    <span>Orders</span>
                </a>
                <a href="cart.jsp" class="nav-icon cart-badge">
                    <i class="fas fa-shopping-cart"></i>
                    <span>Cart</span>
                    <span class="badge" id="cartCount">0</span>
                </a>
            </div>
        </div>
    </header>
    
    <!-- Filters -->
    <section class="filters-section">
        <div class="filters-container">
            <button class="filter-btn active" onclick="filterRestaurants('all')">All</button>
            <button class="filter-btn" onclick="filterRestaurants('Italian')">Italian</button>
            <button class="filter-btn" onclick="filterRestaurants('North Indian')">North Indian</button>
            <button class="filter-btn" onclick="filterRestaurants('Chinese')">Chinese</button>
            <button class="filter-btn" onclick="filterRestaurants('Mexican')">Mexican</button>
            <button class="filter-btn" onclick="filterRestaurants('American')">American</button>
            <button class="filter-btn" onclick="filterRestaurants('South Indian')">South Indian</button>
            <button class="filter-btn" onclick="filterRestaurants('Japanese')">Japanese</button>
            <button class="filter-btn" onclick="filterRestaurants('Mediterranean')">Mediterranean</button>
            <button class="filter-btn" onclick="filterRestaurants('Barbecue')">Barbecue</button>
        </div>
    </section>
    
    <!-- Restaurant Count -->
    <div class="restaurant-count">
        <h2 class="count-text">
            <%= restaurants != null ? restaurants.size() : 0 %> restaurants
        </h2>
    </div>
    
    <!-- Restaurants Grid -->
    <section class="restaurants-grid" id="restaurantsGrid">
        <%
            if (restaurants != null && !restaurants.isEmpty()) {
                for (Restaurant r : restaurants) {
        %>
        <a href="restaurantDetails?id=<%= r.getRestaurant_id() %>" class="restaurant-card" data-cuisine="<%= r.getCuisine_type() %>">
            <img src="<%= r.getImage_url() %>" alt="<%= r.getName() %>" class="restaurant-image">
            <div class="restaurant-info">
                <div class="restaurant-header">
                    <h3 class="restaurant-name"><%= r.getName() %></h3>
                    <span class="restaurant-rating">
                        <i class="fas fa-star"></i> <%= r.getRating() %>
                    </span>
                </div>
                <p class="restaurant-cuisine"><%= r.getCuisine_type() %></p>
                <p class="restaurant-description"><%= r.getDescription() %></p>
                <div class="restaurant-details">
                    <div class="detail-item">
                        <i class="fas fa-clock"></i>
                        <span>30-40 mins</span>
                    </div>
                    <div class="detail-item">
                        <i class="fas fa-rupee-sign"></i>
                        <span>₹600 for two</span>
                    </div>
                    <div class="detail-item">
                        <i class="fas fa-map-marker-alt"></i>
                        <span><%= r.getAddress() %></span>
                    </div>
                </div>
                <a href="restaurantDetails?id=<%= r.getRestaurant_id() %>" class="view-menu-btn">
                    <i class="fas fa-utensils"></i> View Menu
                </a>
            </div>
        </a>
        <%
                }
            } else {
        %>
        <div class="empty-state">
            <div class="empty-icon">
                <i class="fas fa-utensils"></i>
            </div>
            <h3 class="empty-text">No restaurants found</h3>
            <p>Please try a different search or filter</p>
            <a href="home.jsp" class="view-menu-btn" style="margin-top: 20px;">
                <i class="fas fa-home"></i> Back to Home
            </a>
        </div>
        <% } %>
    </section>
    
    <!-- Back Button -->
    <a href="home.jsp" class="back-button">
        <i class="fas fa-arrow-left"></i> Back to Home
    </a>
    
    <script>
        // Filter restaurants by cuisine
        function filterRestaurants(cuisine) {
            // Update active filter button
            document.querySelectorAll('.filter-btn').forEach(btn => {
                btn.classList.remove('active');
            });
            event.target.classList.add('active');
            
            // Filter restaurant cards
            const cards = document.querySelectorAll('.restaurant-card');
            let visibleCount = 0;
            
            cards.forEach(card => {
                if (cuisine === 'all' || card.dataset.cuisine === cuisine) {
                    card.style.display = 'flex';
                    visibleCount++;
                } else {
                    card.style.display = 'none';
                }
            });
            
            // Update count
            document.querySelector('.count-text').textContent = `${visibleCount} restaurants`;
        }
        
        // Update cart count
        function updateCartCount() {
            const cart = JSON.parse(localStorage.getItem('cart')) || {};
            const totalItems = Object.values(cart).reduce((sum, item) => sum + item.quantity, 0);
            document.getElementById('cartCount').textContent = totalItems;
        }
        
        // Initialize
        updateCartCount();
        
        // Search functionality
        const urlParams = new URLSearchParams(window.location.search);
        const searchTerm = urlParams.get('search');
        if (searchTerm) {
            const cards = document.querySelectorAll('.restaurant-card');
            let visibleCount = 0;
            
            cards.forEach(card => {
                const name = card.querySelector('.restaurant-name').textContent.toLowerCase();
                const cuisine = card.querySelector('.restaurant-cuisine').textContent.toLowerCase();
                const desc = card.querySelector('.restaurant-description').textContent.toLowerCase();
                
                if (name.includes(searchTerm.toLowerCase()) || 
                    cuisine.includes(searchTerm.toLowerCase()) || 
                    desc.includes(searchTerm.toLowerCase())) {
                    card.style.display = 'flex';
                    visibleCount++;
                } else {
                    card.style.display = 'none';
                }
            });
            
            document.querySelector('.count-text').textContent = `${visibleCount} restaurants found for "${searchTerm}"`;
        }
    </script>
</body>
</html>