package model;

import java.util.Calendar;
import java.util.Date;

public class Pickup {
	private String p_num;
	private String pu_area;
	private int pu_time;
	private Date pu_date;

	public String getP_num() {
		return p_num;
	}

	public void setP_num(String p_num) {
		this.p_num = p_num;
	}

	public String getPu_area() {
		return pu_area;
	}

	public void setPu_area(String pu_area) {
		this.pu_area = pu_area;
	}

	public int getPu_time() {
		return pu_time;
	}

	public void setPu_time(int pu_time) {
		this.pu_time = pu_time;
	}

	public Date getPu_date() {
		return pu_date;
	}
	
	public void setPu_date() {
		Date date = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.HOUR , getPu_time());
		this.pu_date = cal.getTime();
	}

	@Override
	public String toString() {
		return "Pickup [p_num=" + p_num + ", pu_area=" + pu_area + ", pu_time=" + pu_time + ", pu_date=" + pu_date
				+ "]";
	}

}
