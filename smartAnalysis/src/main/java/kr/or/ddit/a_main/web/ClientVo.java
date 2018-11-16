package kr.or.ddit.a_main.web;

import javax.websocket.Session;

public class ClientVo {
	private String mem_id;
	private Session session;
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public Session getSession() {
		return session;
	}
	public void setSession(Session session) {
		this.session = session;
	}
}
