package com.hj.assgin1.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.hj.assgin1.model.User;

/*
 * Controller Servlet
 * Receives form data from index.jsp
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
	 * Handles form submission using POST method
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Create User object (Model)
		User user = new User();

		// Get values from form
		user.setUserId(request.getParameter("userid"));
		user.setPassword(request.getParameter("password"));
		user.setName(request.getParameter("name"));
		user.setAddress(request.getParameter("address"));
		user.setCountry(request.getParameter("country"));
		user.setZip(request.getParameter("zip"));
		user.setEmail(request.getParameter("email"));
		user.setSex(request.getParameter("sex"));
		user.setLanguage(request.getParameter("language"));
		user.setAbout(request.getParameter("about"));

		// Simple response (no database)
		response.setContentType("text/html");
		response.getWriter().println("<h2>Registration Successful</h2>");
		response.getWriter().println("<p>User ID: " + user.getUserId() + "</p>");
		response.getWriter().println("<p>Name: " + user.getName() + "</p>");
		response.getWriter().println("<p>Email: " + user.getEmail() + "</p>");
		response.getWriter().println("<p>Country: " + user.getCountry() + "</p>");
	}
}
