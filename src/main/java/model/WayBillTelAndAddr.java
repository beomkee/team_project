package model;

public class WayBillTelAndAddr {

	private String s_tel1;
	private String s_tel2;
	private String s_tel3;
	private String r_tel1;
	private String r_tel2;
	private String r_tel3;
	private String s_addr1;
	private String s_addr2;
	private String s_addr3;
	private String r_addr1;
	private String r_addr2;
	private String r_addr3;
	
	public String s_tel() {
		return s_tel1 + "-" + s_tel2 + "-" + s_tel3;
	}

	public String r_tel() {
		return r_tel1 + "-" + r_tel2 + "-" + r_tel3;
	}
	
	public String s_addr() {
		return s_addr1 + " " + s_addr2 + " " + s_addr3;
	}

	public String r_addr() {
		return r_addr1 + " " + r_addr2 + " " + r_addr3;
	}
	
	public String getS_tel1() {
		return s_tel1;
	}
	public void setS_tel1(String s_tel1) {
		this.s_tel1 = s_tel1;
	}
	public String getS_tel2() {
		return s_tel2;
	}
	public void setS_tel2(String s_tel2) {
		this.s_tel2 = s_tel2;
	}
	public String getS_tel3() {
		return s_tel3;
	}
	public void setS_tel3(String s_tel3) {
		this.s_tel3 = s_tel3;
	}
	public String getR_tel1() {
		return r_tel1;
	}
	public void setR_tel1(String r_tel1) {
		this.r_tel1 = r_tel1;
	}
	public String getR_tel2() {
		return r_tel2;
	}
	public void setR_tel2(String r_tel2) {
		this.r_tel2 = r_tel2;
	}
	public String getR_tel3() {
		return r_tel3;
	}
	public void setR_tel3(String r_tel3) {
		this.r_tel3 = r_tel3;
	}
	public String getS_addr1() {
		return s_addr1;
	}
	public void setS_addr1(String s_addr1) {
		this.s_addr1 = s_addr1;
	}
	public String getS_addr2() {
		return s_addr2;
	}
	public void setS_addr2(String s_addr2) {
		this.s_addr2 = s_addr2;
	}
	public String getS_addr3() {
		return s_addr3;
	}
	public void setS_addr3(String s_addr3) {
		this.s_addr3 = s_addr3;
	}
	public String getR_addr1() {
		return r_addr1;
	}
	public void setR_addr1(String r_addr1) {
		this.r_addr1 = r_addr1;
	}
	public String getR_addr2() {
		return r_addr2;
	}
	public void setR_addr2(String r_addr2) {
		this.r_addr2 = r_addr2;
	}
	public String getR_addr3() {
		return r_addr3;
	}
	public void setR_addr3(String r_addr3) {
		this.r_addr3 = r_addr3;
	}
}
