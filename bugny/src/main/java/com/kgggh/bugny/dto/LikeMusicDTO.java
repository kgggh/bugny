package com.kgggh.bugny.dto;

public class LikeMusicDTO {
	private int like_music;
	private int music_idx;
	private int id;
	private int likeCheck;
	
	public int getLike_music() {
		return like_music;
	}
	public void setLike_music(int like_music) {
		this.like_music = like_music;
	}
	public int getMusic_idx() {
		return music_idx;
	}
	public void setMusic_idx(int music_idx) {
		this.music_idx = music_idx;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
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
		return "LikeMusic [like_music=" + like_music + ", music_idx=" + music_idx + ", id=" + id + ", likeCheck="
				+ likeCheck + "]";
	}

	

}
