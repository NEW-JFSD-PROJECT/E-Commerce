package com.entity;

public class Cart {
	
	private int id;
	private int pid;
	private int customerId;
	private String pName;
	private String pCategory;
	private Double price;
	private Double totalPrice;
	private String size;
	
	
	
	
	
	
	public Cart(int pid, int customerId, String pName, String pCategory, Double price, Double totalPrice,String size) {
		super();
		this.pid = pid;
		this.customerId = customerId;
		this.pName = pName;
		this.pCategory = pCategory;
		this.price = price;
		this.totalPrice = totalPrice;
		this.size=size;
	}
	
	public Cart() {
		super();
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpCategory() {
		return pCategory;
	}
	public void setpCategory(String pCategory) {
		this.pCategory = pCategory;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}
	
	
}
