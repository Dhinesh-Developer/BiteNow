<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.List, com.kumar.Models.CartItem, com.kumar.Models.UserModel"%>
<%
HttpSession sessionObj = request.getSession(false);
if (sessionObj == null || sessionObj.getAttribute("name") == null) {
	response.sendRedirect("login.jsp");
	return;
}

UserModel user = (UserModel) sessionObj.getAttribute("user");
String username = (String) sessionObj.getAttribute("name");
List<CartItem> cartItems = (List<CartItem>) request.getAttribute("cartItems");
Double cartTotal = (Double) request.getAttribute("cartTotal");

if (cartTotal == null)
	cartTotal = 0.0;

double deliveryCharge = 40.0;
double tax = cartTotal * 0.05; // 5% tax
double totalAmount = cartTotal + deliveryCharge + tax;
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Cart - BiteNow</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
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
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
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

/* Cart Container */
.cart-container {
	padding: 40px 5%;
	max-width: 1200px;
	margin: 0 auto;
}

.cart-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 30px;
}

.cart-title {
	font-size: 32px;
	font-weight: 700;
	color: var(--bite-dark);
}

.clear-cart-btn {
	background-color: var(--bite-red);
	color: white;
	border: none;
	padding: 12px 25px;
	border-radius: 8px;
	font-weight: 600;
	cursor: pointer;
	display: flex;
	align-items: center;
	gap: 8px;
	transition: background-color 0.3s;
}

.clear-cart-btn:hover {
	background-color: #ff4040;
}

/* Cart Layout */
.cart-layout {
	display: grid;
	grid-template-columns: 2fr 1fr;
	gap: 30px;
}

/* Cart Items */
.cart-items {
	display: flex;
	flex-direction: column;
	gap: 20px;
}

.cart-item-card {
	background: white;
	border-radius: 15px;
	padding: 20px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
	display: flex;
	gap: 20px;
	transition: all 0.3s;
}

.cart-item-card:hover {
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
}

.cart-item-img {
	width: 100px;
	height: 100px;
	border-radius: 10px;
	object-fit: cover;
	flex-shrink: 0;
}

.cart-item-details {
	flex: 1;
}

.cart-item-header {
	display: flex;
	justify-content: space-between;
	align-items: flex-start;
	margin-bottom: 10px;
}

.cart-item-name {
	font-size: 18px;
	font-weight: 600;
	color: var(--bite-dark);
}

.cart-item-price {
	font-size: 18px;
	font-weight: 600;
	color: var(--bite-orange);
}

.cart-item-restaurant {
	color: var(--bite-gray);
	margin-bottom: 10px;
	font-size: 14px;
}

