package com.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.MovieDto;
import com.model.ReservDto;
import com.service.MovieService;

@Controller
public class MovieController {
	private static Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	MovieService movieService;
	
	@RequestMapping(value = "movieChart.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String movieChart(Model model) {
		
		List<MovieDto> list = movieService.getMovieChart();		
		model.addAttribute("movieChart", list);
			
		return "movieChart";
	}
	
	/*
	@RequestMapping(value = "movieDetail.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String movieDetail(String detailUrl, Model model) {
		
		MovieDto dto = movieService.getMovieDetail(detailUrl);
		System.out.println("controller 확인 : "+ dto.getActor());
		
		model.addAttribute("detail", dto);		
		return "movieDetail";
	}
	*/
	

	@ResponseBody
	@RequestMapping(value = "movieDetail.do", method = {RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> movieDetail(String detailUrl) {
		
		MovieDto dto = movieService.getMovieDetail(detailUrl);
		//System.out.println(dto.getActor());
			
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("title", dto.getTitle());
		map.put("director", dto.getDirector());
		map.put("actor", dto.getActor());
		map.put("genre", dto.getGenre());
		map.put("content", dto.getContent());
		map.put("oDate", dto.getoDate());
		map.put("like", dto.getLike());
		
		return map;
	}
	
	
	@RequestMapping(value = "ticketing.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String ticketing(Model model) {
		//MovieDto dto = movieService.getMovieDetail(detailUrl);
		//System.out.println(dto.getActor());
			
		//Map<String, Object> map = new HashMap<String, Object>();
		//map.put("title", dto.getTitle());
		
		//return "movieTicketing.tiles";
		List<MovieDto> list = movieService.getMovieChart();		
		model.addAttribute("movieChart", list);
		
		return "movieReserv";
	}
	
	@RequestMapping(value = "addReserv.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String addReserv(ReservDto dto, Model model) {
		System.out.println("imgUrl : " + dto.getImgUrl());
		
		boolean isS = movieService.addReserv(dto);
		if(isS) {
			model.addAttribute("revMovie", dto);
			return "revConfirm";
		} else {
			model.addAttribute("message", "addRevF");
			return "MessageAlert";
		}
	}
	
	@RequestMapping(value = "reservList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String reservList(Model model, String id) {
		List<ReservDto> list = movieService.getReservList(id);		
		model.addAttribute("reservList", list);
		
		return "reservList";
	}
	
	
	
	
	
}
