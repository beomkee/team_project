package model;

import java.sql.Timestamp;

public class SurveyBoardDataBean {
	private int sb_num;
	private String sb_title;
	private String r_receiver;
	private String sb_content;
	private String sb_passwd;
	private int e_num;
	private Timestamp sb_regdate;
	private int sb_readcount;
	private int r_num;
	private int p_num;
	
	public int getSb_num() {
		return sb_num;
	}
	public void setSb_num(int sb_num) {
		this.sb_num = sb_num;
	}
	public String getSb_title() {
		return sb_title;
	}
	public void setSb_title(String sb_title) {
		this.sb_title = sb_title;
	}
	public String getR_receiver() {
		return r_receiver;
	}
	public void setR_receiver(String r_receiver) {
		this.r_receiver = r_receiver;
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
	public int getSb_readcount() {
		return sb_readcount;
	}
	public void setSb_readcount(int sb_readcount) {
		this.sb_readcount = sb_readcount;
	}
	
	public int getR_num() {
		return r_num;
	}
	
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	
	public int getP_num() {
		return r_num;
	}
	
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	
	@Override
	public String toString() {
		return "SurveyBoardDataBean [sb_num=" + sb_num + ", sb_title=" + sb_title + ", r_receiver=" + r_receiver
				+ ", sb_content=" + sb_content + ", sb_passwd=" + sb_passwd + ", e_num=" + e_num + ", sb_regdate="
				+ sb_regdate + ", sb_readcount=" + sb_readcount + ", r_num=" + r_num + "]";
	}
	
	
}
