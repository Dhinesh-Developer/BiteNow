<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    Integer orderId = (Integer) sessionObj.getAttribute("orderId");
    Double totalAmount = (Double) sessionObj.getAttribute("totalAmount");
    
    if (orderId == null || totalAmount == null) {
        response.sendRedirect("cart");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Payment Gateway</title>
    <style>
        .payment-container {
            max-width: 500px;
            margin: 50px auto;
            padding: 30px;
            border: 1px solid #ddd;
            border-radius: 10px;
            text-align: center;
        }
        
        .success-btn {
            background-color: #4CAF50;
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 20px;
        }
        
        .fail-btn {
            background-color: #f44336;
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="payment-container">
        <h2>Payment Gateway</h2>
        <p>Order ID: <%= orderId %></p>
        <p>Amount: ₹<%= String.format("%.2f", totalAmount) %></p>
        
        <h3>Simulated Payment Gateway</h3>
        <p>Click "Pay Success" to simulate successful payment</p>
        <p>Click "Pay Fail" to simulate failed payment</p>
        
        <form action="paymentCallback" method="post">
            <input type="hidden" name="orderId" value="<%= orderId %>">
            <button type="submit" name="status" value="success" class="success-btn">
                Pay Success
            </button>
            <button type="submit" name="status" value="fail" class="fail-btn">
                Pay Fail
            </button>
        </form>
    </div>
</body>
</html>