package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;
import com.mysql.cj.protocol.Resultset;

public class UserDAOimpl implements UserDAO {
	private Connection conn;

	public UserDAOimpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean userRegister(User us) {

		boolean f = false;

		try {
			String sql = "insert into user(u_name,u_email,u_phoneno,u_password) value(?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhoneno());
			ps.setString(4, us.getPassword());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public User login(String email, String password) {

		User us = null;

		try {
			String sql = "select * from user where u_email = ? and u_password = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				us = new User();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhoneno(rs.getString(4));
				us.setPassword(rs.getString(5));
				us.setAddress(rs.getString(6));
				us.setCity(rs.getString(7));
				us.setState(rs.getString(8));
				us.setPincode(rs.getString(9));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return us;
	}

	@Override
	public boolean CheckPassword(int id, String password) {
		boolean f = false;

		try {

			String sql = "select * from user where u_id = ? and u_password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public boolean UpdateProfile(User us) {
		boolean f = false;

		try {
			String sql = "update user set u_name=? ,u_email=? ,u_phoneno=? where u_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhoneno());
			
			ps.setInt(4, us.getId());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}

	@Override
	public boolean CheckUser(String email) {
		boolean f = true;
		
		try {
			String sql = "select * from user where u_email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, email);
			
			ResultSet rs = ps.executeQuery();			
			while(rs.next())
			{
				f = false;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	
}
