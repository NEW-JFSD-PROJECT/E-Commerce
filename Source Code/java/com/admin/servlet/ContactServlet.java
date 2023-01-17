package com.admin.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ManagerDao;
import com.dao.contactDao;
import com.db.DBConn;
import com.em.SendMail;
import com.entity.Manager;
import com.entity.contact;

@WebServlet("/contact")
public class ContactServlet extends HttpServlet{
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String num = req.getParameter("phno");
			String msg = req.getParameter("msg");
			String message="Thank You For Contact With Us We Will Get U Soon....  ";
			String subject="Thank You";
			String to=email;
			String from="debadatta2468.info@gmail.com";
		contact c=new contact(name, email, num, msg);

			contactDao dao = new contactDao(DBConn.getConn());
			HttpSession session = req.getSession();

			if (dao.register(c)) {
				SendMail.sendEmail(message, subject, to, from);
				session.setAttribute("sucMsg", "Thank you We will get back to\r\n"
						+ "											you as soon");
				resp.sendRedirect("contactus.jsp");
			} else {
				session.setAttribute("errorMsg", "something wrong on server");
				resp.sendRedirect("contactus.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}


}
