package com.model;

import java.io.Serializable;

public class MovieDto implements Serializable{
	
	private String detailUrl;
	private String imgUrl;
	
	private String title;
	private String director;
	private String actor;
	
	private String genre;
	private String content;
	private String oDate;
	
	private int like;
	
	public MovieDto() {
	}

	public MovieDto(String detailUrl, String imgUrl, String title, String oDate, int like) {
		super();
		this.detailUrl = detailUrl;
		this.imgUrl = imgUrl;
		this.title = title;
		this.oDate = oDate;
		this.like = like;
	}
	
	

	public MovieDto(String director, String actor, String genre, String content, String oDate) {
		super();
		this.director = director;
		this.actor = actor;
		this.genre = genre;
		this.content = content;
		this.oDate = oDate;
	}
	
	

	public MovieDto(String detailUrl, String imgUrl, String title, String director, String actor, String genre,
			String content, String oDate, int like) {
		super();
		this.detailUrl = detailUrl;
		this.imgUrl = imgUrl;
		this.title = title;
		this.director = director;
		this.actor = actor;
		this.genre = genre;
		this.content = content;
		this.oDate = oDate;
		this.like = like;
	}

	public String getDetailUrl() {
		return detailUrl;
	}

	public void setDetailUrl(String detailUrl) {
		this.detailUrl = detailUrl;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getActor() {
		return actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getoDate() {
		return oDate;
	}

	public void setoDate(String oDate) {
		this.oDate = oDate;
	}

	public int getLike() {
		return like;
	}

	public void setLike(int like) {
		this.like = like;
	}

	@Override
	public String toString() {
		return "MovieDto [detailUrl=" + detailUrl + ", imgUrl=" + imgUrl + ", title=" + title + ", director=" + director
				+ ", actor=" + actor + ", genre=" + genre + ", content=" + content + ", oDate=" + oDate + ", like="
				+ like + "]";
	}
	
	
	
}
