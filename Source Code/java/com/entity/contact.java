package com.entity;

public class contact {
	
	private int id;
	private String name;
	private String email;
	private String number;
	private String msg;
	
	public contact() {
		super();
	}
	
	public contact(String name, String email,String number,String msg) {
		super();
		this.name = name;
		this.email = email;
		this.number=number;
		this.msg = msg;
	}
	
	

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	

}
