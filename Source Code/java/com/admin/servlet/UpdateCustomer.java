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
import com.entity.Customer;
@WebServlet("/updateCustomer")
public class UpdateCustomer extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			String fullname = req.getParameter("fullname");
			String gender = req.getParameter("gender");
			String age = req.getParameter("age");
			String phno = req.getParameter("phno");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			String address = req.getParameter("address");

			int id = Integer.parseInt(req.getParameter("id"));

			Customer c = new Customer(id,fullname, gender, age, phno, email, password, address);
			CustomerDao dao=new CustomerDao(DBConn.getConn());
			
			HttpSession session = req.getSession();

			if (dao.updateCustomer(c)) {
				session.setAttribute("succMsg", "Customer Update Sucessfully..");
				resp.sendRedirect("admin/view_customer.jsp");
			} else {
				session.setAttribute("errorMsg", "something wrong on server");
				resp.sendRedirect("admin/view_customer.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

}
}
