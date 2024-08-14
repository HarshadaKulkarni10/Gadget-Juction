package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOimpl;
import com.DB.DBConnection;
import com.entity.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name = req.getParameter("u_name");
			String email = req.getParameter("u_email");
			String phoneno = req.getParameter("u_phoneno");
			String password = req.getParameter("u_password");
			String check = req.getParameter("check");

			// System.out.println(name+" "+email+" "+phoneno+" "+password+" "+check);
			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhoneno(phoneno);
			us.setPassword(password);

			HttpSession session = req.getSession();

			if (check != null) {
				UserDAOimpl dao = new UserDAOimpl(DBConnection.getConn());
				boolean f2 = dao.CheckUser(email);
				if (f2) {
					boolean f = dao.userRegister(us);
					if (f) {

						// System.out.println("User Registered Successfully");
						session.setAttribute("SuccMsg", "User Registered Successfully");
						resp.sendRedirect("register.jsp");
					} else {
						// System.out.println("Something went wrong");
						session.setAttribute("FailMsg", "Something went wrong");
						resp.sendRedirect("register.jsp");
					}
				} else {
					session.setAttribute("FailMsg", "User Already Exists! Try with Another Email");
					resp.sendRedirect("register.jsp");
				}
			} else {

				session.setAttribute("SuccMsg", "Please Check Agree terms and Conditions");
				resp.sendRedirect("register.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
