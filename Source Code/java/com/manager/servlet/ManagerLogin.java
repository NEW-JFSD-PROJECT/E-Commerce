package com.manager.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CustomerDao;
import com.dao.ManagerDao;
import com.db.DBConn;
import com.entity.Customer;
import com.entity.Manager;
@WebServlet("/managerLogin")
public class ManagerLogin extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		HttpSession session = req.getSession();

		ManagerDao dao = new ManagerDao(DBConn.getConn());
		Manager manager = dao.login(email, password);

		if (manager != null) {
			session.setAttribute("managerobj", manager);
			resp.sendRedirect("manager/index.jsp");
		} else {
			session.setAttribute("errorMsg", "Invalid email & password");
			resp.sendRedirect("manager_login.jsp");
		}

	}
}
