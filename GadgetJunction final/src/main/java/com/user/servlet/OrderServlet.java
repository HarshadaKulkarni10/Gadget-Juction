package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOimpl;
import com.DAO.OrderDAOimpl;
import com.DB.DBConnection;
import com.entity.Cart;
import com.entity.Order;

@WebServlet("/Order")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			HttpSession session = req.getSession();

			int id = Integer.parseInt(req.getParameter("id"));

			String name = req.getParameter("u_name");
			String email = req.getParameter("u_email");
			String phoneno = req.getParameter("u_phoneno");
			String address = req.getParameter("u_address");
			String landmark = req.getParameter("u_landmark");
			String city = req.getParameter("u_city");
			String state = req.getParameter("u_state");
			String pincode = req.getParameter("u_pincode");
			String paymenttype = req.getParameter("paymenttype");

			String fullAddress = address + "," + landmark + "," + city + "," + state + "," + pincode;

			CartDAOimpl dao = new CartDAOimpl(DBConnection.getConn());
			List<Cart> clist = dao.getProductByUser(id);

			if(clist.isEmpty())
			{
				session.setAttribute("FailMsg", "Please Add Item First");
				resp.sendRedirect("Checkout.jsp");
				
			}
			else {
				OrderDAOimpl dao2 = new OrderDAOimpl(DBConnection.getConn());
				int i = dao2.getOrderNo();

				Order o = null;

				ArrayList<Order> orderlist = new ArrayList<Order>();

				for (Cart c : clist) {
					i++;
					o = new Order();

					o.setOrderId("Prod_ORID_00" + i);
					o.setUsername(name);
					o.setEmail(email);
					o.setPhoneno(phoneno);
					o.setFulladd(fullAddress);
					o.setP_name(c.getP_name());
					o.setP_details(c.getP_details());
					o.setP_price(c.getP_price() + " ");
					o.setPaymenttype(paymenttype);

					orderlist.add(o);

				}

				if ("noSelect".equals(paymenttype)) {
					session.setAttribute("FailMsg", "Please Choose Payment Method");
					resp.sendRedirect("Checkout.jsp");
				} else {

					boolean f = dao2.saveOrder(orderlist);
					if (f) {
						
						resp.sendRedirect("OrderSuccess.jsp");

					} else {
						session.setAttribute("FailMsg", "Something is wrong");
						resp.sendRedirect("Checkout.jsp");
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
