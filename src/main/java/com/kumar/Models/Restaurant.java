package com.kumar.Models;

public class Restaurant {
	
	private int restaurant_id;
	private int owner_id;
	private String name;
	private String description;
	private String cuisine_type;
	private String address;
	private String phone;
	private double rating;
	private String image_url;
	private boolean is_active;
	
	public Restaurant() {
	}

	public Restaurant(int restaurant_id, int owner_id, String name, String description, String cuisine_type,
			String address, String phone, double rating, String image_url, boolean is_active) {
		super();
		this.restaurant_id = restaurant_id;
		this.owner_id = owner_id;
		this.name = name;
		this.description = description;
		this.cuisine_type = cuisine_type;
		this.address = address;
		this.phone = phone;
		this.rating = rating;
		this.image_url = image_url;
		this.is_active = is_active;
	}

	public Restaurant(int owner_id, String name, String description, String cuisine_type, String address, String phone,
			double rating, String image_url, boolean is_active) {
		super();
		this.owner_id = owner_id;
		this.name = name;
		this.description = description;
		this.cuisine_type = cuisine_type;
		this.address = address;
		this.phone = phone;
		this.rating = rating;
		this.image_url = image_url;
		this.is_active = is_active;
	}

	public int getRestaurant_id() {
		return restaurant_id;
	}

	public void setRestaurant_id(int restaurant_id) {
		this.restaurant_id = restaurant_id;
	}

	public int getOwner_id() {
		return owner_id;
	}

	public void setOwner_id(int owner_id) {
		this.owner_id = owner_id;
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

	public String getCuisine_type() {
		return cuisine_type;
	}

	public void setCuisine_type(String cuisine_type) {
		this.cuisine_type = cuisine_type;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	public String getImage_url() {
		return image_url;
	}

	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}

	public boolean isIs_active() {
		return is_active;
	}

	public void setIs_active(boolean is_active) {
		this.is_active = is_active;
	}

	@Override
	public String toString() {
		return "Restaurant [restaurant_id=" + restaurant_id + ", owner_id=" + owner_id + ", name=" + name
				+ ", description=" + description + ", cuisine_type=" + cuisine_type + ", address=" + address
				+ ", phone=" + phone + ", rating=" + rating + ", image_url=" + image_url + ", is_active=" + is_active
				+ "]";
	}

	
	
	
}
