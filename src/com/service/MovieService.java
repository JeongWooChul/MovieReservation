package com.service;

import java.util.List;
import com.model.MovieDto;
import com.model.ReservDto;

public interface MovieService {

	public List<MovieDto> getMovieChart();

	public MovieDto getMovieDetail(String detailUrl);

	public boolean addReserv(ReservDto dto);

	public List<ReservDto> getReservList(String id);


}
