package com.grocerymania.codes.Orders;

import java.io.Serializable;
import java.util.Date;

public class Orders implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int orderid;
	private String customer_name;
	private String customer_lname;
	private String customer_address;
	private String customer_phoneno;
	private Date orderdate;
	private String paymentmode;
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public String getCustomer_address() {
		return customer_address;
	}
	public void setCustomer_address(String customer_address) {
		this.customer_address = customer_address;
	}
	public String getCustomer_phoneno() {
		return customer_phoneno;
	}
	public void setCustomer_phoneno(String customer_phoneno) {
		this.customer_phoneno = customer_phoneno;
	}
	
	public Date getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}
	public String getPaymentmode() {
		return paymentmode;
	}
	public void setPaymentmode(String paymentmode) {
		this.paymentmode = paymentmode;
	}
	
	public String getCustomer_lname() {
		return customer_lname;
	}
	public void setCustomer_lname(String customer_lname) {
		this.customer_lname = customer_lname;
	}

}
