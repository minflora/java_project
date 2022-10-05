package com.spirita.dto;

import java.sql.Timestamp;

public class ProductVO {
	private int pseq;
	private String name;
	private String kind;
	private int price;
	private String content;
	private String image;
	private Timestamp indate;
	
	public ProductVO() {
		super();
	}

	public ProductVO(int pseq, String name, String kind, int price, String content, String image, Timestamp indate) {
		super();
		this.pseq = pseq;
		this.name = name;
		this.kind = kind;
		this.price = price;
		this.content = content;
		this.image = image;
		this.indate = indate;
	}

	public int getPseq() {
		return pseq;
	}

	public void setPseq(int pseq) {
		this.pseq = pseq;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Timestamp getIndate() {
		return indate;
	}

	public void setIndate(Timestamp indate) {
		this.indate = indate;
	}

	@Override
	public String toString() {
		return "ProductVO [pseq=" + pseq + ", name=" + name + ", kind=" + kind + ", price=" + price + ", content="
				+ content + ", image=" + image + ", indate=" + indate + "]";
	}
	  
}