package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.dao.ManagerDao;
import com.db.DBConn;
@WebServlet("/deleteManager")
public class deleteManager extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));
		
		ManagerDao dao = new ManagerDao(DBConn.getConn());
		HttpSession session = req.getSession();

		if (dao.deleteManager(id)) {
			session.setAttribute("succMsg", "Manager Delete Sucessfully..");
			resp.sendRedirect("admin/view_manager.jsp");
		} else {
			session.setAttribute("errorMsg", "something wrong on server");
			resp.sendRedirect("admin/view_manager.jsp");
		}
		

	}
}
