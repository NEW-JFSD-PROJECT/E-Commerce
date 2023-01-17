package com.entity;

public class Upi {

	private int id;
	private String upi_name;
	private String name;
	private String upi_id;
	private int cid;
	
	public Upi() {
		super();
	}

	public Upi(String upi_name, String name, String upi_id, int cid) {
		super();
		this.upi_name = upi_name;
		this.name = name;
		this.upi_id = upi_id;
		this.cid = cid;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUpi_name() {
		return upi_name;
	}

	public void setUpi_name(String upi_name) {
		this.upi_name = upi_name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUpi_id() {
		return upi_id;
	}

	public void setUpi_id(String upi_id) {
		this.upi_id = upi_id;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	
	
	
	
}
