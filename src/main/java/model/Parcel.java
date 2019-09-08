package model;

public class Parcel {

	private String p_num;
	private String w_num;
	private String p_location;
	private String p_quality;
	private String receive;
	public String getP_num() {
		return p_num;
	}
	public void setP_num(String p_num) {
		this.p_num = p_num;
	}
	public String getW_num() {
		return w_num;
	}
	public void setW_num(String w_num) {
		this.w_num = w_num;
	}
	public String getP_location() {
		return p_location;
	}
	public void setP_location(String p_location) {
		this.p_location = p_location;
	}
	public String getP_quality() {
		return p_quality;
	}
	public void setP_quality(String p_quality) {
		this.p_quality = p_quality;
	}
	public String getReceive() {
		return receive;
	}
	public void setReceive(String receive) {
		this.receive = receive;
	}
	@Override
	public String toString() {
		return "Parcel [p_num=" + p_num + ", w_num=" + w_num + ", p_location=" + p_location + ", p_quality=" + p_quality
				+ ", receive=" + receive + "]";
	}
}
