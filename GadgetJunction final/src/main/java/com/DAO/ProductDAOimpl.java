package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Product;

public class ProductDAOimpl implements ProductDAO {

	private Connection conn;

	public ProductDAOimpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addProducts(Product p) {
		boolean f = false;
		try {
			String sql = "insert into product(p_name,p_details,p_price,p_category,p_image,p_status,u_email)values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, p.getP_name());
			ps.setString(2, p.getP_details());
			ps.setString(3, p.getP_price());
			ps.setString(4, p.getP_category());
			ps.setString(5, p.getP_image());
			ps.setString(6, p.getP_status());
			ps.setString(7, p.getU_email());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	@Override
	public List<Product> getAllProducts() {

		List<Product> list = new ArrayList<Product>();
		Product prod = null;

		try {

			String sql = "select * from product";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				prod = new Product();
				prod.setP_id(rs.getInt(1));
				prod.setP_name(rs.getString(2));
				prod.setP_details(rs.getString(3));
				prod.setP_price(rs.getString(4));
				prod.setP_category(rs.getString(5));
				prod.setP_image(rs.getString(6));
				prod.setP_status(rs.getString(7));
				prod.setU_email(rs.getString(8));
				list.add(prod);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public Product getProductById(int id) {

		Product prod = null;
		try {
			String sql = "select * from product where p_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				prod = new Product();
				prod.setP_id(rs.getInt(1));
				prod.setP_name(rs.getString(2));
				prod.setP_details(rs.getString(3));
				prod.setP_price(rs.getString(4));
				prod.setP_category(rs.getString(5));
				prod.setP_image(rs.getString(6));
				prod.setP_status(rs.getString(7));
				prod.setU_email(rs.getString(8));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return prod;
	}

	@Override
	public boolean updateEditproduct(Product p) {
		boolean f = false;

		try {
			String sql = "update product set p_name=?,p_details=?,p_price=?,p_status=? where p_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, p.getP_name());
			ps.setString(2, p.getP_details());
			ps.setString(3, p.getP_price());
			ps.setString(4, p.getP_status());
			ps.setInt(5, p.getP_id());

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
	public boolean deleteProducts(int id) {
		boolean f = false;
		try {
			String sql = "delete from product where p_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	@Override
	public List<Product> getNewProduct() {
		List<Product> list = new ArrayList<Product>();
		Product p = null;

		try {

			String sql = "select * from product where p_category=? and p_status=? order by p_id DESC";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New Product");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 0;
			while (rs.next() && i <= 4) {
				p = new Product();
				p.setP_id(rs.getInt(1));
				p.setP_name(rs.getString(2));
				p.setP_details(rs.getString(3));
				p.setP_price(rs.getString(4));
				p.setP_category(rs.getString(5));
				p.setP_image(rs.getString(6));
				p.setP_status(rs.getString(7));
				p.setU_email(rs.getString(8));

				list.add(p);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Product> getRecentProducts() {
		List<Product> list = new ArrayList<Product>();
		Product p = null;

		try {

			String sql = "select * from product where  p_status=? order by p_id DESC";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");

			ResultSet rs = ps.executeQuery();
			int i = 0;
			while (rs.next() && i <= 4) {
				p = new Product();
				p.setP_id(rs.getInt(1));
				p.setP_name(rs.getString(2));
				p.setP_details(rs.getString(3));
				p.setP_price(rs.getString(4));
				p.setP_category(rs.getString(5));
				p.setP_image(rs.getString(6));
				p.setP_status(rs.getString(7));
				p.setU_email(rs.getString(8));

				list.add(p);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Product> getOldProducts() {
		List<Product> list = new ArrayList<Product>();
		Product p = null;

		try {

			String sql = "select * from product where p_category=? and p_status=? order by p_id DESC";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old Product");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 0;
			while (rs.next() && i <= 4) {
				p = new Product();
				p.setP_id(rs.getInt(1));
				p.setP_name(rs.getString(2));
				p.setP_details(rs.getString(3));
				p.setP_price(rs.getString(4));
				p.setP_category(rs.getString(5));
				p.setP_image(rs.getString(6));
				p.setP_status(rs.getString(7));
				p.setU_email(rs.getString(8));

				list.add(p);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Product> getAllRecentProduct() {
		List<Product> list = new ArrayList<Product>();
		Product p = null;

		try {

			String sql = "select * from product where  p_status=? order by p_id DESC";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				p = new Product();
				p.setP_id(rs.getInt(1));
				p.setP_name(rs.getString(2));
				p.setP_details(rs.getString(3));
				p.setP_price(rs.getString(4));
				p.setP_category(rs.getString(5));
				p.setP_image(rs.getString(6));
				p.setP_status(rs.getString(7));
				p.setU_email(rs.getString(8));

				list.add(p);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Product> getAllNewProduct() {
		List<Product> list = new ArrayList<Product>();
		Product p = null;

		try {

			String sql = "select * from product where p_category=? and p_status=? order by p_id DESC";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New Product");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				p = new Product();
				p.setP_id(rs.getInt(1));
				p.setP_name(rs.getString(2));
				p.setP_details(rs.getString(3));
				p.setP_price(rs.getString(4));
				p.setP_category(rs.getString(5));
				p.setP_image(rs.getString(6));
				p.setP_status(rs.getString(7));
				p.setU_email(rs.getString(8));

				list.add(p);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Product> getAllOldProduct() {
		List<Product> list = new ArrayList<Product>();
		Product p = null;

		try {

			String sql = "select * from product where p_category=? and p_status=? order by p_id DESC";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old Product");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				p = new Product();
				p.setP_id(rs.getInt(1));
				p.setP_name(rs.getString(2));
				p.setP_details(rs.getString(3));
				p.setP_price(rs.getString(4));
				p.setP_category(rs.getString(5));
				p.setP_image(rs.getString(6));
				p.setP_status(rs.getString(7));
				p.setU_email(rs.getString(8));

				list.add(p);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Product> getOldProduct(String u_email, String p_category) {

		List<Product> list = new ArrayList<Product>();
		Product p = null;

		try {

			String sql = "select * from product where u_email = ? and p_category = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, u_email);
			ps.setString(2, p_category);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p = new Product();
				p.setP_id(rs.getInt(1));
				p.setP_name(rs.getString(2));
				p.setP_details(rs.getString(3));
				p.setP_price(rs.getString(4));
				p.setP_category(rs.getString(5));
				p.setP_image(rs.getString(6));
				p.setP_status(rs.getString(7));
				p.setU_email(rs.getString(8));
				list.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public boolean deleteOldProduct(String u_email, String p_category, int p_id) {
		boolean f = false;

		try {

			String sql = "delete from product where u_email = ? and p_category = ? and p_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, u_email);
			ps.setString(2, p_category);
			ps.setInt(3, p_id);

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
	public List<Product> getProdBySearch(String ch) {
		List<Product> list = new ArrayList<Product>();
		Product p = null;

		try {

			String sql = "select * from product where p_name like ? or p_details like ? or p_category like ?  and p_status = ? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+ch +"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ps.setString(4, "Active");

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p = new Product();
				p.setP_id(rs.getInt(1));
				p.setP_name(rs.getString(2));
				p.setP_details(rs.getString(3));
				p.setP_price(rs.getString(4));
				p.setP_category(rs.getString(5));
				p.setP_image(rs.getString(6));
				p.setP_status(rs.getString(7));
				p.setU_email(rs.getString(8));
				list.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

}
