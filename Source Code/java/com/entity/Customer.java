package com.entity;

public class Customer {
	private int id;
	private String fullname;
	private String gender;
	private String age;
	private String phno;
	private String email;
	private String password;
	private String address;
	
	
	public Customer() {
		super();
	}


	


	public Customer(int id, String fullname, String gender, String age, String phno, String email, String password,
			String address) {
		super();
		this.id = id;
		this.fullname = fullname;
		this.gender = gender;
		this.age = age;
		this.phno = phno;
		this.email = email;
		this.password = password;
		this.address = address;
	}





	public Customer(String fullname, String gender, String age, String phno, String email, String password,
			String address) {
		super();
		this.fullname = fullname;
		this.gender = gender;
		this.age = age;
		this.phno = phno;
		this.email = email;
		this.password = password;
		this.address = address;
	}





	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getFullname() {
		return fullname;
	}


	public void setFullname(String fullname) {
		this.fullname = fullname;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getAge() {
		return age;
	}


	public void setAge(String age) {
		this.age = age;
	}


	public String getPhno() {
		return phno;
	}


	public void setPhno(String phno) {
		this.phno = phno;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}
	
}
