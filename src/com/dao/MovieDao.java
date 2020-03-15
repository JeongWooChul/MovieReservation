package com.dao;

import java.util.List;

import com.model.ReservDto;

public interface MovieDao {

	boolean addReserv(ReservDto dto);

	List<ReservDto> getReservList(String id);



}