.cart-item-actions {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-top: 15px;
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

.remove-btn {
	color: var(--bite-red);
	background: none;
	border: none;
	cursor: pointer;
	font-weight: 600;
	display: flex;
	align-items: center;
	gap: 8px;
	transition: color 0.3s;
}

.remove-btn:hover {
	color: #ff4040;
}

/* Order Summary */
.order-summary {
	background: white;
	border-radius: 15px;
	padding: 25px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
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

.checkout-btn {
	width: 100%;
	padding: 16px;
	background-color: var(--bite-orange);
	color: white;
	border: none;
	border-radius: 10px;
	font-size: 16px;
	font-weight: 600;
	cursor: pointer;
	transition: background-color 0.3s;
	margin-top: 25px;
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 10px;
}

.checkout-btn:hover {
	background-color: #e57200;
}

.checkout-btn:disabled {
	background-color: #ccc;
	cursor: not-allowed;
}

/* Empty Cart */
.empty-cart {
	text-align: center;
	padding: 80px 20px;
	grid-column: 1/-1;
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

.continue-shopping {
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

.continue-shopping:hover {
	background-color: #e57200;
}

/* Responsive */
@media ( max-width : 768px) {
	.cart-layout {
		grid-template-columns: 1fr;
	}
	.cart-item-card {
		flex-direction: column;
	}
	.cart-item-img {
		width: 100%;
		height: 150px;
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
			<a href="rest" class="logo"> <i class="fas fa-utensils"></i>
				BiteNow
			</a>

			<div class="user-menu">
				<a href="rest" class="nav-icon"> <i class="fas fa-home"></i> <span>Home</span>
				</a> <a href="orders.jsp" class="nav-icon"> <i
					class="fas fa-clipboard-list"></i> <span>Orders</span>
				</a>
				<div class="user-profile">
					<div class="profile-img">
						<%=username.charAt(0)%>
					</div>
					<span><%=username%></span>
				</div>
			</div>
		</div>
	</header>

	<!-- Cart Container -->
	<div class="cart-container">
		<div class="cart-header">
			<h1 class="cart-title">My Cart</h1>
			<%
			if (cartItems != null && !cartItems.isEmpty()) {
			%>
			<form action="cart" method="post"
				onsubmit="return confirm('Are you sure you want to clear your cart?');">
				<input type="hidden" name="action" value="clear">
				<button type="submit" class="clear-cart-btn">
					<i class="fas fa-trash"></i> Clear Cart
				</button>
			</form>
			<%
			}
			%>
		</div>

		<%
		if (cartItems != null && !cartItems.isEmpty()) {
		%>
		<div class="cart-layout">
			<!-- Cart Items -->
			<div class="cart-items">
				<%
				if (cartItems.isEmpty()) {
				%>
				<div class="empty-cart">
					<div class="empty-icon">
						<i class="fas fa-shopping-cart"></i>
					</div>
					<h2 class="empty-title">Your cart is empty</h2>
					<p class="empty-message">Add delicious food items from
						restaurants to get started!</p>
					<a href="rest" class="continue-shopping"> <i
						class="fas fa-utensils"></i> Continue Shopping
					</a>
				</div>
				<%
				} else {
				for (CartItem item : cartItems) {
				%>
				<div class="cart-item-card">
					<img
						src="<%=item.getImageUrl() != null
		? item.getImageUrl()
		: "https://images.pexels.com/photos/958545/pexels-photo-958545.jpeg"%>"
						alt="<%=item.getItemName()%>" class="cart-item-img">

					<div class="cart-item-details">
						<div class="cart-item-header">
							<h3 class="cart-item-name"><%=item.getItemName()%></h3>
							<span class="cart-item-price">₹<%=String.format("%.2f", item.getPrice() * item.getQuantity())%></span>
						</div>

						<p class="cart-item-restaurant">
							<i class="fas fa-store"></i>
							<%=item.getRestaurant()%>
						</p>

						<%
						if (item.getDescription() != null && !item.getDescription().isEmpty()) {
						%>
						<p class="cart-item-description"
							style="color: var(--bite-gray); font-size: 14px;">
							<%=item.getDescription()%>
						</p>
						<%
						}
						%>

						<div class="cart-item-actions">
							<div class="quantity-controls">
								<form action="cart" method="post" style="display: inline;">
									<input type="hidden" name="action" value="update"> <input
										type="hidden" name="cartId" value="<%=item.getCartId()%>">
									<input type="hidden" name="quantity"
										value="<%=item.getQuantity() - 1%>">
									<button type="submit" class="quantity-btn">-</button>
								</form>

								<span class="quantity"><%=item.getQuantity()%></span>

								<form action="cart" method="post" style="display: inline;">
									<input type="hidden" name="action" value="update"> <input
										type="hidden" name="cartId" value="<%=item.getCartId()%>">
									<input type="hidden" name="quantity"
										value="<%=item.getQuantity() + 1%>">
									<button type="submit" class="quantity-btn">+</button>
								</form>
							</div>

							<form action="cart" method="post"
								onsubmit="return confirm('Remove this item from cart?');">
								<input type="hidden" name="action" value="remove"> <input
									type="hidden" name="cartId" value="<%=item.getCartId()%>">
								<button type="submit" class="remove-btn">
									<i class="fas fa-trash"></i> Remove
								</button>
							</form>
						</div>
					</div>
				</div>
				<%
				}
				}
				%>
			</div>

			<!-- Order Summary -->
			<div class="order-summary">
				<h2 class="summary-title">Order Summary</h2>

				<div class="summary-row">
					<span class="summary-label">Subtotal</span> <span
						class="summary-value">₹<%=String.format("%.2f", cartTotal)%></span>
				</div>

				<div class="summary-row">
					<span class="summary-label">Delivery Charge</span> <span
						class="summary-value">₹<%=String.format("%.2f", deliveryCharge)%></span>
				</div>

				<div class="summary-row">
					<span class="summary-label">Tax (5%)</span> <span
						class="summary-value">₹<%=String.format("%.2f", tax)%></span>
				</div>

				<div class="summary-total">
					<span class="total-label">Total</span> <span class="total-value">₹<%=String.format("%.2f", totalAmount)%></span>
				</div>

				<%
				if (!cartItems.isEmpty()) {
				%>
				<form action="checkout.jsp" method="get">
					<button type="submit" class="checkout-btn">
						<i class="fas fa-shopping-bag"></i> PROCEED TO CHECKOUT
					</button>
				</form>
				<%
				} else {
				%>
				<form action="checkout" method="get">
					<button type="submit" class="checkout-btn">
						<i class="fas fa-shopping-bag"></i> PROCEED TO CHECKOUT
					</button>
				</form>
				<%
				}
				%>
			</div>
		</div>
		<%
		} else {
		%>
		<!-- Empty Cart -->
		<div class="empty-cart">
			<div class="empty-icon">
				<i class="fas fa-shopping-cart"></i>
			</div>
			<h2 class="empty-title">Your cart is empty</h2>
			<p class="empty-message">Add delicious food items from
				restaurants to get started!</p>
			<a href="rest" class="continue-shopping"> <i
				class="fas fa-utensils"></i> Continue Shopping
			</a>
		</div>
		<%
		}
		%>
	</div>

	<script>
        // Update quantity buttons
        document.querySelectorAll('.quantity-btn').forEach(btn => {
            btn.addEventListener('click', function(e) {
                const form = this.closest('form');
                const quantityInput = form.querySelector('input[name="quantity"]');
                
                // Validate quantity
                const newQuantity = parseInt(quantityInput.value);
                if (newQuantity < 0) {
                    e.preventDefault();
                    alert('Quantity cannot be negative');
                    return;
                }
                
                // Submit form if quantity is valid
                if (newQuantity === 0) {
                    if (!confirm('Remove this item from cart?')) {
                        e.preventDefault();
                    }
                }
            });
        });
        
        // Remove item confirmation
        document.querySelectorAll('.remove-btn').forEach(btn => {
            btn.addEventListener('click', function(e) {
                if (!confirm('Are you sure you want to remove this item?')) {
                    e.preventDefault();
                }
            });
        });
        
        // Clear cart confirmation
        const clearCartBtn = document.querySelector('.clear-cart-btn');
        if (clearCartBtn) {
            clearCartBtn.addEventListener('click', function(e) {
                if (!confirm('Are you sure you want to clear your entire cart?')) {
                    e.preventDefault();
                }
            });
        }
    </script>
</body>
</html>