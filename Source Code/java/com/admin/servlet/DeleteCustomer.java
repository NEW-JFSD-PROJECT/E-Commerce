package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CustomerDao;
import com.db.DBConn;

@WebServlet("/deleteCustomer")
public class DeleteCustomer extends HttpServlet{
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));
		
		CustomerDao dao = new CustomerDao(DBConn.getConn());
		HttpSession session = req.getSession();

		if (dao.deleteCustomer(id)) {
			session.setAttribute("succMsg", "Customer Delete Sucessfully..");
			resp.sendRedirect("admin/view_customer.jsp");
		} else {
			session.setAttribute("errorMsg", "something wrong on server");
			resp.sendRedirect("admin/view_customer.jsp");
		}
		

	}


}
