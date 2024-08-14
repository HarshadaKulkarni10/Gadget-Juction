package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOimpl;
import com.DAO.ProductDAOimpl;
import com.DB.DBConnection;
import com.entity.Cart;
import com.entity.Product;



@WebServlet("/cart")
public class CartServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int p_id = Integer.parseInt(req.getParameter("p_id").trim());
			int u_id = Integer.parseInt(req.getParameter("u_id").trim());
			
			ProductDAOimpl dao = new ProductDAOimpl(DBConnection.getConn());
			Product p = dao.getProductById(p_id);
			
			Cart c = new Cart();
			c.setP_id(p_id);
			c.setU_id(u_id);
			c.setP_name(p.getP_name());
			c.setP_details(p.getP_details());
			c.setP_price(Double.parseDouble(p.getP_price()));
			c.setTotal_price(Double.parseDouble(p.getP_price()));
			
			CartDAOimpl dao2 = new CartDAOimpl(DBConnection.getConn());
			boolean f = dao2.addCart(c);
			
			HttpSession sess = req.getSession();
			
			if(f)
			{
				
				sess.setAttribute("addCart", "Product Added to cart");
				resp.sendRedirect("AllNewProducts.jsp");
			}else
			{

				sess.setAttribute("failed", "Something is wrong");
				resp.sendRedirect("AllNewProducts.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
