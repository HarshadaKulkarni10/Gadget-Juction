package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOimpl;
import com.DB.DBConnection;

@WebServlet("/RemoveProduct")
public class RemoveCartProduct extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pIdParam = req.getParameter("p_id");
		String uIdParam = req.getParameter("u_id");
		String cIdParam = req.getParameter("c_id");
		
		if (pIdParam != null && !pIdParam.isEmpty()  ) {
			try {
				int p_id = Integer.parseInt(pIdParam);
				int u_id = Integer.parseInt(uIdParam);
				int c_id = Integer.parseInt(cIdParam);
				
				CartDAOimpl dao = new CartDAOimpl(DBConnection.getConn());
				boolean f = dao.deleteProduct(p_id,u_id,c_id);

				HttpSession session = req.getSession();

				if (f) {
					session.setAttribute("SuccMsg", "Product Removed from Cart");
					resp.sendRedirect("Checkout.jsp");
				} else {
					session.setAttribute("FailMsg", "Something is Wrong");
					resp.sendRedirect("Checkout.jsp");
				}
			} catch (NumberFormatException e) {
				// Handle the case where p_idParam is not a valid integer
				// Log an error, throw an exception, or perform appropriate actions
				e.printStackTrace(); // Add logging or error handling
			}
		} else {
			// Handle the case where p_idParam is null or empty
			// Log an error, throw an exception, or perform appropriate actions
		}

	}

}
