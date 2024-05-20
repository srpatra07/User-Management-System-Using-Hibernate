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

@WebServlet("/update")
public class UpdateServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id = Integer.parseInt(req.getParameter("id"));
		
		User user = new User();
		user.setName(req.getParameter("name"));
		user.setAge(Integer.parseInt(req.getParameter("age")));
		user.setEmail(req.getParameter("email"));
		user.setPassword(req.getParameter("password"));
		user.setMobile(Long.parseLong(req.getParameter("mobile")));
		user.setId(id);
		
		UserDao dao = new UserDao();
		dao.updateUserById(user);
		
		HttpSession session = req.getSession();
		session.setAttribute("updatesuccess", "User Updated Successfully...");
		resp.sendRedirect("home.jsp");
		
	}

}
