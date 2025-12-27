package com.kumar.DAOImpl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kumar.DAO.UserDao;
import com.kumar.DBUtils.DbConnectionData;
import com.kumar.Models.UserModel;

public class UserDaoImpl implements UserDao{
	
	private static final String REGISTER = "INSERT INTO USERS (name,email,password,address,mobile) VALUES (?,?,?,?,?)";
	private static final String LOGIN = "SELECT * FROM USERS WHERE email=? AND password = ?";

	@Override
	public List<UserModel> getAllUsers() {
		// TODO Auto-generated method stub
		return null;
	}

	// login
	@Override
	public List<UserModel> getUserByEmail(String email, String password) {
		List<UserModel> users = new ArrayList<>();
		
		try {
			Connection con = DbConnectionData.getConnection();
			PreparedStatement pstmt = con.prepareStatement(LOGIN);
			pstmt.setString(1,email);
			pstmt.setString(2, password);
			ResultSet res = pstmt.executeQuery();
			while(res.next()) {
				UserModel user = new UserModel(res.getString("name"),res.getString("email"),
						res.getString("password"),res.getString("address"),res.getString("mobile"));
				
				users.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return users;
	}

	@Override
	public void deleteUserByEmail(String email) {
		// TODO Auto-generated method stub
		
	}

	// Register
	@Override
	public int addUser(UserModel user) {
		
		int x = -1;
		try {
			Connection con = DbConnectionData.getConnection();
			PreparedStatement pstmt = con.prepareStatement(REGISTER);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getAddress());
			pstmt.setString(5, user.getMobile());
			x = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return x;
	}
	
}
