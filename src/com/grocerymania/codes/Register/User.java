package com.grocerymania.codes.Register;
import java.io.Serializable;

public class User implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String fname;
	private String lname;
	private String emailid;
	private String contact;
	private String address;
	private String pass;
	
	
	public String getfName() {
		return fname;
	}
	public void setfName(String fname) {
		this.fname = fname;
	}
	
	public String getlName() {
		return lname;
	}
	public void setlName(String lname) {
		this.lname = lname;
	}
	
	public String getEmailid() {
		return emailid;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
}
