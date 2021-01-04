package com.kgggh.bugny.dto;

import java.sql.Date;

public class MusicDTO {
	private int music_idx;
    private String album;
    private String title;
    private String singer;
    private int liked;
    private Date releaseDate;
    private String playURL;
    private String likeCheck;
    
	public int getMusic_idx() {
		
		return music_idx;
	}
	public void setMusic_idx(int music_idx) {
		this.music_idx = music_idx;
	}
	public String getAlbum() {
		return album;
	}
	public void setAlbum(String album) {
		this.album = album;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSinger() {
		return singer;
	}
	public void setSinger(String singer) {
		this.singer = singer;
	}
	public int getLiked() {
		return liked;
	}
	public void setLiked(int liked) {
		this.liked = liked;
	}
	public Date getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}
	
	
	public String getPlayURL() {
		return playURL;
	}
	public void setPlayURL(String playURL) {
		this.playURL = playURL;
	}
	public String getLikeCheck() {
		return likeCheck;
	}
	public void setLikeCheck(String likeCheck) {
		this.likeCheck = likeCheck;
	}
	@Override
	public String toString() {
		return "MusicDTO [music_idx=" + music_idx + ", album=" + album + ", title=" + title + ", singer=" + singer
				+ ", liked=" + liked + ", releaseDate=" + releaseDate + ", playURL=" + playURL + ", likeCheck="
				+ likeCheck + "]";
	}
	
	
	
	
	
    
    

}
