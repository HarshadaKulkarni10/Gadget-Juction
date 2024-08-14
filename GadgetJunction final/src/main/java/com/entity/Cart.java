package com.entity;

public class Cart {
	private int c_id;
	private int p_id;
	private int u_id;
	private String p_name;
	private String p_details;
	private Double p_price;
	private Double totalPrice;
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public int getU_id() {
		return u_id;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
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
	public double getP_price() {
		return p_price;
	}
	public void setP_price(double p_price) {
		this.p_price = p_price;
	}
	public double getTotal_price() {
		return totalPrice;
	}
	public void setTotal_price(double total_price) {
		this.totalPrice = total_price;
	}

	
}

