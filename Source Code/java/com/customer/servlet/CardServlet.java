package com.customer.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CardDaoImpl;
import com.db.DBConn;
import com.entity.Card;



@WebServlet("/card")
public class CardServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			String cardname = req.getParameter("name");
			String cardnumber = req.getParameter("cardNumber");
			String month = req.getParameter("month");
			String year = req.getParameter("year");
			String cvv = req.getParameter("cvv");
			
			int cid = Integer.parseInt(req.getParameter("id"));
			
			Card c=new Card(cardname, cardnumber, month, year, cvv, cid);
			CardDaoImpl dao=new CardDaoImpl(DBConn.getConn());
			
			HttpSession session = req.getSession();

			boolean f = dao.addCart(c);
			
			if(f) {
				
				resp.sendRedirect("order_sucess.jsp");

			} else {
				resp.sendRedirect("payment.jsp");
			}
			
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	
}
