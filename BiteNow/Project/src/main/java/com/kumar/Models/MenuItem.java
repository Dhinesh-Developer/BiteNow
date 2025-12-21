package com.kumar.Models;

public class MenuItem {
	
	private int item_id;
	private int restaurant_id;
	private String name;
	private String description;
	private double price;
	private String category;
	private String image_url;
	private boolean is_available;
	
	
	
	public MenuItem() {
		super();
	}


	public MenuItem(int restaurant_id, String name, String description, double price, String category, String image_url,
			boolean is_available) {
		super();
		this.restaurant_id = restaurant_id;
		this.name = name;
		this.description = description;
		this.price = price;
		this.category = category;
		this.image_url = image_url;
		this.is_available = is_available;
	}



	public MenuItem(int item_id, int restaurant_id, String name, String description, double price, String category,
			String image_url, boolean is_available) {
		super();
		this.item_id = item_id;
		this.restaurant_id = restaurant_id;
		this.name = name;
		this.description = description;
		this.price = price;
		this.category = category;
		this.image_url = image_url;
		this.is_available = is_available;
	}



	public int getItem_id() {
		return item_id;
	}



	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}



	public int getRestaurant_id() {
		return restaurant_id;
	}



	public void setRestaurant_id(int restaurant_id) {
		this.restaurant_id = restaurant_id;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
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



	public String getCategory() {
		return category;
	}



	public void setCategory(String category) {
		this.category = category;
	}



	public String getImage_url() {
		return image_url;
	}



	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}



	public boolean isIs_available() {
		return is_available;
	}



	public void setIs_available(boolean is_available) {
		this.is_available = is_available;
	}



	@Override
	public String toString() {
		return "MenuItem [item_id=" + item_id + ", restaurant_id=" + restaurant_id + ", name=" + name + ", description="
				+ description + ", price=" + price + ", category=" + category + ", image_url=" + image_url
				+ ", is_available=" + is_available + "]";
	}
	
	
	
	
}
