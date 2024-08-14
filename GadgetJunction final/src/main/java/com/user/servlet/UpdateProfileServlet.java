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

@WebServlet("/UpdateProfile")
public class UpdateProfileServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("u_name");
			String email = req.getParameter("u_email");
			String phoneno = req.getParameter("u_phoneno");
			String password = req.getParameter("u_password");

			User us = new User();
			us.setId(id);
			us.setName(name);
			us.setPhoneno(phoneno);

			HttpSession session = req.getSession();

			UserDAOimpl dao = new UserDAOimpl(DBConnection.getConn());
			boolean f = dao.CheckPassword(id, password);

			if (f) {
				boolean f2 = dao.UpdateProfile(us);
				if (f2) {
					session.setAttribute("SuccMsg", "User Profile Updated Successfully");
					resp.sendRedirect("EditProfile.jsp");
				} else {
					session.setAttribute("FailMsg", "Something is wrong on server");
					resp.sendRedirect("EditProfile.jsp");
				}
			} else {
				session.setAttribute("FailMsg", "Password is Incorrect");
				resp.sendRedirect("EditProfile.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
