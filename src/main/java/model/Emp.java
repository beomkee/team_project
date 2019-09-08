package model;

public class Emp {
	private String e_num;
	private String n_num;
	private String manager;
	private String e_id;
	private String e_passwd;
	private String e_add;
	private String position;
	private String e_tel;
	private String e_birth;
	private String rankaverage;
	public String getE_num() {
		return e_num;
	}
	public void setE_num(String e_num) {
		this.e_num = e_num;
	}
	public String getN_num() {
		return n_num;
	}
	public void setN_num(String n_num) {
		this.n_num = n_num;
	}
	public String getManager() {
		return manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
	}
	public String getE_id() {
		return e_id;
	}
	public void setE_id(String e_id) {
		this.e_id = e_id;
	}
	public String getE_passwd() {
		return e_passwd;
	}
	public void setE_passwd(String e_passwd) {
		this.e_passwd = e_passwd;
	}
	public String getE_add() {
		return e_add;
	}
	public void setE_add(String e_add) {
		this.e_add = e_add;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getE_tel() {
		return e_tel;
	}
	public void setE_tel(String e_tel) {
		this.e_tel = e_tel;
	}
	public String getE_birth() {
		return e_birth;
	}
	public void setE_birth(String e_birth) {
		this.e_birth = e_birth;
	}
	public String getRankaverage() {
		return rankaverage;
	}
	public void setRankaverage(String rankaverage) {
		this.rankaverage = rankaverage;
	}
	
	@Override
	public String toString() {
		return "Emp [e_num=" + e_num + ", n_num=" + n_num + ", manager=" + manager + ", e_id=" + e_id + ", e_passwd="
				+ e_passwd + ", e_add=" + e_add + ", position=" + position + ", e_tel=" + e_tel + ", e_birth=" + e_birth
				+ ", rankaverage=" + rankaverage + "]";
	}
}