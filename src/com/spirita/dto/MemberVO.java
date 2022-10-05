package com.spirita.dto;

import java.sql.Timestamp;

public class MemberVO {
	private String id = null;
	private String pwd = null;
	private String name = null;
	private String email = null;
	private String zipcode = null;
	private String address = null;
	private String phone = null;
	private String useyn = null;
	private Timestamp indate = null;
	
	public MemberVO() {

	}
	
	public MemberVO(String id, String pwd, String name, String email, String zipcode, String address, String phone,
			String useyn, Timestamp indate) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.zipcode = zipcode;
		this.address = address;
		this.phone = phone;
		this.useyn = useyn;
		this.indate = indate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
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
	public String getUseyn() {
		return useyn;
	}
	public void setUseyn(String useyn) {
		this.useyn = useyn;
	}
	public Timestamp getIndate() {
		return indate;
	}
	public void setIndate(Timestamp indate) {
		this.indate = indate;
	}
	
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email + ", zipcode=" + zipcode
				+ ", address=" + address + ", phone=" + phone + ", useyn=" + useyn + ", indate=" + indate + "]";
	}
	
}
