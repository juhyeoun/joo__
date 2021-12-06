package com.mrpizzahut.app.order;

public class OrderDTO {
	
	private int onum;
	private String oemail;
	private String omchttrdno;
	private String oname;
	private String ocount;
	private String ocancleflag;
	private String ocancledate;
	private String ocoupons;
	private String omethod;
	private String oprice;
	private String ocreated;
	private String odoneflag;
	private String odonedate;
	private String osize;
	private String oedge;
	public int getOnum() {
		return onum;
	}
	public void setOnum(int onum) {
		this.onum = onum;
	}
	public String getOemail() {
		return oemail;
	}
	public void setOemail(String oemail) {
		this.oemail = oemail;
	}
	public String getOmchttrdno() {
		return omchttrdno;
	}
	public void setOmchttrdno(String omchttrdno) {
		this.omchttrdno = omchttrdno;
	}
	public String getOname() {
		return oname;
	}
	public void setOname(String oname) {
		this.oname = oname;
	}
	public String getOcount() {
		return ocount;
	}
	public void setOcount(String ocount) {
		this.ocount = ocount;
	}
	public String getOcancleflag() {
		return ocancleflag;
	}
	public void setOcancleflag(String ocancleflag) {
		this.ocancleflag = ocancleflag;
	}
	public String getOcancledate() {
		return ocancledate;
	}
	public void setOcancledate(String ocancledate) {
		this.ocancledate = ocancledate;
	}
	public String getOcoupons() {
		return ocoupons;
	}
	public void setOcoupons(String ocoupons) {
		this.ocoupons = ocoupons;
	}
	public String getOmethod() {
		return omethod;
	}
	public void setOmethod(String omethod) {
		this.omethod = omethod;
	}
	public String getOprice() {
		return oprice;
	}
	public void setOprice(String oprice) {
		this.oprice = oprice;
	}
	public String getOcreated() {
		return ocreated;
	}
	public void setOcreated(String ocreated) {
		this.ocreated = ocreated;
	}
	public String getOdoneflag() {
		return odoneflag;
	}
	public void setOdoneflag(String odoneflag) {
		this.odoneflag = odoneflag;
	}
	public String getOdonedate() {
		return odonedate;
	}
	public void setOdonedate(String odonedate) {
		this.odonedate = odonedate;
	}
	public String getOsize() {
		return osize;
	}
	public void setOsize(String osize) {
		this.osize = osize;
	}
	public String getOedge() {
		return oedge;
	}
	public void setOedge(String oedge) {
		this.oedge = oedge;
	}
	@Override
	public String toString() {
		return "OrderDTO [onum=" + onum + ", oemail=" + oemail + ", omchttrdno=" + omchttrdno + ", oname=" + oname
				+ ", ocount=" + ocount + ", ocancleflag=" + ocancleflag + ", ocancledate=" + ocancledate + ", ocoupons="
				+ ocoupons + ", omethod=" + omethod + ", oprice=" + oprice + ", ocreated=" + ocreated + ", odoneflag="
				+ odoneflag + ", odonedate=" + odonedate + ", osize=" + osize + ", oedge=" + oedge + "]";
	}
	
	
}
