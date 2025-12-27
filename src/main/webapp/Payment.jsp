<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.kumar.Models.CartItem, com.kumar.Models.UserModel" %>
<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    UserModel user = (UserModel) sessionObj.getAttribute("user");
    String username = (user != null && user.getName() != null) ? user.getName() : "User";
    List<CartItem> cartItems = (List<CartItem>) request.getAttribute("cartItems");
    Double cartTotal = (Double) request.getAttribute("cartTotal");
    
    if (cartTotal == null) cartTotal = 0.0;
    
    double deliveryCharge = 40.0;
    double tax = cartTotal * 0.05;
    double totalAmount = cartTotal + deliveryCharge + tax;
    
    // Get restaurant ID from first cart item
    int restaurantId = 0;
    if (cartItems != null && !cartItems.isEmpty()) {
        restaurantId = cartItems.get(0).getRestaurant();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment - BiteNow</title>
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
        
        /* Payment Container */
        .payment-container {
            padding: 40px 5%;
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 40px;
        }
        
        .payment-section {
            background: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
        }
        
        .section-title {
            font-size: 24px;
            font-weight: 700;
            margin-bottom: 25px;
            color: var(--bite-dark);
        }
        
        /* Delivery Address */
        .address-form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        
        .form-group {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }
        
        .form-label {
            font-weight: 600;
            color: var(--bite-dark);
        }
        
        .form-input {
            padding: 12px 15px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 16px;
            transition: border-color 0.3s;
        }
        
        .form-input:focus {
            outline: none;
            border-color: var(--bite-orange);
        }
        
        textarea.form-input {
            min-height: 100px;
            resize: vertical;
        }
        
        /* Payment Methods */
        .payment-methods {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        
        .payment-method {
            display: flex;
            align-items: center;
            gap: 15px;
            padding: 15px;
            border: 2px solid #e0e0e0;
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .payment-method:hover {
            border-color: var(--bite-orange);
        }
        
        .payment-method.selected {
            border-color: var(--bite-orange);
            background-color: #FFF5EB;
        }
        
        .payment-icon {
            width: 40px;
            height: 40px;
            background-color: var(--bite-light);
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--bite-orange);
            font-size: 20px;
        }
        
        .payment-details {
            flex: 1;
        }
        
        .payment-name {
            font-weight: 600;
            margin-bottom: 5px;
        }
        
        .payment-description {
            color: var(--bite-gray);
            font-size: 14px;
        }
        
        /* Order Summary */
        .order-summary {
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            position: sticky;
            top: 100px;
            height: fit-content;
        }
        
        .summary-title {
            font-size: 20px;
            font-weight: 700;
            margin-bottom: 25px;
            color: var(--bite-dark);
        }
        
        .summary-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
            padding-bottom: 15px;
            border-bottom: 1px solid #eee;
        }
        
        .summary-label {
            color: var(--bite-gray);
        }
        
        .summary-value {
            font-weight: 600;
        }
        
        .summary-total {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
            padding-top: 20px;
            border-top: 2px solid var(--bite-dark);
        }
        
        .total-label {
            font-size: 20px;
            font-weight: 700;
            color: var(--bite-dark);
        }
        
        .total-value {
            font-size: 24px;
            font-weight: 700;
            color: var(--bite-orange);
        }
        
        /* Place Order Button */
        .place-order-btn {
            width: 100%;
            padding: 16px;
            background-color: var(--bite-orange);
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-top: 25px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }
        
        .place-order-btn:hover {
            background-color: #e57200;
        }
        
        .place-order-btn:disabled {
            background-color: #ccc;
            cursor: not-allowed;
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .payment-container {
                grid-template-columns: 1fr;
            }
            
            .order-summary {
                position: static;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="header-content">
            <a href="cart" class="logo">
                <i class="fas fa-arrow-left"></i> Back to Cart
            </a>
        </div>
    </header>
    
    <!-- Payment Container -->
    <div class="payment-container">
        <!-- Left Column: Payment Details -->
        <div>
            <!-- Delivery Address -->
            <div class="payment-section">
                <h2 class="section-title">Delivery Address</h2>
                <form id="addressForm" class="address-form">
                    <div class="form-group">
                        <label class="form-label">Full Name</label>
                        <input type="text" class="form-input" name="fullName" value="<%= username %>" required>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label">Phone Number</label>
                        <input type="tel" class="form-input" name="phone" placeholder="Enter your phone number" required>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label">Delivery Address</label>
                        <textarea class="form-input" name="deliveryAddress" placeholder="Enter your complete delivery address" required></textarea>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label">City</label>
                        <input type="text" class="form-input" name="city" placeholder="Enter your city" required>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label">Pincode</label>
                        <input type="text" class="form-input" name="pincode" placeholder="Enter pincode" required>
                    </div>
                </form>
            </div>
            
            <!-- Payment Method -->
            <div class="payment-section" style="margin-top: 30px;">
                <h2 class="section-title">Payment Method</h2>
                <div class="payment-methods">
                    <div class="payment-method selected" onclick="selectPaymentMethod('cash')" id="cashMethod">
                        <div class="payment-icon">
                            <i class="fas fa-money-bill-wave"></i>
                        </div>
                        <div class="payment-details">
                            <div class="payment-name">Cash on Delivery</div>
                            <div class="payment-description">Pay when you receive your order</div>
                        </div>
                    </div>
                    
                    <div class="payment-method" onclick="selectPaymentMethod('card')" id="cardMethod">
                        <div class="payment-icon">
                            <i class="fas fa-credit-card"></i>
                        </div>
                        <div class="payment-details">
                            <div class="payment-name">Credit/Debit Card</div>
                            <div class="payment-description">Pay securely with your card</div>
                        </div>
                    </div>
                    
                    <div class="payment-method" onclick="selectPaymentMethod('upi')" id="upiMethod">
                        <div class="payment-icon">
                            <i class="fas fa-mobile-alt"></i>
                        </div>
                        <div class="payment-details">
                            <div class="payment-name">UPI</div>
                            <div class="payment-description">Pay using UPI apps</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Right Column: Order Summary -->
        <div class="order-summary">
            <h2 class="summary-title">Order Summary</h2>
            
            <% if (cartItems != null && !cartItems.isEmpty()) { %>
                <div style="margin-bottom: 20px; max-height: 200px; overflow-y: auto;">
                    <% for (CartItem item : cartItems) { %>
                    <div class="summary-row" style="border-bottom: none; padding-bottom: 10px;">
                        <span class="summary-label"><%= item.getQuantity() %> × <%= item.getItemName() %></span>
                        <span class="summary-value">₹<%= String.format("%.2f", item.getPrice() * item.getQuantity()) %></span>
                    </div>
                    <% } %>
                </div>
                
                <div class="summary-row">
                    <span class="summary-label">Subtotal</span>
                    <span class="summary-value">₹<%= String.format("%.2f", cartTotal) %></span>
                </div>
                
                <div class="summary-row">
                    <span class="summary-label">Delivery Charge</span>
                    <span class="summary-value">₹<%= String.format("%.2f", deliveryCharge) %></span>
                </div>
                
                <div class="summary-row">
                    <span class="summary-label">Tax (5%)</span>
                    <span class="summary-value">₹<%= String.format("%.2f", tax) %></span>
                </div>
                
                <div class="summary-total">
                    <span class="total-label">Total Amount</span>
                    <span class="total-value">₹<%= String.format("%.2f", totalAmount) %></span>
                </div>
                
                <form id="paymentForm" action="checkout" method="post">
                    <input type="hidden" name="deliveryAddress" id="deliveryAddressInput">
                    <input type="hidden" name="paymentMethod" id="paymentMethodInput" value="cash">
                    <input type="hidden" name="restaurantId" value="<%= restaurantId %>">
                    <button type="submit" class="place-order-btn" id="placeOrderBtn">
                        <i class="fas fa-shopping-bag"></i> PLACE ORDER
                    </button>
                </form>
            <% } else { %>
                <div class="empty-cart-message" style="text-align: center; padding: 20px;">
                    <i class="fas fa-shopping-cart" style="font-size: 40px; color: #ccc; margin-bottom: 10px;"></i>
                    <p>Your cart is empty</p>
                </div>
            <% } %>
        </div>
    </div>
    
    <script>
        let selectedPaymentMethod = 'cash';
        
        // Select payment method
        function selectPaymentMethod(method) {
            selectedPaymentMethod = method;
            
            // Update UI
            document.querySelectorAll('.payment-method').forEach(el => {
                el.classList.remove('selected');
            });
            
            document.getElementById(method + 'Method').classList.add('selected');
            document.getElementById('paymentMethodInput').value = method;
        }
        
        // Form submission
        document.getElementById('paymentForm').addEventListener('submit', function(e) {
            e.preventDefault();
            
            // Get address from form
            const addressForm = document.getElementById('addressForm');
            const fullName = addressForm.querySelector('[name="fullName"]').value;
            const phone = addressForm.querySelector('[name="phone"]').value;
            const deliveryAddress = addressForm.querySelector('[name="deliveryAddress"]').value;
            const city = addressForm.querySelector('[name="city"]').value;
            const pincode = addressForm.querySelector('[name="pincode"]').value;
            
            // Validate form
            if (!fullName || !phone || !deliveryAddress || !city || !pincode) {
                alert('Please fill all the delivery address fields');
                return;
            }
            
            // Create complete address string
            const completeAddress = `${fullName}, ${phone}, ${deliveryAddress}, ${city} - ${pincode}`;
            document.getElementById('deliveryAddressInput').value = completeAddress;
            
            // Show confirmation
            if (confirm('Are you sure you want to place this order?')) {
                this.submit();
            }
        });
        
        // Auto-fill address if available
        function autoFillAddress() {
            // You can fetch saved addresses from user profile here
            // For now, we'll just set some defaults
            const addressForm = document.getElementById('addressForm');
            addressForm.querySelector('[name="city"]').value = 'Bangalore';
            
            // Prompt user to enter their address
            alert('Please enter your delivery address');
        }
        
        // Initialize
        autoFillAddress();
    </script>
</body>
</html>