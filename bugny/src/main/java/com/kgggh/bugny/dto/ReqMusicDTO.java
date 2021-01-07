package com.kgggh.bugny.dto;

import java.sql.Date;

public class ReqMusicDTO {
	private int req_idx;
	private String contents;
	private String id;
	private String regdate;
	
	public int getReq_idx() {
		return req_idx;
	}
	public void setReq_idx(int req_idx) {
		this.req_idx = req_idx;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "ReqMusic [req_idx=" + req_idx + ", contents=" + contents + ", id=" + id + ", regdate=" + regdate + "]";
	}
	
	
	
	

}
