package model;

public class SurveyContentResultDataBean {
	private int sq_num;
	private String sq_text;
	private int sa_num;
	private String sa_item;
	
	public int getSq_num() {
		return sq_num;
	}
	public void setSq_num(int sq_num) {
		this.sq_num = sq_num;
	}
	public String getSq_text() {
		return sq_text;
	}
	public void setSq_text(String sq_text) {
		this.sq_text = sq_text;
	}
	public int getSa_num() {
		return sa_num;
	}
	public void setSa_num(int sa_num) {
		this.sa_num = sa_num;
	}
	public String getSa_item() {
		return sa_item;
	}
	public void setSa_item(String sa_item) {
		this.sa_item = sa_item;
	}
	@Override
	public String toString() {
		return "SurveyContentResultDataBean [sq_num=" + sq_num + ", sq_text=" + sq_text + ", sa_num=" + sa_num
				+ ", sa_item=" + sa_item + "]";
	}
	
	
	
}
