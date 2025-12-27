package com.kumar.Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kumar.DAO.UserDao;
import com.kumar.DAOImpl.UserDaoImpl;
import com.kumar.Models.UserModel;

@WebServlet("/login")
public class LoginServlets extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		UserDao udao = new UserDaoImpl();
		List<UserModel> users = udao.getUserByEmail(email, password);

		// SUCCESS
		if (users != null && !users.isEmpty()) {

			UserModel user = users.get(0);

			HttpSession session = request.getSession();
			session.setAttribute("name", user.getName());

//            response.sendRedirect(request.getContextPath() + "/Home.jsp");
			response.sendRedirect(request.getContextPath() + "/rest");
			return;
		}

		// FAILURE
		request.setAttribute("error", "Invalid login credentials");
		RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
		rd.forward(request, response);
	}
}
