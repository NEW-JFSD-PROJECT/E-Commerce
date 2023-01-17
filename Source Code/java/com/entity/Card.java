package com.entity;

public class Card {
	private int id;
	private String name;
	private String number;
	private String month;
	private String year;
	private String cvv;
	private int cid;

	public Card() {
		super();
	}

	

	public Card(String name, String number, String month, String year, String cvv, int cid) {
		super();
		this.name = name;
		this.number = number;
		this.month = month;
		this.year = year;
		this.cvv = cvv;
		this.cid = cid;
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

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getCvv() {
		return cvv;
	}

	public void setCvv(String cvv) {
		this.cvv = cvv;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

}
