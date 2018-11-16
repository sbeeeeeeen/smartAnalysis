package kr.or.ddit.post.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class PostVo {
	private int post_num;			//게시글번호
	private int board_num;			//게시판번호
	private String mem_id; 			//작성자아이디
	private String post_content; 	//내용
	private String post_title; 		//제목
	private String post_del; 		//삭제여부
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date post_dt; 			//작성날짜
	
	public int getPost_num() {
		return post_num;
	}
	public void setPost_num(int post_num) {
		this.post_num = post_num;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getPost_content() {
		return post_content;
	}
	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}
	public String getPost_title() {
		return post_title;
	}
	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}
	public String getPost_del() {
		return post_del;
	}
	public void setPost_del(String post_del) {
		this.post_del = post_del;
	}
	public Date getPost_dt() {
		return post_dt;
	}
	public void setPost_dt(Date post_dt) {
		this.post_dt = post_dt;
	}
	
	@Override
	public String toString() {
		return "PostVo [post_num=" + post_num + ", board_num=" + board_num
				+ ", mem_id=" + mem_id + ", post_content=" + post_content
				+ ", post_title=" + post_title + ", post_del=" + post_del
				+ ", post_dt=" + post_dt + "]";
	}
}
