package com.entity;

public class product {

	
	private int pid;
	private String pname;
	private String pcategory;
	private String psubcategory;
	private String pprice;
	private String pcolor;
	private String pimage;
	private String pdecs;

	public product() {
		super();
	}

	

	public product(int pid, String pname, String pcategory, String psubcategory, String pprice, String pcolor,
			String pimage, String pdecs) {
		super();
		this.pid = pid;
		this.pname = pname;
		this.pcategory = pcategory;
		this.psubcategory = psubcategory;
		this.pprice = pprice;
		this.pcolor = pcolor;
		this.pimage = pimage;
		this.pdecs = pdecs;
	}




	public product(String pname, String pcategory, String psubcategory, String pprice, String pcolor, String pimage,
			String pdecs) {
		super();
		this.pname = pname;
		this.pcategory = pcategory;
		this.psubcategory = psubcategory;
		this.pprice = pprice;
		this.pcolor = pcolor;
		this.pimage = pimage;
		this.pdecs = pdecs;
	}



	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPcategory() {
		return pcategory;
	}

	public void setPcategory(String pcategory) {
		this.pcategory = pcategory;
	}

	public String getPsubcategory() {
		return psubcategory;
	}

	public void setPsubcategory(String psubcategory) {
		this.psubcategory = psubcategory;
	}

	public String getPprice() {
		return pprice;
	}

	public void setPprice(String pprice) {
		this.pprice = pprice;
	}

	public String getPcolor() {
		return pcolor;
	}

	public void setPcolor(String pcolor) {
		this.pcolor = pcolor;
	}

	public String getPimage() {
		return pimage;
	}

	public void setPimage(String pimage) {
		this.pimage = pimage;
	}

	
	public String getPdecs() {
		return pdecs;
	}



	public void setPdecs(String pdecs) {
		this.pdecs = pdecs;
	}



	@Override
	public String toString() {
		return "product [pid=" + pid + ", pname=" + pname + ", pcategory=" + pcategory + ", psubcategory="
				+ psubcategory + ", pprice=" + pprice + ", pcolor=" + pcolor + ", pimage=" + pimage + ", pdecs=" + pdecs
				+ "]";
	}

	
	
}
