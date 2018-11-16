package kr.or.ddit.schedule.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ScheduleVo {
	private int cpss_num;
	private int cship_num;
	private String cpss_content;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
	private Date cpss_Sdt;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
	private Date cpss_Edt;
	private String cpss_title;
	private int pro_num;
	
	public int getPro_num() {
		return pro_num;
	}
	public void setPro_num(int pro_num) {
		this.pro_num = pro_num;
	}
	public int getCpss_num() {
		return cpss_num;
	}
	public void setCpss_num(int cpss_num) {
		this.cpss_num = cpss_num;
	}
	public int getCship_num() {
		return cship_num;
	}
	public void setCship_num(int cship_num) {
		this.cship_num = cship_num;
	}
	public String getCpss_content() {
		return cpss_content;
	}
	public void setCpss_content(String cpss_content) {
		this.cpss_content = cpss_content;
	}
	public Date getCpss_Sdt() {
		return cpss_Sdt;
	}
	public void setCpss_Sdt(Date cpss_Sdt) {
		this.cpss_Sdt = cpss_Sdt;
	}
	public Date getCpss_Edt() {
		return cpss_Edt;
	}
	public void setCpss_Edt(Date cpss_Edt) {
		this.cpss_Edt = cpss_Edt;
	}
	public String getCpss_title() {
		return cpss_title;
	}
	public void setCpss_title(String cpss_title) {
		this.cpss_title = cpss_title;
	}
	
	
	
	
}
