package com.entity;

public class category {
	
	private int id;
	private String categoryname;
	public category() {
		super();
	}
	public category(int id, String categoryname) {
		super();
		this.id = id;
		this.categoryname = categoryname;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCategoryname() {
		return categoryname;
	}
	public void setCategoryname(String categoryname) {
		this.categoryname = categoryname;
	}
	
	
	

}
