package kr.or.ddit.copartnership.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CopartnershipVo {
	private int cship_num;
	private String ind_code;
	private String cship_name;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date cship_dt;
	private String cship_intro;
	private char cship_type;
	private String coop_div;
	
	public int getCship_num() {
		return cship_num;
	}
	public void setCship_num(int cship_num) {
		this.cship_num = cship_num;
	}
	public String getInd_code() {
		return ind_code;
	}
	public void setInd_code(String ind_code) {
		this.ind_code = ind_code;
	}
	public String getCship_name() {
		return cship_name;
	}
	public void setCship_name(String cship_name) {
		this.cship_name = cship_name;
	}
	public Date getCship_dt() {
		return cship_dt;
	}
	public void setCship_dt(Date cship_dt) {
		this.cship_dt = cship_dt;
	}
	public String getCship_intro() {
		return cship_intro;
	}
	public void setCship_intro(String cship_intro) {
		this.cship_intro = cship_intro;
	}
	public char getCship_type() {
		return cship_type;
	}
	public void setCship_type(char cship_type) {
		this.cship_type = cship_type;
	}
	public String getCoop_div() {
		return coop_div;
	}
	public void setCoop_div(String coop_div) {
		this.coop_div = coop_div;
	}

	
	
	
}
