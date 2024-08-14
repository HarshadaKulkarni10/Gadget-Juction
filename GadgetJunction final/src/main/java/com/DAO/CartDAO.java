package com.DAO;

import java.util.List;

import com.entity.Cart;
import com.entity.Product;

public interface CartDAO {
	public boolean addCart(Cart c);
	
	public  List<Cart> getProductByUser(int userId);
	
	public boolean deleteProduct(int p_id,  int u_id,int c_id);
	
	
	
}
