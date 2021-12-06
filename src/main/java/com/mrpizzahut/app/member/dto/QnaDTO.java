package com.mrpizzahut.app.member.dto;

public class QnaDTO {
	
	private int qnum;
	private String qtitle;
	private String qname;
	private String qstore;
	private String qcontent;
	
	public int getQnum() {
		return qnum;
	}
	public void setQnum(int qnum) {
		this.qnum = qnum;
	}
	public String getQtitle() {
		return qtitle;
	}
	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}
	public String getQname() {
		return qname;
	}
	public void setQname(String qname) {
		this.qname = qname;
	}
	public String getQstore() {
		return qstore;
	}
	public void setQstore(String qstore) {
		this.qstore = qstore;
	}
	public String getQcontent() {
		return qcontent;
	}
	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}
	@Override
	public String toString() {
		return "QnaDTO [qnum=" + qnum + ", qtitle=" + qtitle + ", qname=" + qname + ", qstore=" + qstore + ", qcontent="
				+ qcontent + "]";
	}
	
	
	
}
