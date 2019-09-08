package model;

public class Deliverestimation {
	private String ds_num;
	private String p_num;
	private String e_num;
	private String ds_date;
	private String ds_result;
	public String getDs_num() {
		return ds_num;
	}
	public void setDs_num(String ds_num) {
		this.ds_num = ds_num;
	}
	public String getP_num() {
		return p_num;
	}
	public void setP_num(String p_num) {
		this.p_num = p_num;
	}
	public String getE_num() {
		return e_num;
	}
	public void setE_num(String e_num) {
		this.e_num = e_num;
	}
	public String getDs_date() {
		return ds_date;
	}
	public void setDs_date(String ds_date) {
		this.ds_date = ds_date;
	}
	public String getDs_result() {
		return ds_result;
	}
	public void setDs_result(String ds_result) {
		this.ds_result = ds_result;
	}
	@Override
	public String toString() {
		return "Deliverestimation [ds_num=" + ds_num + ", p_num=" + p_num + ", e_num=" + e_num + ", ds_date=" + ds_date
				+ ", ds_result=" + ds_result + "]";
	}
}
