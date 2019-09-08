package model;

import java.sql.Timestamp;

public class SurveyBoardWriteDataBean {
	private int sb_num;
	private int r_num;
	private int e_num;
	private Timestamp sb_regdate;
	private String sb_title;
	private String sb_content;
	private String sb_passwd;
	private int sb_readcount;
	
	public int getSb_num() {
		return sb_num;
	}
	public void setSb_num(int sb_num) {
		this.sb_num = sb_num;
	}
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	public int getE_num() {
		return e_num;
	}
	public void setE_num(int e_num) {
		this.e_num = e_num;
	}
	public Timestamp getSb_regdate() {
		return sb_regdate;
	}
	public void setSb_regdate(Timestamp sb_regdate) {
		this.sb_regdate = sb_regdate;
	}
	public String getSb_title() {
		return sb_title;
	}
	public void setSb_title(String sb_title) {
		this.sb_title = sb_title;
	}
	public String getSb_content() {
		return sb_content;
	}
	public void setSb_content(String sb_content) {
		this.sb_content = sb_content;
	}
	public String getSb_passwd() {
		return sb_passwd;
	}
	public void setSb_passwd(String sb_passwd) {
		this.sb_passwd = sb_passwd;
	}
	public int getSb_readcount() {
		return sb_readcount;
	}
	public void setSb_readcount(int sb_readcount) {
		this.sb_readcount = sb_readcount;
	}
	
	
	@Override
	public String toString() {
		return "SurveyBoardWriteDataBean [sb_num=" + sb_num + ", r_num=" + r_num + ", e_num=" + e_num + ", sb_regdate="
				+ sb_regdate + ", sb_title=" + sb_title + ", sb_content=" + sb_content + ", sb_passwd=" + sb_passwd
				+ ", sb_readcount=" + sb_readcount + "]";
	}
	
}
