package com.kumar.Models;

import java.sql.Timestamp;

public class Order {
	private int order_id;
	private int user_id;
	private int restaurant_id;
	private String restaurant_name;
	private double total_amount;
	private String status;
	private String delivery_address;
	private String payment_method;
	private String payment_status;
	private Timestamp order_date;

	// Constructors
	public Order() {
	}

	public Order(int order_id, int user_id, int restaurant_id, String restaurant_name, double total_amount,
			String status, String delivery_address, String payment_method, String payment_status,
			Timestamp order_date) {
		this.order_id = order_id;
		this.user_id = user_id;
		this.restaurant_id = restaurant_id;
		this.restaurant_name = restaurant_name;
		this.total_amount = total_amount;
		this.status = status;
		this.delivery_address = delivery_address;
		this.payment_method = payment_method;
		this.payment_status = payment_status;
		this.order_date = order_date;
	}

	// Getters and Setters
	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getRestaurant_id() {
		return restaurant_id;
	}

	public void setRestaurant_id(int restaurant_id) {
		this.restaurant_id = restaurant_id;
	}

	public String getRestaurant_name() {
		return restaurant_name;
	}

	public void setRestaurant_name(String restaurant_name) {
		this.restaurant_name = restaurant_name;
	}

	public double getTotal_amount() {
		return total_amount;
	}

	public void setTotal_amount(double total_amount) {
		this.total_amount = total_amount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDelivery_address() {
		return delivery_address;
	}

	public void setDelivery_address(String delivery_address) {
		this.delivery_address = delivery_address;
	}

	public String getPayment_method() {
		return payment_method;
	}

	public void setPayment_method(String payment_method) {
		this.payment_method = payment_method;
	}

	public String getPayment_status() {
		return payment_status;
	}

	public void setPayment_status(String payment_status) {
		this.payment_status = payment_status;
	}

	public Timestamp getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Timestamp order_date) {
		this.order_date = order_date;
	}

	@Override
	public String toString() {
		return "Order [order_id=" + order_id + ", user_id=" + user_id + ", restaurant_id=" + restaurant_id
				+ ", restaurant_name=" + restaurant_name + ", total_amount=" + total_amount + ", status=" + status
				+ ", delivery_address=" + delivery_address + ", payment_method=" + payment_method + ", payment_status="
				+ payment_status + ", order_date=" + order_date + "]";
	}
}