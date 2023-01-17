package com.customer.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CartDao;
import com.dao.CartDaoImpl;
import com.dao.ProductDao;
import com.db.DBConn;
import com.entity.Cart;
import com.entity.product;

@WebServlet("/cartservlet")
public class cartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			int pid = Integer.parseInt(req.getParameter("pid"));
			int cid = Integer.parseInt(req.getParameter("cid"));
			String size=req.getParameter("size");
			ProductDao dao = new ProductDao(DBConn.getConn());
			product p = dao.getProductById(pid);
			String name = p.getPname();
			String category = p.getPcategory();
			Double price = Double.parseDouble(p.getPprice());
			Double Totalprice = Double.parseDouble(p.getPprice());

			Cart c = new Cart(pid, cid, name, category, price, Totalprice, size);

			CartDaoImpl dao2 = new CartDaoImpl(DBConn.getConn());
			 HttpSession session = req.getSession();
			boolean f = dao2.addCart(c);
			
			if (f) {
				session.setAttribute("addcart", "Product add to cart succesfully");
				resp.sendRedirect("all_product.jsp");
			} else {
				session.setAttribute("failed", "Something Wrong on Server");
				resp.sendRedirect("all_product.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
