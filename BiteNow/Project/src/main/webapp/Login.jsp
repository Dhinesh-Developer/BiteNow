<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - BiteNow</title>
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
            background: linear-gradient(135deg, #FFE8D6 0%, #FFF5EB 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        
        .login-container {
            width: 100%;
            max-width: 450px;
            padding: 20px;
        }
        
        .login-card {
            background: white;
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
        }
        
        .logo {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .logo a {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            font-size: 28px;
            font-weight: 700;
            color: var(--swiggy-orange);
            text-decoration: none;
        }
        
        .logo i {
            font-size: 32px;
        }
        
        .login-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .login-header h1 {
            font-size: 32px;
            color: var(--swiggy-dark);
            margin-bottom: 10px;
        }
        
        .login-header p {
            color: var(--swiggy-gray);
            font-size: 16px;
        }
        
        .form-group {
            margin-bottom: 25px;
        }
        
        .form-label {
            display: block;
            margin-bottom: 8px;
            color: var(--swiggy-dark);
            font-weight: 500;
        }
        
        .input-group {
            position: relative;
        }
        
        .input-group i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--swiggy-gray);
        }
        
        .form-control {
            width: 100%;
            padding: 15px 15px 15px 45px;
            border: 2px solid #e0e0e0;
            border-radius: 10px;
            font-size: 16px;
            transition: all 0.3s;
            outline: none;
        }
        
        .form-control:focus {
            border-color: var(--swiggy-orange);
            box-shadow: 0 0 0 3px rgba(252, 128, 25, 0.1);
        }
        
        .login-btn {
            width: 100%;
            padding: 15px;
            background-color: var(--swiggy-orange);
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-top: 10px;
        }
        
        .login-btn:hover {
            background-color: #e57200;
        }
        
        .login-btn i {
            margin-right: 8px;
        }
        
        .divider {
            text-align: center;
            margin: 25px 0;
            position: relative;
            color: var(--swiggy-gray);
        }
        
        .divider::before {
            content: '';
            position: absolute;
            left: 0;
            top: 50%;
            width: 45%;
            height: 1px;
            background-color: #e0e0e0;
        }
        
        .divider::after {
            content: '';
            position: absolute;
            right: 0;
            top: 50%;
            width: 45%;
            height: 1px;
            background-color: #e0e0e0;
        }
        
        .register-link {
            text-align: center;
            margin-top: 25px;
        }
        
        .register-link a {
            color: var(--swiggy-orange);
            text-decoration: none;
            font-weight: 600;
        }
        
        .register-link a:hover {
            text-decoration: underline;
        }
        
        .error-message {
            background-color: #FFE8E8;
            color: #FF6161;
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .back-home {
            display: inline-block;
            margin-top: 20px;
            color: var(--swiggy-gray);
            text-decoration: none;
            transition: color 0.3s;
        }
        
        .back-home:hover {
            color: var(--swiggy-orange);
        }
        
        .back-home i {
            margin-right: 5px;
        }
        
        @media (max-width: 480px) {
            .login-card {
                padding: 30px 20px;
            }
            
            .login-header h1 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="logo">
            <a href="index.jsp">
                <i class="fas fa-utensils"></i> BiteNow
            </a>
        </div>
        
        <div class="login-card">
            <div class="login-header">
                <h1>Welcome Back!</h1>
                <p>Sign in to your account to continue</p>
            </div>
            
            <% if (request.getAttribute("error") != null) { %>
                <div class="error-message">
                    <i class="fas fa-exclamation-circle"></i>
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>
            
            <form action="login" method="post">
                <div class="form-group">
                    <label class="form-label">Email Address</label>
                    <div class="input-group">
                        <i class="fas fa-envelope"></i>
                        <input type="email" name="email" class="form-control" placeholder="Enter your email" required>
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="form-label">Password</label>
                    <div class="input-group">
                        <i class="fas fa-lock"></i>
                        <input type="password" name="password" class="form-control" placeholder="Enter your password" required>
                    </div>
                </div>
                
                <button type="submit" class="login-btn">
                    <i class="fas fa-sign-in-alt"></i> Sign In
                </button>
            </form>
            
            <div class="divider">or</div>
            
            <div class="register-link">
                <p>Don't have an account? <a href="Register.jsp">Create one</a></p>
            </div>
            
            <a href="index.jsp" class="back-home">
                <i class="fas fa-arrow-left"></i> Back to Home
            </a>
        </div>
    </div>
</body>
</html>