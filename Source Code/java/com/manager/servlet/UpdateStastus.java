package com.manager.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.dao.OrderDao;
import com.db.DBConn;


@WebServlet("/updateStatus")
public class UpdateStastus extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			int id = Integer.parseInt(req.getParameter("id"));
			
			String comm = req.getParameter("comm");

			OrderDao dao = new OrderDao(DBConn.getConn());

			HttpSession session = req.getSession();

			if (dao.updateCommentStatus(id,comm)) {
				session.setAttribute("succMsg", "Comment Updated");
				resp.sendRedirect("manager/order.jsp");
			} else {
				session.setAttribute("errorMsg", "Something wrong on server");
				resp.sendRedirect("manager/order.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
