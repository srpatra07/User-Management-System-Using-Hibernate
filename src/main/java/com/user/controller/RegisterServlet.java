package com.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.user.dao.UserDao;
import com.user.dto.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		int age = Integer.parseInt(req.getParameter("age"));
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		long mobile = Long.parseLong(req.getParameter("mobile"));
		
		User u = new User();
		u.setName(name);
		u.setAge(age);
		u.setEmail(email);
		u.setPassword(password);
		u.setPassword(password);
		
		UserDao dao = new UserDao();
		dao.saveUser(u);
		
		HttpSession session = req.getSession();
		session.setAttribute("success", "Registration successfull...");
		resp.sendRedirect("register.jsp");
	}
}
