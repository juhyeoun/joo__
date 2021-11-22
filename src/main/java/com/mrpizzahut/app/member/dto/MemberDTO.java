package com.mrpizzahut.app.member.dto;

public class MemberDTO {
	
	 private int mnum;
     private String email;
	 private String name;
	 private String pw;
	 private String mobile;
	 private String addr;
	 private String regdate;
	 private String rescode;
	 
	public String getRescode() {
		return rescode;
	}
	public void setRescode(String rescode) {
		this.rescode = rescode;
	}
	public int getMnum() {
		return mnum;
	}
	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "MemberDTO [mnum=" + mnum + ", email=" + email + ", name=" + name + ", pw=" + pw + ", mobile=" + mobile
				+ ", addr=" + addr + ", regdate=" + regdate + "]";
	}
	 
	
}
