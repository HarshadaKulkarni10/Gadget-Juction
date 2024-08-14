package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Cart;
import com.entity.Product;

public class CartDAOimpl implements CartDAO{

	private Connection conn;
	public CartDAOimpl(Connection conn) 
	{
		this.conn = conn;
	}
	
	@Override
	public boolean addCart(Cart c) {
		boolean f = false;
		
		try {
			
			String sql = "insert into cart(p_id,u_id,p_name,p_details,p_price,total_price)values(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, c.getP_id());
			ps.setInt(2, c.getU_id());
			ps.setString(3, c.getP_name());
			ps.setString(4, c.getP_details());
			ps.setDouble(5, c.getP_price());
			ps.setDouble(6, c.getTotal_price());
			
			int i = ps.executeUpdate();
			if(i == 1)
			{
				f =  true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return f;
	}

	@Override
	public List<Cart> getProductByUser(int userId) {
		
		List<Cart> list = new ArrayList<Cart>();
		Cart c = null;
		
		double totalPrice = 0;
		
		try {
			
			String sql = "select * from cart where u_id = ?"; 
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				
				c = new Cart();
				c.setC_id(rs.getInt(1));
				c.setP_id(rs.getInt(2));
				c.setU_id(rs.getInt(3));
				c.setP_name(rs.getString(4));
				c.setP_details(rs.getNString(5));
				c.setP_price(rs.getDouble(6));
			
				
				totalPrice = totalPrice + rs.getDouble(7);
				c.setTotal_price(totalPrice);
				
				list.add(c);
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return list;
	}

	
	
	@Override
	public boolean deleteProduct(int p_id , int u_id , int c_id ) {
		
		boolean f = false;
		try {
			String  sql = "delete from cart where p_id = ? and u_id = ? and c_id = ?";
			PreparedStatement ps =  conn.prepareStatement(sql);
			ps.setInt(1, p_id);
			ps.setInt(2, u_id);
			ps.setInt(3, c_id);
			
			int  i = ps.executeUpdate();
			
			if(i == 1)
			{
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}
	
	

}
