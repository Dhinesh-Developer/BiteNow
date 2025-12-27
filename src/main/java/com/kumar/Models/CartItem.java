package com.kumar.Models;

public class CartItem {
	
	private int cartId;
	private int uId;
	private int itemId;
	private int restaurant;
	private String itemName;
	private String description;
	private double price;
	private int quantity;
	private String imageUrl;
	private String restaurantName;
	
	
	public double getTotalPrice() {
		return price * quantity;
	}
	
	public CartItem() {
		
	}
	
	public CartItem(int userId,int itemId,int quantity) {
		this.uId = userId;
		this.itemId = itemId;
		this.quantity = quantity;
	}

	public CartItem(int cartId, int uId, int itemId, int restaurant, String itemName, String description, double price,
			int quantity, String imageUrl, String restaurantName) {
		super();
		this.cartId = cartId;
		this.uId = uId;
		this.itemId = itemId;
		this.restaurant = restaurant;
		this.itemName = itemName;
		this.description = description;
		this.price = price;
		this.quantity = quantity;
		this.imageUrl = imageUrl;
		this.restaurantName = restaurantName;
	}

	public CartItem(int uId, int itemId, int restaurant, String itemName, String description, double price,
			int quantity, String imageUrl, String restaurantName) {
		super();
		this.uId = uId;
		this.itemId = itemId;
		this.restaurant = restaurant;
		this.itemName = itemName;
		this.description = description;
		this.price = price;
		this.quantity = quantity;
		this.imageUrl = imageUrl;
		this.restaurantName = restaurantName;
	}

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public int getuId() {
		return uId;
	}

	public void setuId(int uId) {
		this.uId = uId;
	}

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public int getRestaurant() {
		return restaurant;
	}

	public void setRestaurant(int restaurant) {
		this.restaurant = restaurant;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getRestaurantName() {
		return restaurantName;
	}

	public void setRestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
	}

	@Override
	public String toString() {
		return "CartItem [cartId=" + cartId + ", uId=" + uId + ", itemId=" + itemId + ", restaurant=" + restaurant
				+ ", itemName=" + itemName + ", description=" + description + ", price=" + price + ", quantity="
				+ quantity + ", imageUrl=" + imageUrl + ", restaurantName=" + restaurantName + "]";
	}
	
}
