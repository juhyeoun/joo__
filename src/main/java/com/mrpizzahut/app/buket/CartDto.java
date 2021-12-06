package com.mrpizzahut.app.buket;

public class CartDto {
	private int cnum;
	private String cemail;
	private String cmenu;
	private String csize;
	private String cedge;
	private int ccount;
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public String getCemail() {
		return cemail;
	}
	public void setCemail(String cemail) {
		this.cemail = cemail;
	}
	public String getCmenu() {
		return cmenu;
	}
	public void setCmenu(String cmenu) {
		this.cmenu = cmenu;
	}
	public String getCsize() {
		return csize;
	}
	public void setCsize(String csize) {
		this.csize = csize;
	}
	public String getCedge() {
		return cedge;
	}
	public void setCedge(String cedge) {
		this.cedge = cedge;
	}
	public int getCcount() {
		return ccount;
	}
	public void setCcount(int ccount) {
		this.ccount = ccount;
	}
	@Override
	public String toString() {
		return "CartDto [cnum=" + cnum + ", cemail=" + cemail + ", cmenu=" + cmenu + ", csize=" + csize + ", cedge="
				+ cedge + ", ccount=" + ccount + "]";
	}
	
	
}
