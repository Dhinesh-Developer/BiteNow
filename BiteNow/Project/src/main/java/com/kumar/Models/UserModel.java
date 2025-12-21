package com.kumar.Models;

import java.util.Objects;

public class UserModel {
	
	private int uId;
	private String name;
	private String email;
	private String password;
	private String address;
	private String mobile;
	
	public UserModel(int uId, String name, String email, String password, String address, String mobile) {
		super();
		this.uId = uId;
		this.name = name;
		this.email = email;
		this.password = password;
		this.address = address;
		this.mobile = mobile;
	}
	public UserModel(String name, String email, String password, String address, String mobile) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.address = address;
		this.mobile = mobile;
	}
	public UserModel() {
		super();
	}
	public int getuId() {
		return uId;
	}
	public void setuId(int uId) {
		this.uId = uId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	@Override
	public String toString() {
		return "UserModel [uId=" + uId + ", name=" + name + ", email=" + email + ", password=" + password + ", address="
				+ address + ", mobile=" + mobile + "]";
	}
	@Override
	public int hashCode() {
		return Objects.hash(address, email, mobile, name, password, uId);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		UserModel other = (UserModel) obj;
		return Objects.equals(address, other.address) && Objects.equals(email, other.email)
				&& Objects.equals(mobile, other.mobile) && Objects.equals(name, other.name)
				&& Objects.equals(password, other.password) && uId == other.uId;
	}
	
	
}
