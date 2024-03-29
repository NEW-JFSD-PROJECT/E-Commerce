package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CategoryDao;
import com.db.DBConn;
@WebServlet("/addCategory")
public class addCategory extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String categoryname = req.getParameter("category");

		CategoryDao dao = new CategoryDao(DBConn.getConn());
		boolean f = dao.addCategory(categoryname);

		HttpSession session = req.getSession();

		if (f) {
			session.setAttribute("succMsg", "Category Added");
			resp.sendRedirect("admin/index.jsp");
		} else {
			session.setAttribute("errorMsg", "something wrong on server");
			resp.sendRedirect("admin/index.jsp");
		}

	}

}
