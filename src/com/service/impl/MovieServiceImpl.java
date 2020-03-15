package com.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.MovieDao;
import com.model.MovieDto;
import com.model.ReservDto;
import com.service.MovieService;

@Service
public class MovieServiceImpl implements MovieService{

	@Autowired
	MovieDao movieDao;
	
	@Override
	public List<MovieDto> getMovieChart() {
		System.out.println(" === getMovieChart 실행");
		Document doc;
		List<MovieDto> list = new ArrayList<MovieDto>();
		
		try {	
			//가져 올 url 연결
			doc = Jsoup.connect("http://www.cgv.co.kr/movies/").get();
			
			// 상세페이지 
			Elements details = doc.select("div.box-contents a:first-child");
			// 포스터
			Elements imgs= doc.select("div.box-image span.thumb-image img");
			// 영화제목
			Elements titles = doc.select("div.box-contents strong.title");
			// 개봉일 
			Elements oDates = doc.select("div.box-contents span.txt-info strong");
			// 추천수 
			Elements likes = doc.select("div.box-contents span.count strong i");
			
			
			for (int i = 0; i < 7; i++) {
				//String hrefValue = details.get(i).attr("href");
				String hrefValue = details.get(i).absUrl("href");
				System.out.println(hrefValue + "  ");

				String imgUrl = imgs.get(i).attr("src");
				System.out.println(imgUrl + "  ");
				
				Element eTitle = titles.get(i);
				String title = eTitle.text();
				System.out.println(title + "  ");
				
				Element eDate = oDates.get(i);
				String oDate = eDate.text();
				System.out.println(oDate + "  ");
				
				Element eLike = likes.get(i);
				String slike = eLike.text().replace(",", "");
				System.out.println(slike);
				
				int like = Integer.parseInt(slike);
				
				MovieDto dto = new MovieDto();
				dto.setDetailUrl(hrefValue);
				dto.setImgUrl(imgUrl);
				dto.setTitle(title);
				dto.setoDate(oDate);
				dto.setLike(like);
				
				list.add(dto);			
			}
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public MovieDto getMovieDetail(String detailUrl) {
		System.out.println(" === getMovieDetail 실행  URL : " + detailUrl);
		Document doc;
		
		MovieDto dto = null;
		
		try {	
			//가져 올 url 연결
			doc = Jsoup.connect(detailUrl.trim()).get();
			
			// 포스터
			Elements imgs= doc.select("div.box-image span.thumb-image img");
			String imgUrl = imgs.attr("src");
			System.out.println(imgUrl + "  ");
			
			// 제목
			Elements eTitle = doc.select("div.title strong");
			String title = eTitle.text();
			System.out.println(title + "  ");
						
			// 감독 
			Elements eDirector = doc.select("div.spec dd:nth-of-type(1)");
			String director = eDirector.text();
			System.out.println(director + "  ");
			
			// 배우
			Elements eActor = doc.select("div.spec dd:nth-of-type(3)");
			String actor = eActor.text();
			System.out.println(actor + "  ");
			
			// 장르
			Elements eGenre = doc.select("div.spec dt:nth-of-type(3)");
			String genre = eGenre.text();
			System.out.println(genre + "  ");
			
			// 기타 
			Elements eContent = doc.select("div.spec dd:nth-of-type(5)");
			String content = eContent.text();
			System.out.println(content + "  ");
			
			// 개봉일 
			Elements eOdate = doc.select("div.spec dd:nth-of-type(6)");
			String oDate = eOdate.text();
			System.out.println(oDate + "  ");
			
			// ♥
			Elements eLike = doc.select("span.count strong i");
			int like = Integer.parseInt(eLike.text().replace(",", ""));
			System.out.println(like);
			
			
			
			dto = new MovieDto(detailUrl, imgUrl, title, director, actor, genre, content, oDate, like);
			
			/*
			dto.setDirector(director);
			dto.setActor(actor);
			dto.setGenre(genre);
			dto.setContent(content);
			dto.setoDate(oDate);				
			*/
			
			
			/*
			for (int i = 0; i < 7; i++) {
				
				Element eDirector = directors.get(i);
				String director = eDirector.text();
				System.out.println(director + "  ");
				
				Element eActor = actors.get(i);
				String actor = eActor.text();
				System.out.println(actor + "  ");
				
				Element eGenre = genres.get(i);
				String genre = eGenre.text();
				System.out.println(genre + "  ");
				
				Element eContent = contents.get(i);
				String content = eContent.text();
				System.out.println(content + "  ");
			
				Element eDate = oDates.get(i);
				String oDate = eDate.text();
				System.out.println(oDate + "  ");
				
				
				Element eLike = likes.get(i);
				String slike = eLike.text().replace(",", "");
				System.out.println(slike);
				int like = Integer.parseInt(slike);
				
				
				
				
				MovieDto dto = new MovieDto();
				
				dto.setDirector(director);
				dto.setActor(actor);
				dto.setGenre(genre);
				dto.setContent(content);
				dto.setoDate(oDate);				
				
				list.add(dto);
							
			}
			*/
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public boolean addReserv(ReservDto dto) {
		return movieDao.addReserv(dto);
	}

	@Override
	public List<ReservDto> getReservList(String id) {
		return movieDao.getReservList(id);
	}

	
	
	
	
	
	
}

