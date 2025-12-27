package com.kumar.Servlets;

import com.kumar.DAOImpl.CartDaoImpl;
import com.kumar.Models.CartItem;
import com.kumar.Models.UserModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        UserModel user = (UserModel) session.getAttribute("user");
        CartDaoImpl cartDao = new CartDaoImpl();
        
        String action = request.getParameter("action");
        
        if ("count".equals(action)) {
            // Return cart count as JSON
            int count = cartDao.getCartCount(user.getuId());
            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            out.print(count);
            return;
        }
        
        // Get cart items for the user
        List<CartItem> cartItems = cartDao.getCartItems(user.getuId());
        double cartTotal = cartDao.getCartTotal(user.getuId());
        
        request.setAttribute("cartItems", cartItems);
        request.setAttribute("cartTotal", cartTotal);
        
        RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
        rd.forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        UserModel user = (UserModel) session.getAttribute("user");
        CartDaoImpl cartDao = new CartDaoImpl();
        
        String action = request.getParameter("action");
        
        System.out.println("CartServlet POST - Action: " + action);
        System.out.println("User ID: " + user.getuId());
        
        if ("add".equals(action)) {
            // Add item to cart from menu page
            int itemId = Integer.parseInt(request.getParameter("itemId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            
            System.out.println("Adding item to cart - Item ID: " + itemId + ", Quantity: " + quantity);
            
            CartItem cartItem = new CartItem(user.getuId(), itemId, quantity);
            
            // Check if item already exists in cart
            CartItem existingItem = cartDao.getCartItemByUserAndItem(user.getuId(), itemId);
            
            if (existingItem != null) {
                // Update quantity
                int newQuantity = existingItem.getQuantity() + quantity;
                cartDao.updateCartItem(existingItem.getCartId(), newQuantity);
                System.out.println("Updated existing cart item");
            } else {
                // Add new item
                boolean success = cartDao.addToCart(cartItem);
                System.out.println("Added new cart item - Success: " + success);
            }
            
            response.sendRedirect("cart");
            
        } else if ("update".equals(action)) {
            // Update cart item quantity
            int cartId = Integer.parseInt(request.getParameter("cartId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            
            System.out.println("Updating cart item - Cart ID: " + cartId + ", Quantity: " + quantity);
            
            if (quantity > 0) {
                cartDao.updateCartItem(cartId, quantity);
            } else {
                cartDao.removeFromCart(cartId);
            }
            
            response.sendRedirect("cart");
            
        } else if ("remove".equals(action)) {
            // Remove item from cart
            int cartId = Integer.parseInt(request.getParameter("cartId"));
            cartDao.removeFromCart(cartId);
            
            response.sendRedirect("cart");
            
        } else if ("clear".equals(action)) {
            // Clear entire cart
            cartDao.clearCart(user.getuId());
            
            response.sendRedirect("cart");
        }
    }
}