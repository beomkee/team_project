package model;

public class Qualities {
	String quality;
	String qpoint;
	public String getQuality() {
		return quality;
	}
	public void setQuality(String quality) {
		this.quality = quality;
	}
	public String getQpoint() {
		return qpoint;
	}
	public void setQpoint(String qpoint) {
		this.qpoint = qpoint;
	}
	@Override
	public String toString() {
		return "Qualities [quality=" + quality + ", qpoint=" + qpoint + "]";
	}
	
	
}
