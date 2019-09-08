package model;

import java.util.Arrays;

public class SurveyResultDataBean {
	private int satisfaction1;
	private int satisfaction2;
	private int satisfaction3;
	private int satisfaction4;
	private int satisfaction5;
	private int satisfaction6;

	public int getSatisfaction1() {
		return satisfaction1;
	}

	public void setSatisfaction1(int satisfaction1) {
		this.satisfaction1 = satisfaction1;
	}

	public int getSatisfaction2() {
		return satisfaction2;
	}

	public void setSatisfaction2(int satisfaction2) {
		this.satisfaction2 = satisfaction2;
	}

	public int getSatisfaction3() {
		return satisfaction3;
	}

	public void setSatisfaction3(int satisfaction3) {
		this.satisfaction3 = satisfaction3;
	}

	public int getSatisfaction4() {
		return satisfaction4;
	}

	public void setSatisfaction4(int satisfaction4) {
		this.satisfaction4 = satisfaction4;
	}

	public int getSatisfaction5() {
		return satisfaction5;
	}

	public void setSatisfaction5(int satisfaction5) {
		this.satisfaction5 = satisfaction5;
	}

	public int getSatisfaction6() {
		return satisfaction6;
	}

	public void setSatisfaction6(int satisfaction6) {
		this.satisfaction6 = satisfaction6;
	}

	@Override
	public String toString() {
		return "SurveyResultDataBean [satisfaction1=" + satisfaction1 + ", satisfaction2=" + satisfaction2
				+ ", satisfaction3=" + satisfaction3 + ", satisfaction4=" + satisfaction4 + ", satisfaction5="
				+ satisfaction5 + ", satisfaction6=" + satisfaction6 + "]";
	}
	
}
