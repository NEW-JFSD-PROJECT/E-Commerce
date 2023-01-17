package com.entity;

public class Manager {
	private int id;
	private String fullName;
	private String dob;
	private String age;
	private String email;
	private String mobNo;
	private String password;
	
	
	
	public Manager() {
		super();
	}
	public Manager(String fullName, String dob, String age, String email, String mobNo, String password) {
		super();
		this.fullName = fullName;
		this.dob = dob;
		this.age = age;
		this.email = email;
		this.mobNo = mobNo;
		this.password = password;
	}
	public Manager(int id, String fullName, String dob, String age, String email, String mobNo, String password) {
		super();
		this.id = id;
		this.fullName = fullName;
		this.dob = dob;
		this.age = age;
		this.email = email;
		this.mobNo = mobNo;
		this.password = password;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobNo() {
		return mobNo;
	}
	public void setMobNo(String mobNo) {
		this.mobNo = mobNo;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
	

}
