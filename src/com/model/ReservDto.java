/*
DROP TABLE MOVIE_RESERVATION

CREATE TABLE MOVIE_RESERVATION(
	ID VARCHAR2(30),
	IMGURL VARCHAR2(100),
	TITLE VARCHAR2(50),
	THEATER VARCHAR2(50),
	MOVTIME VARCHAR2(50),
	REVDATE DATE,
	DEL NUMBER(2)

);

SELECT * FROM MOVIE_RESERVATION

SELECT	ID, IMGURL, TITLE, THEATER, MOVTIME, REVDATE, DEL 
FROM MOVIE_RESERVATION
WHERE TITLE='친실이는 복도 많지'

DELETE FROM MOVIE_RESERVATION
WHERE TITLE='싱 스트리트'


DROP SEQUENCE SEQ_MOVIE_RESERVATION

CREATE SEQUENCE SEQ_MOVIE_RESERVATION
START WITH 1
INCREMENT BY 1;
*/

package com.model;

import java.io.Serializable;

public class ReservDto implements Serializable{
	
	private String id;
	private String imgUrl;
	private String title;
	private String theater;
	private String movTime;
	private String revDate;
	private int del;
	
	public ReservDto() {
		super();
	}

	public ReservDto(String id, String imgUrl, String title, String theater, String movTime, String revDate, int del) {
		super();
		this.id = id;
		this.imgUrl = imgUrl;
		this.title = title;
		this.theater = theater;
		this.movTime = movTime;
		this.revDate = revDate;
		this.del = del;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getTheater() {
		return theater;
	}

	public void setTheater(String theater) {
		this.theater = theater;
	}

	public String getMovTime() {
		return movTime;
	}

	public void setMovTime(String movTime) {
		this.movTime = movTime;
	}

	public String getRevDate() {
		return revDate;
	}

	public void setRevDate(String revDate) {
		this.revDate = revDate;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	@Override
	public String toString() {
		return "ReservDto [id=" + id + ", imgUrl=" + imgUrl + ", title=" + title + ", theater=" + theater + ", movTime="
				+ movTime + ", revDate=" + revDate + ", del=" + del + "]";
	}

	
	
	
	
}
