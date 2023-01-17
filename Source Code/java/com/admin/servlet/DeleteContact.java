package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CustomerDao;
import com.dao.contactDao;
import com.db.DBConn;


@WebServlet("/deletecontact")
public class DeleteContact extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));
		
		contactDao dao = new contactDao(DBConn.getConn());
		HttpSession session = req.getSession();

		if (dao.deleteContact(id)) {
			session.setAttribute("succMsg", "Contact Delete Sucessfully..");
			resp.sendRedirect("admin/contact.jsp");
		} else {
			session.setAttribute("errorMsg", "something wrong on server");
			resp.sendRedirect("admin/contact.jsp");
		}
		

	}
	
	
	

}
