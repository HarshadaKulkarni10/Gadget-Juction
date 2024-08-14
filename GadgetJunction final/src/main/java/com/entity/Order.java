package com.entity;

public class Order {
	private int id;
	private String orderId;
	private String username;
	private String email;
	private String phoneno;
	private String fulladd;
	
	private String p_name;
	private String p_details;
	private String p_price;
	
	
	private String paymenttype;
	
	public Order() {
		super();
		// TODO Auto-generated constructor stub
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



	public String getOrderId() {
		return orderId;
	}



	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}



	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneno() {
		return phoneno;
	}

	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}

	public String getFulladd() {
		return fulladd;
	}

	public void setFulladd(String fulladd) {
		this.fulladd = fulladd;
	}

	public String getPaymenttype() {
		return paymenttype;
	}

	public void setPaymenttype(String paymenttype) {
		this.paymenttype = paymenttype;
	}



	@Override
	public String toString() {
		return "Order [id=" + id + ", orderId=" + orderId + ", username=" + username + ", email=" + email + ", phoneno="
				+ phoneno + ", fulladd=" + fulladd + ", p_name=" + p_name + ", p_details=" + p_details + ", p_price="
				+ p_price + ", paymenttype=" + paymenttype + "]";
	}

	
	
}
