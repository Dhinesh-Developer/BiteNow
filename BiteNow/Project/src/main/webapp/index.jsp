<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BiteNow- Food Delivery</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --swiggy-orange: #FC8019;
            --swiggy-dark: #282C3F;
            --swiggy-gray: #686B78;
            --swiggy-light: #F8F8F8;
            --swiggy-green: #48C479;
            --swiggy-red: #FF6161;
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
        
        .navbar {
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            padding: 15px 5%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 1000;
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
        
        .nav-links {
            display: flex;
            gap: 30px;
            align-items: center;
        }
        
        .nav-link {
            color: var(--swiggy-dark);
            text-decoration: none;
            font-weight: 500;
            font-size: 16px;
            transition: color 0.3s;
        }
        
        .nav-link:hover {
            color: var(--swiggy-orange);
        }
        
        .login-btn {
            background-color: var(--swiggy-orange);
            color: white;
            padding: 10px 25px;
            border-radius: 5px;
            font-weight: 600;
            text-decoration: none;
            transition: background-color 0.3s;
        }
        
        .login-btn:hover {
            background-color: #e57200;
        }
        
        .hero-section {
            background: linear-gradient(135deg, #FFE8D6 0%, #FFF5EB 100%);
            padding: 80px 5%;
            display: flex;
            align-items: center;
            gap: 50px;
            min-height: 80vh;
        }
        
        .hero-content {
            flex: 1;
        }
        
        .hero-title {
            font-size: 48px;
            font-weight: 700;
            color: var(--swiggy-dark);
            line-height: 1.2;
            margin-bottom: 20px;
        }
        
        .hero-subtitle {
            font-size: 20px;
            color: var(--swiggy-gray);
            margin-bottom: 30px;
            line-height: 1.6;
        }
        
        .cta-buttons {
            display: flex;
            gap: 20px;
        }
        
        .cta-btn {
            padding: 15px 35px;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            text-decoration: none;
            transition: transform 0.3s;
        }
        
        .cta-btn.primary {
            background-color: var(--swiggy-orange);
            color: white;
            border: none;
        }
        
        .cta-btn.secondary {
            background-color: transparent;
            color: var(--swiggy-dark);
            border: 2px solid var(--swiggy-dark);
        }
        
        .cta-btn:hover {
            transform: translateY(-3px);
        }
        
        .hero-image {
            flex: 1;
            text-align: center;
        }
        
        .hero-image img {
            max-width: 100%;
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
        }
        
        .features {
            padding: 80px 5%;
            background-color: var(--swiggy-light);
        }
        
        .section-title {
            text-align: center;
            font-size: 36px;
            font-weight: 700;
            margin-bottom: 50px;
            color: var(--swiggy-dark);
        }
        
        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
        }
        
        .feature-card {
            background: white;
            padding: 30px;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            transition: transform 0.3s;
        }
        
        .feature-card:hover {
            transform: translateY(-10px);
        }
        
        .feature-icon {
            font-size: 40px;
            color: var(--swiggy-orange);
            margin-bottom: 20px;
        }
        
        .feature-title {
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 10px;
            color: var(--swiggy-dark);
        }
        
        .feature-desc {
            color: var(--swiggy-gray);
            line-height: 1.6;
        }
        
        .restaurants-preview {
            padding: 80px 5%;
        }
        
        .restaurant-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 30px;
            margin-top: 40px;
        }
        
        .restaurant-card {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            transition: transform 0.3s;
        }
        
        .restaurant-card:hover {
            transform: translateY(-5px);
        }
        
        .restaurant-img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        
        .restaurant-info {
            padding: 20px;
        }
        
        .restaurant-name {
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 10px;
        }
        
        .restaurant-cuisine {
            color: var(--swiggy-gray);
            margin-bottom: 10px;
        }
        
        .restaurant-rating {
            background-color: var(--swiggy-green);
            color: white;
            padding: 3px 8px;
            border-radius: 5px;
            font-size: 14px;
            font-weight: 600;
            display: inline-block;
            margin-bottom: 10px;
        }
        
        .restaurant-price {
            color: var(--swiggy-dark);
            font-weight: 600;
        }
        
        .footer {
            background-color: var(--swiggy-dark);
            color: white;
            padding: 60px 5%;
        }
        
        .footer-content {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 40px;
        }
        
        .footer-section h3 {
            margin-bottom: 20px;
            font-size: 18px;
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
            transition: color 0.3s;
        }
        
        .footer-section ul li a:hover {
            color: var(--swiggy-orange);
        }
        
        .copyright {
            text-align: center;
            padding-top: 40px;
            margin-top: 40px;
            border-top: 1px solid #444;
            color: #ccc;
        }
        
        @media (max-width: 768px) {
            .hero-section {
                flex-direction: column;
                text-align: center;
            }
            
            .hero-title {
                font-size: 36px;
            }
            
            .cta-buttons {
                flex-direction: column;
                align-items: center;
            }
            
            .nav-links {
                display: none;
            }
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar">
        <a href="index.jsp" class="logo">
            <i class="fas fa-utensils"></i> BiteNow
        </a>
        <div class="nav-links">
            <a href="#features" class="nav-link">Features</a>
            <a href="#restaurants" class="nav-link">Restaurants</a>
            <a href="#about" class="nav-link">About</a>
            <a href="Login.jsp" class="login-btn">Login</a>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero-section">
        <div class="hero-content">
            <h1 class="hero-title">Order food from the best restaurants in your city</h1>
            <p class="hero-subtitle">Discover the best food delivery service with 1000+ restaurants, instant delivery, and amazing discounts.</p>
            <div class="cta-buttons">
                <a href="Login.jsp" class="cta-btn primary">Order Now <i class="fas fa-arrow-right"></i></a>
                <a href="Register.jsp" class="cta-btn secondary">Create Account</a>
            </div>
        </div>
        <div class="hero-image">
            <img src="https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg" alt="Delicious Food">
        </div>
    </section>

    <!-- Features Section -->
    <section class="features" id="features">
        <h2 class="section-title">Why Choose BiteNow?</h2>
        <div class="features-grid">
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fas fa-bolt"></i>
                </div>
                <h3 class="feature-title">Fast Delivery</h3>
                <p class="feature-desc">Get your food delivered in 30-40 minutes with our lightning-fast delivery service.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fas fa-utensils"></i>
                </div>
                <h3 class="feature-title">Best Restaurants</h3>
                <p class="feature-desc">Choose from 1000+ restaurants offering delicious cuisines from around the world.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fas fa-shield-alt"></i>
                </div>
                <h3 class="feature-title">Safe & Secure</h3>
                <p class="feature-desc">Contactless delivery and secure payment options for your safety.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fas fa-tags"></i>
                </div>
                <h3 class="feature-title">Amazing Offers</h3>
                <p class="feature-desc">Enjoy discounts, cashback, and special offers on every order.</p>
            </div>
        </div>
    </section>

    <!-- Restaurants Preview -->
    <section class="restaurants-preview" id="restaurants">
        <h2 class="section-title">Popular Restaurants</h2>
        <div class="restaurant-grid">
            <!-- Restaurant 1 -->
            <div class="restaurant-card">
                <img src="https://images.pexels.com/photos/67468/pexels-photo-67468.jpeg" alt="Pizza Palace" class="restaurant-img">
                <div class="restaurant-info">
                    <h3 class="restaurant-name">Pizza Palace</h3>
                    <p class="restaurant-cuisine">Italian • Pizza</p>
                    <span class="restaurant-rating">4.5 ★</span>
                    <p class="restaurant-price">₹600 for two</p>
                </div>
            </div>
            <!-- Restaurant 2 -->
            <div class="restaurant-card">
                <img src="https://images.pexels.com/photos/941861/pexels-photo-941861.jpeg" alt="Burger Hub" class="restaurant-img">
                <div class="restaurant-info">
                    <h3 class="restaurant-name">Burger Hub</h3>
                    <p class="restaurant-cuisine">American • Burgers</p>
                    <span class="restaurant-rating">4.3 ★</span>
                    <p class="restaurant-price">₹500 for two</p>
                </div>
            </div>
            <!-- Restaurant 3 -->
            <div class="restaurant-card">
                <img src="https://images.pexels.com/photos/1581384/pexels-photo-1581384.jpeg" alt="Spice Garden" class="restaurant-img">
                <div class="restaurant-info">
                    <h3 class="restaurant-name">Spice Garden</h3>
                    <p class="restaurant-cuisine">North Indian</p>
                    <span class="restaurant-rating">4.7 ★</span>
                    <p class="restaurant-price">₹800 for two</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer" id="about">
        <div class="footer-content">
            <div class="footer-section">
                <h3>BiteNow</h3>
                <p>Delivering happiness to your doorstep since 2024.</p>
            </div>
            <div class="footer-section">
                <h3>Quick Links</h3>
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="#restaurants">Restaurants</a></li>
                    <li><a href="#features">Features</a></li>
                    <li><a href="login.jsp">Login</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h3>Contact Us</h3>
                <ul>
                    <li><i class="fas fa-phone"></i> 1800-123-4567</li>
                    <li><i class="fas fa-envelope"></i> support@swiggyclone.com</li>
                    <li><i class="fas fa-map-marker-alt"></i> Bangalore, India</li>
                </ul>
            </div>
            <div class="footer-section">
                <h3>Follow Us</h3>
                <ul>
                    <li><a href="#"><i class="fab fa-facebook"></i> Facebook</a></li>
                    <li><a href="#"><i class="fab fa-twitter"></i> Twitter</a></li>
                    <li><a href="#"><i class="fab fa-instagram"></i> Instagram</a></li>
                </ul>
            </div>
        </div>
        <div class="copyright">
            <p>&copy; 2025 BiteNow. All rights reserved.</p>
        </div>
    </footer>

    <script>
        // Smooth scrolling
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                document.querySelector(this.getAttribute('href')).scrollIntoView({
                    behavior: 'smooth'
                });
            });
        });
    </script>
</body>
</html>