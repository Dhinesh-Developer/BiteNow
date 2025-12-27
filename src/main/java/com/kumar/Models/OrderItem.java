package com.kumar.Models;

public class OrderItem {
	private int order_item_id;
	private int order_id;
	private int item_id;
	private String item_name;
	private double price;
	private int quantity;

	// Constructors
	public OrderItem() {
	}

	public OrderItem(int order_item_id, int order_id, int item_id, String item_name, double price, int quantity) {
		this.order_item_id = order_item_id;
		this.order_id = order_id;
		this.item_id = item_id;
		this.item_name = item_name;
		this.price = price;
		this.quantity = quantity;
	}

	// Getters and Setters
	public int getOrder_item_id() {
		return order_item_id;
	}

	public void setOrder_item_id(int order_item_id) {
		this.order_item_id = order_item_id;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public int getItem_id() {
		return item_id;
	}

	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
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

	public double getTotalPrice() {
		return price * quantity;
	}

	@Override
	public String toString() {
		return "OrderItem [order_item_id=" + order_item_id + ", order_id=" + order_id + ", item_id=" + item_id
				+ ", item_name=" + item_name + ", price=" + price + ", quantity=" + quantity + "]";
	}
}
