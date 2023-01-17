package com.entity;

public class Bank {
	private int id;
	private String bankname;
	private String userid;
	private String password;
	private int cid;

	public Bank() {
		
	}

	public Bank(String bankname, String userid, String password, int cid) {
		
		this.bankname = bankname;
		this.userid = userid;
		this.password = password;
		this.cid = cid;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBankname() {
		return bankname;
	}

	public void setBankname(String bankname) {
		this.bankname = bankname;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}
	
	
	
	
}
