package com.manager.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ProductDao;
import com.db.DBConn;

@WebServlet("/deleteProduct")
public class deleteproduct extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));

		ProductDao dao = new ProductDao(DBConn.getConn());
		HttpSession session = req.getSession();

		if (dao.deleteProduct(id)) {
			session.setAttribute("succMsg", "Product Delete Sucessfully..");
			resp.sendRedirect("manager/view_product.jsp");
		} else {
			session.setAttribute("errorMsg", "something wrong on server");
			resp.sendRedirect("manager/view_product.jsp");
		}

	}
}
