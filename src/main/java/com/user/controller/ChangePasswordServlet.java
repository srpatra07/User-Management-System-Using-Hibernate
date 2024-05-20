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

@WebServlet("/changePassword")
public class ChangePasswordServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id = Integer.parseInt(req.getParameter("id"));
		
		HttpSession session = req.getSession();
		
		User user = (User)session.getAttribute("userObj");
		
		String oldPassword = req.getParameter("oldPassword");
		
		String newPassword = req.getParameter("newPassword");
		
		String confirmNewPassword = req.getParameter("confirmNewPassword");
		
		UserDao dao = new UserDao();
		
		User reqUser = dao.fetchUserByEmailAndPassword(user.getEmail(), oldPassword);
		
		if(reqUser != null)
		{
			if(newPassword.equals(confirmNewPassword))
			{
				dao.updateUserPasswordById(id, newPassword);
				session.setAttribute("passwordSuccess", "Password Updated Successfully...");
				resp.sendRedirect("changePassword.jsp");
			}
		}
		else
		{
			session.setAttribute("passwordFailure", "Invalid Password!");
			resp.sendRedirect("changePassword.jsp");
		}
		
	}
	
}
