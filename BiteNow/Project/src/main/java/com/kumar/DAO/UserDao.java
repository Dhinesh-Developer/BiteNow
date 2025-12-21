package com.kumar.DAO;

import java.util.List;

import com.kumar.Models.UserModel;

public interface UserDao {

	List<UserModel> getAllUsers();
	List<UserModel> getUserByEmail(String email,String password);
	void deleteUserByEmail(String email);
	int addUser(UserModel user);
}
