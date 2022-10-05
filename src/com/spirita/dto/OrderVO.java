package com.spirita.dto;

import java.sql.Timestamp;

public class OrderVO {
	private int odseq;
	private int oseq;
	private String id; 
	private Timestamp indate; 
	private String mname;
	private String zipcode;
	private String address;
	private String phone;
	private int pseq;
	private String pname;
	private int quantity;
	private int price;
	private String result;
	
	public OrderVO() {

	}
	
	public OrderVO(int odseq, int oseq, String id, Timestamp indate, String mname, String zipcode, String address,
			String phone, int pseq, String pname, int quantity, int price, String result) {
		super();
		this.odseq = odseq;
		this.oseq = oseq;
		this.id = id;
		this.indate = indate;
		this.mname = mname;
		this.zipcode = zipcode;
		this.address = address;
		this.phone = phone;
		this.pseq = pseq;
		this.pname = pname;
		this.quantity = quantity;
		this.price = price;
		this.result = result;
	}


	public int getOdseq() {
		return odseq;
	}
	public void setOdseq(int odseq) {
		this.odseq = odseq;
	}
	public int getOseq() {
		return oseq;
	}
	public void setOseq(int oseq) {
		this.oseq = oseq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Timestamp getIndate() {
		return indate;
	}
	public void setIndate(Timestamp indate) {
		this.indate = indate;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getPseq() {
		return pseq;
	}
	public void setPseq(int pseq) {
		this.pseq = pseq;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}

	@Override
	public String toString() {
		return "OrderVO [odseq=" + odseq + ", oseq=" + oseq + ", id=" + id + ", indate=" + indate + ", mname=" + mname
				+ ", zipcode=" + zipcode + ", address=" + address + ", phone=" + phone + ", pseq=" + pseq + ", pname="
				+ pname + ", quantity=" + quantity + ", price=" + price + ", result=" + result + "]";
	}
	
}