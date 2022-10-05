package com.spirita.dto;

import java.sql.Timestamp;

public class CartVO {
	private int cseq;
	private String id = null;
	private String mname;
	private String pname;
	private int pseq;
	private int quantity;
	private int price;
	private Timestamp indate = null;
	
	public CartVO() {
		super();
	}
	
	public CartVO(int cseq, String id, String mname, String pname, int pseq, int quantity, int price,
			Timestamp indate) {
		super();
		this.cseq = cseq;
		this.id = id;
		this.mname = mname;
		this.pname = pname;
		this.pseq = pseq;
		this.quantity = quantity;
		this.price = price;
		this.indate = indate;
	}

	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getCseq() {
		return cseq;
	}
	public void setCseq(int cseq) {
		this.cseq = cseq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPseq() {
		return pseq;
	}
	public void setPseq(int pseq) {
		this.pseq = pseq;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Timestamp getIndate() {
		return indate;
	}
	public void setIndate(Timestamp indate) {
		this.indate = indate;
	}

	@Override
	public String toString() {
		return "CartVO [cseq=" + cseq + ", id=" + id + ", mname=" + mname + ", pname=" + pname + ", pseq=" + pseq
				+ ", quantity=" + quantity + ", price=" + price + ", indate=" + indate + "]";
	}
}