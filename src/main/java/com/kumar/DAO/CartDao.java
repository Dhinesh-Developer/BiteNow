package com.kumar.DAO;

import java.util.List;

import com.kumar.Models.CartItem;

public interface CartDao {
	
	boolean addToCart(CartItem cartItem);
	List<CartItem> getCartItems(int uId);
	boolean updateCartItem(int cartId,int quantity);
	boolean removeFromCart(int cartId);
	boolean clearCart(int cartId);
	CartItem getCartItemById(int cartId);
	boolean itemExistsInCart(int uId,int itemId);
	CartItem getItemByUserAndItem(int userId,int itemId);
	int getCartCount(int uId);
	double getCartTotal(int uId);
}
