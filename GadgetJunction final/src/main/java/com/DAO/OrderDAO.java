package com.DAO;

import java.util.List;

import com.entity.Order;

public interface OrderDAO {
	
	public int getOrderNo();
	
	public boolean saveOrder(List<Order> olist);
	
	public List<Order> getProduct(String email);
	
	public List<Order> getAllOrders();
}

