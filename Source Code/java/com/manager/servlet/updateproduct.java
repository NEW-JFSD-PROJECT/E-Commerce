package com.manager.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.ProductDao;
import com.db.DBConn;
import com.entity.product;


@WebServlet("/updateProduct")
@MultipartConfig
public class updateproduct extends HttpServlet{
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String productName=req.getParameter("pname");
		String productCategory=req.getParameter("pcategory");
		String productSubCategory=req.getParameter("psubcategory");
		String productPrice=req.getParameter("pprice");
		String productColor=req.getParameter("pcolor");
		Part p1=req.getPart("pimage");
		String fileName=p1.getSubmittedFileName();
		String productDesc=req.getParameter("pdecs");

		int id = Integer.parseInt(req.getParameter("id"));
		
		product p=new product(id, productName, productCategory, productSubCategory, productPrice, productColor, fileName, productDesc);
		
	ProductDao dao=new ProductDao(DBConn.getConn());
	
	
	
	HttpSession session = req.getSession();

	if (dao.updateProduct(p)) {
		
		
		String path=getServletContext().getRealPath("")+"product";
		File file=new File(path);
		
		p1.write(path+File.separator+fileName);
		
		session.setAttribute("succMsg", "Product Update Sucessfully");
		resp.sendRedirect("manager/view_product.jsp");
	} else {
		session.setAttribute("errorMsg", "Something wrong on server");
		resp.sendRedirect("manager/view_product.jsp");
	}

		
	

}
}
