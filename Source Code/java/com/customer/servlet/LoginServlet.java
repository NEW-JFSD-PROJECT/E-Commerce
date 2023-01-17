package com.customer.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CustomerDao;
import com.db.DBConn;
import com.entity.Customer;

@WebServlet("/customerLogin")
public class LoginServlet extends HttpServlet{
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		HttpSession session = req.getSession();

		CustomerDao dao = new CustomerDao(DBConn.getConn());
		Customer customer = dao.login(email, password);

		if (customer != null) {
			session.setAttribute("customerobj", customer);
			resp.sendRedirect("all_product.jsp");
		} else {
			session.setAttribute("errorMsg", "Invalid email & password");
			resp.sendRedirect("customer_login.jsp");
		}

	}
}
