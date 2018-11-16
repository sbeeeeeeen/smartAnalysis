package kr.or.ddit.message.model;

import java.util.Date;

public class MessageVo {
	private int mess_num;
	private String mem_id;
	private String mem_id2;
	private String mess_content;
	private Date mess_dt;
	public int getMess_num() {
		return mess_num;
	}
	public void setMess_num(int mess_num) {
		this.mess_num = mess_num;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_id2() {
		return mem_id2;
	}
	public void setMem_id2(String mem_id2) {
		this.mem_id2 = mem_id2;
	}
	public String getMess_content() {
		return mess_content;
	}
	public void setMess_content(String mess_content) {
		this.mess_content = mess_content;
	}
	public Date getMess_dt() {
		return mess_dt;
	}
	public void setMess_dt(Date mess_dt) {
		this.mess_dt = mess_dt;
	}
	
	
}
