package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.tomcat.jni.File;

import com.DAO.ProductDAOimpl;
import com.DB.DBConnection;
import com.entity.Product;
import com.mysql.cj.Session;

@WebServlet("/add_Products")
@MultipartConfig
public class addProduct extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String p_name = req.getParameter("p_name");
			String p_details = req.getParameter("p_details");
			String p_price = req.getParameter("p_price");
			String p_category = req.getParameter("p_category");
			String p_status = req.getParameter("p_status");
			Part part = req.getPart("p_image");
			
			String filename = part.getSubmittedFileName();
			
			
			Product p = new Product(p_name , p_details, p_price,p_category,p_status,filename,"admin");	
			ProductDAOimpl dao = new ProductDAOimpl(DBConnection.getConn());
			
			
			
			boolean f = dao.addProducts(p);
			

			HttpSession session = req.getSession();	
			
			if(f)
			{
				
				String path = getServletContext().getRealPath("")+"gadgets";

				java.io.File file = new java.io.File(path);
				part.write(path + java.io.File.separator + filename);
				
				session.setAttribute("FailMsg", "Something is Wrong");
				resp.sendRedirect("admin/addproducts.jsp");
				
			}
			else {
				session.setAttribute("SuccMsg", "Product is Added Successfully!!");
				resp.sendRedirect("admin/addproducts.jsp");
				
			}
			
					
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
