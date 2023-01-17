package com.customer.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CardDaoImpl;
import com.dao.CartDaoImpl;
import com.dao.OrderDao;
import com.db.DBConn;
import com.entity.Card;
import com.entity.Cart;
import com.entity.Order;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("name");
			String phno = req.getParameter("phno");
			String email = req.getParameter("email");
			String address = req.getParameter("address");
			String landmark = req.getParameter("land");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pin = req.getParameter("pin");
			String payment = req.getParameter("payment");

			String fullAdd = address + "," + landmark + "," + city + "," + state + "," + pin;

			// System.out.println(name+"--"+phno+"--"+"--"+email+"--"+payment+"--"+fullAdd);

			CartDaoImpl dao = new CartDaoImpl(DBConn.getConn());
			HttpSession session = req.getSession();
			List<Cart> plist = dao.getProductByCustomer(id);

			if (plist.isEmpty()) {
				session.setAttribute("failed", "Add Item");
				resp.sendRedirect("cart.jsp");
			} else {
				OrderDao dao1 = new OrderDao(DBConn.getConn());

				Order o = null;
				Random r = new Random();
				ArrayList<Order> orderList = new ArrayList<Order>();
				for (Cart c : plist) {
					o = new Order();
					o.setOrder_id("PRODUCT-ORD-00" + r.nextInt(1000));
					o.setUser_name(name);
					o.setPhone(phno);
					o.setEmail(email);
					o.setAdress(fullAdd);
					o.setProduct_name(c.getpName());
					o.setCategory(c.getpCategory());
					o.setPrice(c.getPrice() + "");
					o.setPayment(payment);
					o.setCid(id);
					o.setStastus("pending");
					orderList.add(o);

				}
				boolean f = dao1.addOrder(orderList);
				if (f) 
				{
				if ("noselect".equals(payment)) {
					session.setAttribute("msg", "Please Choose Payment Method");
					resp.sendRedirect("cart.jsp");
				}if ("credit_card".equals(payment)) {
					resp.sendRedirect("creditcard.jsp");
				}if ("upi".equals(payment)) {
					resp.sendRedirect("upi.jsp");
				}if ("net_banking".equals(payment)) {
					resp.sendRedirect("bank.jsp");
				}if ("cod".equals(payment)) {
					resp.sendRedirect("cod.jsp");
				}
				
				}else {
					session.setAttribute("Failedmsg", "Order Failed Due to Server Isssue");
					resp.sendRedirect("cart.jsp");
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
