package com.customer.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BankDaoImpl;
import com.dao.CardDaoImpl;
import com.db.DBConn;
import com.entity.Bank;
import com.entity.Card;

@WebServlet("/bank")
public class BankServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			String bankname = req.getParameter("bankname");
			String userid = req.getParameter("userid");
			String password = req.getParameter("password");

			int cid = Integer.parseInt(req.getParameter("id"));

			Bank b = new Bank(bankname, userid, password, cid);
			BankDaoImpl dao = new BankDaoImpl(DBConn.getConn());

			HttpSession session = req.getSession();

			boolean f = dao.addBank(b);

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
