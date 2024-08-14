package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.ProductDAOimpl;
import com.DB.DBConnection;

@WebServlet("/DeleteOldProduct")
public class DeleteOldProduct extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			String u_email = req.getParameter("u_email");
			int p_id = Integer.parseInt(req.getParameter("p_id"));
			
			ProductDAOimpl dao = new ProductDAOimpl(DBConnection.getConn());

			boolean f = dao.deleteOldProduct(u_email, "Old Product",p_id);

			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("SuccMsg", "Old Product Removed from Cart");
				resp.sendRedirect("EditOldProduct.jsp");
			} else {
				session.setAttribute("SuccMsg", "Something is Wrong");
				resp.sendRedirect("EditOldProduct.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
