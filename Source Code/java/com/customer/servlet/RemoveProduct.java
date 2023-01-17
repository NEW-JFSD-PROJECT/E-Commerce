package com.customer.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CartDaoImpl;
import com.db.DBConn;



@WebServlet("/remove_book")
public class RemoveProduct extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int pid = Integer.parseInt(req.getParameter("pid"));
		int cid=Integer.parseInt(req.getParameter("cid"));
		CartDaoImpl dao=new CartDaoImpl(DBConn.getConn());
		boolean f=dao.removeProduct(pid,cid);
		HttpSession session=req.getSession();
		
		if (f) {
			session.setAttribute("succmsg", "Product Remove from Cart Succesfully");
			resp.sendRedirect("cart.jsp");
		}else {
			session.setAttribute("failed", "Something Wrong On Server");
			resp.sendRedirect("cart.jsp");
		}
		
	}

	
	
}
