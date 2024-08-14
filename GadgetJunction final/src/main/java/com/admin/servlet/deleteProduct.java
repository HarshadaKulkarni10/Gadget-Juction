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

@WebServlet("/deleteproducts")
public class deleteProduct extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));

			ProductDAOimpl dao = new ProductDAOimpl(DBConnection.getConn());
			boolean f = dao.deleteProducts(id);

			HttpSession session = req.getSession();

			if (f) {
				
				session.setAttribute("FailMsg", "Something is wrong");
				resp.sendRedirect("admin/allproducts.jsp");
	
			} 
			else 
			{
				session.setAttribute("SuccMsg", "Product Deleted successfully!");
				resp.sendRedirect("admin/allproducts.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
