package model;

public class SurveyBoardAboutDataBean {
	/* private int p_num; */
	private int r_num;
	private int e_num;
	private String r_receiver;
	
	/*
	 * public int getP_num() { return p_num; } public void setP_num(int p_num) {
	 * this.p_num = p_num; }
	 */
	
	
	public int getE_num() {
		return e_num;
	}
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	public void setE_num(int e_num) {
		this.e_num = e_num;
	}
	public String getR_receiver() {
		return r_receiver;
	}
	public void setR_receiver(String r_receiver) {
		this.r_receiver = r_receiver;
	}
	
}
