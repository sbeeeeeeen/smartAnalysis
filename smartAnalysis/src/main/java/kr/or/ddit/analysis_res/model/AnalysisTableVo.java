package kr.or.ddit.analysis_res.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class AnalysisTableVo {
	private int an_num;
	private String an_div;
	private String an_addr;
	private String an_industry;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date an_dt;
	
	public int getAn_num() {
		return an_num;
	}
	public void setAn_num(int an_num) {
		this.an_num = an_num;
	}
	public String getAn_div() {
		return an_div;
	}
	public void setAn_div(String an_div) {
		this.an_div = an_div;
	}
	public String getAn_addr() {
		return an_addr;
	}
	public void setAn_addr(String an_addr) {
		this.an_addr = an_addr;
	}
	public String getAn_industry() {
		return an_industry;
	}
	public void setAn_industry(String an_industry) {
		this.an_industry = an_industry;
	}
	public Date getAn_dt() {
		return an_dt;
	}
	public void setAn_dt(Date an_dt) {
		this.an_dt = an_dt;
	}
	
	

}
