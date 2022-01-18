package com.grocerymania.codes.Category;
import java.io.Serializable;

public class Category implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String categoryName;
	private String categoryDesc;
	
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getCategoryDesc() {
		return categoryDesc;
	}
	public void setCategoryDesc(String categoryDesc) {
		this.categoryDesc = categoryDesc;
	}
	
	

}
