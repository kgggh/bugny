package com.kgggh.bugny.dto;

public class LikeMusicDTO {
	private int like_idx;
	private int music_idx;
	private String id;
	private int likeCheck;
	public int getLike_idx() {
		return like_idx;
	}
	public void setLike_idx(int like_idx) {
		this.like_idx = like_idx;
	}
	public int getMusic_idx() {
		return music_idx;
	}
	public void setMusic_idx(int music_idx) {
		this.music_idx = music_idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getLikeCheck() {
		return likeCheck;
	}
	public void setLikeCheck(int likeCheck) {
		this.likeCheck = likeCheck;
	}
	@Override
	public String toString() {
		return "LikeMusicDTO [like_idx=" + like_idx + ", music_idx=" + music_idx + ", id=" + id + ", likeCheck="
				+ likeCheck + "]";
	}
	
	

	

}
