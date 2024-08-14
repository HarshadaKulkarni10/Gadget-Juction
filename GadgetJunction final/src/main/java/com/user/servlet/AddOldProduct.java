package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.ProductDAOimpl;
import com.DB.DBConnection;
import com.entity.Product;

@WebServlet("/AddOldProduct")
@MultipartConfig
public class AddOldProduct extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String p_name = req.getParameter("p_name");
			String p_details = req.getParameter("p_details");
			String p_price = req.getParameter("p_price");
			String p_category = "Old Product";
			String p_status = "Active";
			Part part = req.getPart("p_image");

			String filename = part.getSubmittedFileName();
			
			String useremail = req.getParameter("user");

			Product p = new Product(p_name, p_details, p_price, p_category, p_status, filename, useremail);
			ProductDAOimpl dao = new ProductDAOimpl(DBConnection.getConn());

			boolean f = dao.addProducts(p);

			HttpSession session = req.getSession();

			if (f) {

				String path = getServletContext().getRealPath("") + "gadgets";

				java.io.File file = new java.io.File(path);
				part.write(path + java.io.File.separator + filename);

				session.setAttribute("FailMsg", "Something is Wrong");
				resp.sendRedirect("SellOldProducts.jsp");

			} else {
				session.setAttribute("SuccMsg", "Product is Added Successfully!!");
				resp.sendRedirect("SellOldProducts.jsp");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
