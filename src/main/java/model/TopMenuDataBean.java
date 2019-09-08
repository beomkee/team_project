package model;

public class TopMenuDataBean {

	private int tm_num;
	private int e_num;
	private String tm_text;
	private int tm_depth;
	private int tm_div;
	private String tm_url;
	private String tm_use;
	private int tm_parent;

	public int getTm_num() {
		return tm_num;
	}

	public int getE_num() {
		return e_num;
	}

	public String getTm_text() {
		return tm_text;
	}

	public int getTm_depth() {
		return tm_depth;
	}

	public int getTm_div() {
		return tm_div;
	}

	public String getTm_url() {
		return tm_url;
	}

	public String getTm_use() {
		return tm_use;
	}

	public int getTm_parent() {
		return tm_parent;
	}

	public void setTm_num(int tm_num) {
		this.tm_num = tm_num;
	}

	public void setE_num(int e_num) {
		this.e_num = e_num;
	}

	public void setTm_text(String tm_text) {
		this.tm_text = tm_text;
	}

	public void setTm_depth(int tm_depth) {
		this.tm_depth = tm_depth;
	}

	public void setTm_div(int tm_div) {
		this.tm_div = tm_div;
	}

	public void setTm_url(String tm_url) {
		this.tm_url = tm_url;
	}

	public void setTm_use(String tm_use) {
		this.tm_use = tm_use;
	}

	public void setTm_parent(int tm_parent) {
		this.tm_parent = tm_parent;
	}

	@Override
	public String toString() {
		return "TopMenuDataBean [tm_num=" + tm_num + ", e_num=" + e_num + ", tm_text=" + tm_text + ", tm_depth="
				+ tm_depth + ", tm_div=" + tm_div + ", tm_url=" + tm_url + ", tm_use=" + tm_use + ", tm_parent="
				+ tm_parent + "]";
	}
	
	
}
