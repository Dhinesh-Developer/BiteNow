package com.kumar.Servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kumar.DAO.UserDao;
import com.kumar.DAOImpl.UserDaoImpl;
import com.kumar.Models.UserModel;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String address = req.getParameter("address");
		String mobile = req.getParameter("mobile");
		
		UserModel newUser = new UserModel(name,email,password,address,mobile);
		
		UserDao udao = new UserDaoImpl();
		int x = udao.addUser(newUser);
		PrintWriter out = resp.getWriter();
		
		if(x != -1) {
			
			out.println("Registered Successfully");
			
			resp.sendRedirect("Login.jsp");
		}else {
			out.println("Invalid Credentails...! Try Again");
		}
		
	}

}
