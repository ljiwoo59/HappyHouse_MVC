package com.happyhouse.dto;

public class House {
	
	private String nid;
	private String npw;
	private String name;
	private String address;
	private String tel;
	
	public House(String nid, String npw, String name, String address, String tel) {
		this.nid = nid;
		this.npw = npw;
		this.name = name;
		this.address = address;
		this.tel = tel;
	}

	public String getNid() {
		return nid;
	}

	public void setNid(String nid) {
		this.nid = nid;
	}

	public String getNpw() {
		return npw;
	}

	public void setNpw(String npw) {
		this.npw = npw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
	
}
