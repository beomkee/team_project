package model;

import java.util.Date;

public class WayBill {

	private String w_num;
	private Date w_regdate;
	private String w_dtn;
	private int m_num;
	private String w_req;
	private String sender_nm;
	private String sender_tel;
	private String sender_add;
	private String receiver_nm;
	private String receiver_tel;
	private String receiver_add;
	private String w_div;
	private int w_weight;
	private int n_start;
	private int n_via;
	private int n_end;
	private String w_duedate;
	private int c_num;
	

	public String getW_duedate() {
		return w_duedate;
	}
	public void setW_duedate(String w_duedate) {
		this.w_duedate = w_duedate;
	}
	public String getW_num() {
		return w_num;
	}
	public void setW_num(String w_num) {
		this.w_num = w_num;
	}
	public Date getW_regdate() {
		return w_regdate;
	}
	public void setW_regdate(Date w_regdate) {
		this.w_regdate = w_regdate;
	}
	public String getW_dtn() {
		return w_dtn;
	}
	public void setW_dtn(String w_dtn) {
		this.w_dtn = w_dtn;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public String getW_req() {
		return w_req;
	}
	public void setW_req(String w_req) {
		this.w_req = w_req;
	}
	public String getSender_nm() {
		return sender_nm;
	}
	public void setSender_nm(String sender_nm) {
		this.sender_nm = sender_nm;
	}
	public String getSender_tel() {
		return sender_tel;
	}
	public void setSender_tel(String sender_tel) {
		this.sender_tel = sender_tel;
	}
	public String getSender_add() {
		return sender_add;
	}
	public void setSender_add(String sender_add) {
		this.sender_add = sender_add;
	}
	public String getReceiver_nm() {
		return receiver_nm;
	}
	public void setReceiver_nm(String receiver_nm) {
		this.receiver_nm = receiver_nm;
	}
	public String getReceiver_tel() {
		return receiver_tel;
	}
	public void setReceiver_tel(String receiver_tel) {
		this.receiver_tel = receiver_tel;
	}
	public String getReceiver_add() {
		return receiver_add;
	}
	public void setReceiver_add(String receiver_add) {
		this.receiver_add = receiver_add;
	}
	public String getW_div() {
		return w_div;
	}
	public void setW_div(String w_div) {
		this.w_div = w_div;
	}
	public int getW_weight() {
		return w_weight;
	}
	public void setW_weight(int w_weight) {
		this.w_weight = w_weight;
	}
	public int getN_start() {
		return n_start;
	}
	public void setN_start(int n_start) {
		this.n_start = n_start;
	}
	public int getN_via() {
		return n_via;
	}
	public void setN_via(int n_via) {
		this.n_via = n_via;
	}
	public int getN_end() {
		return n_end;
	}
	public void setN_end(int n_end) {
		this.n_end = n_end;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	
	@Override
	public String toString() {
		return "WayBill [w_num=" + w_num + ", w_regdate=" + w_regdate + ", w_dtn=" + w_dtn + ", m_num=" + m_num
				+ ", w_req=" + w_req + ", sender_nm=" + sender_nm + ", sender_tel=" + sender_tel + ", sender_add="
				+ sender_add + ", receiver_nm=" + receiver_nm + ", receiver_tel=" + receiver_tel + ", receiver_add="
				+ receiver_add + ", w_div=" + w_div + ", w_weight=" + w_weight + ", n_start=" + n_start + ", n_via="
				+ n_via + ", n_end=" + n_end + ", w_duedate=" + w_duedate + ", c_num=" + c_num + "]";
	}
	
	
}
