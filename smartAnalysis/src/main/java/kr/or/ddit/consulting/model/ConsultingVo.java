package kr.or.ddit.consulting.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatTypes;

public class ConsultingVo {
	private int cst_num;			//일정번호
	private int pro_num;			//컨설턴트 번호
	private String mem_id;			//회원ID
	private String cst_aprv;			//승인여부
	private String cst_content;		//일정내용
	private String cst_pay;			//결제여부
	private String pro_id;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date cst_dt;			//일정날짜
	
	
	public String getCst_pay() {
		return cst_pay;
	}
	public void setCst_pay(String cst_pay) {
		this.cst_pay = cst_pay;
	}
	public String getPro_id() {
		return pro_id;
	}
	public void setPro_id(String pro_id) {
		this.pro_id = pro_id;
	}
	public int getCst_num() {
		return cst_num;
	}
	public void setCst_num(int cst_num) {
		this.cst_num = cst_num;
	}
	public int getPro_num() {
		return pro_num;
	}
	public void setPro_num(int pro_num) {
		this.pro_num = pro_num;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getCst_aprv() {
		return cst_aprv;
	}
	public void setCst_aprv(String cst_aprv) {
		this.cst_aprv = cst_aprv;
	}
	public String getCst_content() {
		return cst_content;
	}
	public void setCst_content(String cst_content) {
		this.cst_content = cst_content;
	}
	public Date getCst_dt() {
		return cst_dt;
	}
	public void setCst_dt(Date cst_dt) {
		this.cst_dt = cst_dt;
	}
	@Override
	public String toString() {
		return "ConsultingVo [cst_num=" + cst_num + ", pro_num=" + pro_num
				+ ", mem_id=" + mem_id + ", cst_aprv=" + cst_aprv
				+ ", cst_content=" + cst_content + ", cst_pay=" + cst_pay
				+ ", pro_id=" + pro_id + ", cst_dt=" + cst_dt + "]";
	}
}
