<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.kumar.Models.Restaurant, com.kumar.Models.UserModel" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BiteNow - Home</title>
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
        
        /* Header Styles */
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
        
        .location-selector {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 10px 20px;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .location-selector:hover {
            border-color: var(--bite-orange);
        }
        
        .location-selector i {
            color: var(--bite-orange);
        }
        
        .location-text {
            font-weight: 500;
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
            position: relative;
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
        
        /* Profile Dropdown */
        .profile-dropdown {
            position: absolute;
            top: 50px;
            right: 0;
            background: white;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.15);
            min-width: 200px;
            z-index: 1000;
            display: none;
        }
        
        .profile-dropdown.active {
            display: block;
        }
        
        .profile-dropdown a {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 15px 20px;
            color: var(--bite-dark);
            text-decoration: none;
            border-bottom: 1px solid #eee;
            transition: all 0.3s;
        }
        
        .profile-dropdown a:hover {
            background-color: var(--bite-light);
            color: var(--bite-orange);
        }
        
        .profile-dropdown a:last-child {
            border-bottom: none;
        }
        
        /* Search Bar */
        .search-section {
            padding: 20px 5%;
            background-color: var(--bite-light);
        }
        
        .search-container {
            max-width: 800px;
            margin: 0 auto;
        }
        
        .search-box {
            position: relative;
        }
        
        .search-input {
            width: 100%;
            padding: 15px 20px 15px 50px;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            outline: none;
        }
        
        .search-icon {
            position: absolute;
            left: 20px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--bite-gray);
        }
        
        /* Categories */
        .categories-section {
            padding: 30px 5%;
        }
        
        .section-title {
            font-size: 24px;
            font-weight: 700;
            margin-bottom: 20px;
            color: var(--bite-dark);
        }
        
        .categories-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(120px, 1fr));
            gap: 20px;
        }
        
        .category-card {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 10px;
            padding: 20px 10px;
            background: white;
            border-radius: 15px;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
            color: var(--bite-dark);
        }
        
        .category-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        
        .category-icon {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            color: var(--bite-orange);
            background-color: #FFF5EB;
        }
        
        .category-name {
            font-weight: 500;
            text-align: center;
        }
        
        /* Restaurants Grid */
        .restaurants-section {
            padding: 30px 5%;
        }
        
        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }
        
        .view-all {
            color: var(--bite-orange);
            text-decoration: none;
            font-weight: 600;
        }
        
        .restaurants-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 30px;
        }
        
        .restaurant-card {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            transition: all 0.3s;
            cursor: pointer;
            text-decoration: none;
            color: inherit;
        }
        
        .restaurant-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
        }
        
        .restaurant-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        
        .restaurant-info {
            padding: 20px;
        }
        
        .restaurant-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 10px;
        }
        
        .restaurant-name {
            font-size: 20px;
            font-weight: 600;
            color: var(--bite-dark);
        }
        
        .restaurant-rating {
            background-color: var(--bite-green);
            color: white;
            padding: 4px 8px;
            border-radius: 5px;
            font-size: 14px;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 5px;
        }
        
        .restaurant-cuisine {
            color: var(--bite-gray);
            margin-bottom: 10px;
            font-size: 14px;
        }
        
        .restaurant-details {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 14px;
            color: var(--bite-gray);
        }
        
        .restaurant-price {
            font-weight: 600;
            color: var(--bite-dark);
        }
        
        /* Footer */
        .footer {
            background-color: var(--bite-dark);
            color: white;
            padding: 40px 5%;
            margin-top: 50px;
        }
        
        .footer-content {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 40px;
        }
        
        .footer-section h3 {
            margin-bottom: 20px;
            font-size: 16px;
        }
        
        .footer-section ul {
            list-style: none;
        }
        
        .footer-section ul li {
            margin-bottom: 10px;
        }
        
        .footer-section ul li a {
            color: #ccc;
            text-decoration: none;
            font-size: 14px;
            transition: color 0.3s;
        }
        
        .footer-section ul li a:hover {
            color: var(--bite-orange);
        }
        
        .copyright {
            text-align: center;
            padding-top: 30px;
            margin-top: 30px;
            border-top: 1px solid #444;
            color: #ccc;
            font-size: 14px;
        }
        
        /* Cart Badge */
        .cart-badge {
            position: relative;
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
        
        /* Welcome Banner */
        .welcome-banner {
            background: linear-gradient(135deg, #FFE8D6 0%, #FFF5EB 100%);
            padding: 40px 5%;
            text-align: center;
            margin-bottom: 20px;
        }
        
        .welcome-title {
            font-size: 36px;
            font-weight: 700;
            color: var(--bite-dark);
            margin-bottom: 10px;
        }
        
        .welcome-subtitle {
            font-size: 18px;
            color: var(--bite-gray);
        }
        
        /* Mobile Responsive */
        @media (max-width: 768px) {
            .header-content {
                flex-wrap: wrap;
                gap: 15px;
            }
            
            .location-selector {
                order: 3;
                width: 100%;
                justify-content: center;
            }
            
            .user-menu {
                gap: 15px;
            }
            
            .nav-icon span {
                display: none;
            }
            
            .restaurants-grid {
                grid-template-columns: 1fr;
            }
            
            .welcome-title {
                font-size: 28px;
            }
        }
    </style>
</head>
<body>
    <%
        HttpSession sessionObj = request.getSession(false);
        if (sessionObj == null || sessionObj.getAttribute("name") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }
        String username = (String) sessionObj.getAttribute("name");
        List<Restaurant> restaurants = (List<Restaurant>) request.getAttribute("lists");
    %>
    
    <!-- Header -->
    <header class="header">
        <div class="header-content">
            <a href="home.jsp" class="logo">
                <i class="fas fa-utensils"></i> BiteNow
            </a>
            
            <div class="location-selector">
                <i class="fas fa-map-marker-alt"></i>
                <span class="location-text">Bangalore</span>
                <i class="fas fa-chevron-down"></i>
            </div>
            
            <div class="user-menu">
                <a href="rest" class="nav-icon">
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
                <div class="user-profile" onclick="toggleProfileMenu()">
                    <div class="profile-img">
                        <%= username != null && !username.isEmpty() ? username.charAt(0) : "U" %>
                    </div>
                    <span><%= username != null ? username : "User" %></span>
                    <i class="fas fa-chevron-down"></i>
                </div>
            </div>
        </div>
    </header>
    
    <!-- Profile Dropdown -->
    <div id="profileMenu" class="profile-dropdown">
        <a href="profile.jsp"><i class="fas fa-user"></i> Profile</a>
        <a href="orders.jsp"><i class="fas fa-clipboard-list"></i> Orders</a>
        <a href="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>
    
    <!-- Welcome Banner -->
    <div class="welcome-banner">
        <h1 class="welcome-title">Welcome, <%= username != null ? username : "Guest" %>!</h1>
        <p class="welcome-subtitle">Delicious food delivered to your doorstep</p>
    </div>
    
    <!-- Search Section -->
    <section class="search-section">
        <div class="search-container">
            <div class="search-box">
                <i class="fas fa-search search-icon"></i>
                <input type="text" class="search-input" placeholder="Search for restaurants or dishes..." id="searchInput">
            </div>
        </div>
    </section>
    
    <!-- Categories Section -->
    <section class="categories-section">
        <h2 class="section-title">What's on your mind?</h2>
        <div class="categories-grid">
            <a href="restaurants?cuisine=Italian" class="category-card">
                <div class="category-icon">
                    <i class="fas fa-pizza-slice"></i>
                </div>
                <span class="category-name">Italian</span>
            </a>
            <a href="restaurants?cuisine=Chinese" class="category-card">
                <div class="category-icon">
                    <i class="fas fa-utensils"></i>
                </div>
                <span class="category-name">Chinese</span>
            </a>
            <a href="restaurants?cuisine=North Indian" class="category-card">
                <div class="category-icon">
                    <i class="fas fa-pepper-hot"></i>
                </div>
                <span class="category-name">North Indian</span>
            </a>
            <a href="restaurants?cuisine=South Indian" class="category-card">
                <div class="category-icon">
                    <i class="fas fa-drumstick-bite"></i>
                </div>
                <span class="category-name">South Indian</span>
            </a>
            <a href="restaurants?cuisine=Mexican" class="category-card">
                <div class="category-icon">
                    <i class="fas fa-pepper-hot"></i>
                </div>
                <span class="category-name">Mexican</span>
            </a>
            <a href="restaurants?cuisine=American" class="category-card">
                <div class="category-icon">
                    <i class="fas fa-hamburger"></i>
                </div>
                <span class="category-name">American</span>
            </a>
        </div>
    </section>
    
    <!-- Restaurants Section -->
    <section class="restaurants-section">
        <div class="section-header">
            <h2 class="section-title">Top restaurants near you</h2>
            <a href="restaurants" class="view-all">View All <i class="fas fa-chevron-right"></i></a>
        </div>
        
        <div class="restaurants-grid">
            <%
                if (restaurants != null && !restaurants.isEmpty()) {
                    for (Restaurant r : restaurants) {
            %>
            <a href="restaurantDetails?id=<%= r.getRestaurant_id() %>" class="restaurant-card">
                <img src="<%= r.getImage_url() != null ? r.getImage_url() : "https://images.pexels.com/photos/67468/pexels-photo-67468.jpeg" %>" 
                     alt="<%= r.getName() %>" class="restaurant-image">
                <div class="restaurant-info">
                    <div class="restaurant-header">
                        <h3 class="restaurant-name"><%= r.getName() %></h3>
                        <span class="restaurant-rating">
                            <i class="fas fa-star"></i> <%= r.getRating() != 0.0 ? r.getRating() : "4.0" %>
                        </span>
                    </div>
                    <p class="restaurant-cuisine"><%= r.getCuisine_type() != null ? r.getCuisine_type() : "Multi-cuisine" %></p>
                    <div class="restaurant-details">
                        <span>30-40 mins</span>
                        <span class="restaurant-price">₹600 for two</span>
                    </div>
                </div>
            </a>
            <%
                    }
                } else {
            %>
            <div style="grid-column: 1 / -1; text-align: center; padding: 40px;">
                <i class="fas fa-utensils fa-3x" style="color: #ccc; margin-bottom: 20px;"></i>
                <h3>No restaurants available</h3>
                <p>Please check back later</p>
            </div>
            <%
                }
            %>
        </div>
    </section>
    
    <!-- Footer -->
    <footer class="footer">
        <div class="footer-content">
            <div class="footer-section">
                <h3>Company</h3>
                <ul>
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Team</a></li>
                    <li><a href="#">Careers</a></li>
                    <li><a href="#">Blog</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h3>Contact</h3>
                <ul>
                    <li><a href="#">Help & Support</a></li>
                    <li><a href="#">Partner with us</a></li>
                    <li><a href="#">Ride with us</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h3>Legal</h3>
                <ul>
                    <li><a href="#">Terms & Conditions</a></li>
                    <li><a href="#">Privacy Policy</a></li>
                    <li><a href="#">Cookie Policy</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h3>We deliver to</h3>
                <ul>
                    <li>Bangalore</li>
                    <li>Delhi</li>
                    <li>Mumbai</li>
                    <li>Chennai</li>
                </ul>
            </div>
        </div>
        <div class="copyright">
            <p>&copy; 2025 BiteNow. All rights reserved.</p>
        </div>
    </footer>
    
    <script>
        // Toggle profile menu
        function toggleProfileMenu() {
            const menu = document.getElementById('profileMenu');
            menu.classList.toggle('active');
        }
        
        // Close profile menu when clicking outside
        document.addEventListener('click', function(event) {
            const profileMenu = document.getElementById('profileMenu');
            const userProfile = document.querySelector('.user-profile');
            
            if (!userProfile.contains(event.target) && !profileMenu.contains(event.target)) {
                profileMenu.classList.remove('active');
            }
        });
        
        // Update cart count
        function updateCartCount() {
            // For now, set to 0. You can fetch from server later
            document.getElementById('cartCount').textContent = '0';
        }
        
        // Initial cart count update
        updateCartCount();
        
        // Search functionality
        document.getElementById('searchInput').addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                const searchTerm = this.value.trim();
                if (searchTerm) {
                    // You can implement search functionality here
                    alert('Search functionality will be implemented soon!');
                    // window.location.href = 'restaurants?search=' + encodeURIComponent(searchTerm);
                }
            }
        });
        
        // Category card click
        document.querySelectorAll('.category-card').forEach(card => {
            card.addEventListener('click', function(e) {
                e.preventDefault();
                const cuisine = this.querySelector('.category-name').textContent;
                alert('Filtering by ' + cuisine + ' cuisine will be implemented soon!');
                // You can implement filter functionality here
            });
        });
        
        // Restaurant card click
        document.querySelectorAll('.restaurant-card').forEach(card => {
            card.addEventListener('click', function(e) {
                const restaurantName = this.querySelector('.restaurant-name').textContent;
                console.log('Selected restaurant:', restaurantName);
                // The link will handle navigation
            });
        });
    </script>
</body>
</html>