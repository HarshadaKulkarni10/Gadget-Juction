package com.entity;

public class Product {

	private int p_id;
	private String p_name;
	private String p_details;
	private String p_price;
	private String p_category;
	private String p_status;
	private String p_image;
	private String u_email;
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Product(String p_name, String p_details, String p_price, String p_category, String p_status, String p_image,
			String u_email) {
		super();
		this.p_name = p_name;
		this.p_details = p_details;
		this.p_price = p_price;
		this.p_category = p_category;
		this.p_status = p_status;
		this.p_image = p_image;
		this.u_email = u_email;
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_details() {
		return p_details;
	}
	public void setP_details(String p_details) {
		this.p_details = p_details;
	}
	public String getP_price() {
		return p_price;
	}
	public void setP_price(String p_price) {
		this.p_price = p_price;
	}
	public String getP_category() {
		return p_category;
	}
	public void setP_category(String p_category) {
		this.p_category = p_category;
	}
	public String getP_status() {
		return p_status;
	}
	public void setP_status(String p_status) {
		this.p_status = p_status;
	}
	public String getP_image() {
		return p_image;
	}
	public void setP_image(String p_image) {
		this.p_image = p_image;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	
	@Override
	public String toString() {
		return "product [p_id=" + p_id + ", p_name=" + p_name + ", p_details=" + p_details + ", p_price=" + p_price
				+ ", p_category=" + p_category + ", p_status=" + p_status + ", p_image=" + p_image + ", u_email="
				+ u_email + "]";
	}
	
	
}
