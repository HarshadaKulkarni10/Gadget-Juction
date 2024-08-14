package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Order;

public class OrderDAOimpl implements OrderDAO {

	private Connection conn;

	public OrderDAOimpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public int getOrderNo() {

		int i = 1;
		try {

			String sql = "select * from order ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				i++;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}

	@Override
	public boolean saveOrder(List<Order> olist) {
		boolean f = false;

		try {

			String sql = "insert into prod_order(o_id,u_name,u_email,u_address,u_phoneno,p_name,p_details,p_price,payment)values(?,?,?,?,?,?,?,?,?)";
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);

			for (Order o : olist) {
				ps.setString(1, o.getOrderId());
				ps.setString(2, o.getUsername());
				ps.setString(3, o.getEmail());
				ps.setString(4, o.getFulladd());
				ps.setString(5, o.getPhoneno());
				ps.setString(6, o.getP_name());
				ps.setString(7, o.getP_details());
				ps.setString(8, o.getP_price());
				ps.setString(9, o.getPaymenttype());

				ps.addBatch();
			}

			int[] count = ps.executeBatch();
			conn.commit();
			f = true;
			conn.setAutoCommit(true);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<Order> getProduct(String email) {
		List<Order> list = new ArrayList<Order>();
		Order o = null;
		try {

			String sql = "select * from prod_order where u_email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				o = new Order();
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getString(2));
				o.setUsername(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFulladd(rs.getString(5));
				o.setPhoneno(rs.getString(6));
				o.setP_name(rs.getString(7));
				o.setP_details(rs.getString(8));
				o.setP_price(rs.getString(9));
				o.setPaymenttype(rs.getString(10));

				list.add(o);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Order> getAllOrders() {
		List<Order> list = new ArrayList<Order>();
		Order o = null;
		try {

			String sql = "select * from prod_order";
			PreparedStatement ps = conn.prepareStatement(sql);
			

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				o = new Order();
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getString(2));
				o.setUsername(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFulladd(rs.getString(5));
				o.setPhoneno(rs.getString(6));
				o.setP_name(rs.getString(7));
				o.setP_details(rs.getString(8));
				o.setP_price(rs.getString(9));
				o.setPaymenttype(rs.getString(10));

				list.add(o);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

}
