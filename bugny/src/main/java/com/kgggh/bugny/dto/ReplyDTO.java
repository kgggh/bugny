package com.kgggh.bugny.dto;

import java.sql.Date;

public class ReplyDTO {
	private int reply_idx;
	private int board_idx;
	private String contents;
	private String id;
	private Date regdate;
	public int getReply_idx() {
		return reply_idx;
	}
	public void setReply_idx(int reply_idx) {
		this.reply_idx = reply_idx;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
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
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "ReplyDTO [reply_idx=" + reply_idx + ", board_idx=" + board_idx + ", contents=" + contents + ", id=" + id
				+ ", regdate=" + regdate + "]";
	}
	
	
}
