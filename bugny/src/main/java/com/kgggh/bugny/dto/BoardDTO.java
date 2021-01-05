package com.kgggh.bugny.dto;

import java.sql.Date;

public class BoardDTO {
	    private int board_idx;
	    private String category;
	    private String title;
	    private String contents;
	    private String id;
	    private int hit;
	    private int liked;
	    private Date regdate;
	    private String display;
		public int getBoard_idx() {
			return board_idx;
		}
		public void setBoard_idx(int board_idx) {
			this.board_idx = board_idx;
		}
		public String getCategory() {
			return category;
		}
		public void setCategory(String category) {
			this.category = category;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
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
		public int getHit() {
			return hit;
		}
		public void setHit(int hit) {
			this.hit = hit;
		}
		public int getLiked() {
			return liked;
		}
		public void setLiked(int liked) {
			this.liked = liked;
		}
		public Date getRegdate() {
			return regdate;
		}
		public void setRegdate(Date regdate) {
			this.regdate = regdate;
		}
		
		public String getDisplay() {
			return display;
		}
		public void setDisplay(String display) {
			this.display = display;
		}
		@Override
		public String toString() {
			return "BoardDTO [board_idx=" + board_idx + ", category=" + category + ", title=" + title + ", contents="
					+ contents + ", id=" + id + ", hit=" + hit + ", liked=" + liked + ", regdate=" + regdate + ", display="
					+ display + "]";
		}
	    
		
	    
	   
}
