package com.customer.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.dao.CodDao;
import com.db.DBConn;
import com.entity.Card;
import com.entity.Cod;


@WebServlet("/cod")
public class CodServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
try {
			
			String cod = req.getParameter("cod");
			
			int cid = Integer.parseInt(req.getParameter("id"));
			
			Cod c=new Cod(cod, cid);
			CodDao dao=new CodDao(DBConn.getConn());
			
			HttpSession session = req.getSession();

			boolean f = dao.addCod(c);
			
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
