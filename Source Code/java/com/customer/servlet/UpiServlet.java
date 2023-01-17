package com.customer.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UpiDaoImpl;
import com.db.DBConn;
import com.entity.Upi;


@WebServlet("/upi")
public class UpiServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			String upiname = req.getParameter("upiname");
			String name = req.getParameter("name");
			String upiid = req.getParameter("upiid");
			int cid = Integer.parseInt(req.getParameter("id"));
			
			Upi u=new Upi(upiname, name, upiid, cid);
			
			UpiDaoImpl dao=new UpiDaoImpl(DBConn.getConn());
			
			HttpSession session = req.getSession();

			boolean f = dao.addUpi(u);
			
			if (f) {

				resp.sendRedirect("order_sucess.jsp");

			} else {
				
				resp.sendRedirect("payment.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	

}
