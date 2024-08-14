package com.DAO;

import java.util.List;

import com.entity.Product;

public interface ProductDAO {
	public boolean addProducts(Product p);

	public List<Product> getAllProducts();

	public Product getProductById(int id);
	
	public boolean updateEditproduct(Product p);
	
	public boolean deleteProducts(int id);
	
	public List<Product> getNewProduct();
	
	public List<Product> getRecentProducts();
	
	public List<Product> getOldProducts();
	
	public List<Product> getAllRecentProduct();
	
	public List<Product> getAllNewProduct();
 	
	public List<Product> getAllOldProduct();
	
	public List<Product> getOldProduct(String u_email , String p_category);
	
	public boolean deleteOldProduct(String u_email,String p_category, int p_id);
	
	public List<Product> getProdBySearch(String ch);
	
} 
