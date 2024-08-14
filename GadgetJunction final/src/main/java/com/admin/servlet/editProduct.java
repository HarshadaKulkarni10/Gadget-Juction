package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.ProductDAOimpl;
import com.DB.DBConnection;
import com.entity.Product;

@WebServlet("/edit_Products")
public class editProduct extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int id = Integer.parseInt(req.getParameter("id"));
			String p_name = req.getParameter("p_name");
			String p_details = req.getParameter("p_details");
			String p_price = req.getParameter("p_price");
			String p_status = req.getParameter("p_status");
			
			Product p = new Product();
			p.setP_id(id);
			p.setP_name(p_name);
			p.setP_details(p_details);
			p.setP_price(p_price);
			p.setP_status(p_status);
			
			ProductDAOimpl dao = new ProductDAOimpl(DBConnection.getConn());
			boolean f = dao.updateEditproduct(p);
			
			HttpSession session = req.getSession();
			
			
			if(f)
			{
				session.setAttribute("SuccMsg", "Product updated successfully!");
				resp.sendRedirect("admin/allproducts.jsp");
			}
			else 
			{
				session.setAttribute("FailMsg", "Something is wrong");
				resp.sendRedirect("admin/allproducts.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
}
