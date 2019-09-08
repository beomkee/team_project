package model;

import java.sql.Timestamp;

public class NoticeDataBean {
	private int nb_num;
	private int e_num;
	private String nb_title;
	private String nb_content;
	private Timestamp nb_regdate;
	private int nb_readcount;
	
	public int getNb_num() {
		return nb_num;
	}
	public void setNb_num(int nb_num) {
		this.nb_num = nb_num;
	}
	public int getE_num() {
		return e_num;
	}
	public void setE_num(int e_num) {
		this.e_num = e_num;
	}
	public String getNb_title() {
		return nb_title;
	}
	public void setNb_title(String nb_title) {
		this.nb_title = nb_title;
	}
	public String getNb_content() {
		return nb_content;
	}
	public void setNb_content(String nb_content) {
		this.nb_content = nb_content;
	}
	public Timestamp getNb_regdate() {
		return nb_regdate;
	}
	public void setNb_regdate(Timestamp nb_regdate) {
		this.nb_regdate = nb_regdate;
	}
	public int getNb_readcount() {
		return nb_readcount;
	}
	public void setNb_readcount(int nb_readcount) {
		this.nb_readcount = nb_readcount;
	}
	@Override
	public String toString() {
		return "NoticeDataBean [nb_num=" + nb_num + ", e_num=" + e_num + ", nb_title=" + nb_title + ", nb_content="
				+ nb_content + ", nb_regdate=" + nb_regdate + ", nb_readcount=" + nb_readcount + "]";
	}
	
	
	
}
