package com.addr.model;

public class AddrDTO {
	private int num;
	private String name;
	private String addr;
	private String zipcode;
	private String tel;
	
	
	public AddrDTO() {
		super();
	}

	public AddrDTO(int num, String name, String addr, String zipcode, String tel) {
		super();
		this.num = num;
		this.name = name;
		this.addr = addr;
		this.zipcode = zipcode;
		this.tel = tel;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
}
