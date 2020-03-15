package com.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dao.MovieDao;
import com.model.ReservDto;

@Repository
public class MovieDaoImpl implements MovieDao {

	@Autowired
	SqlSession sqlSession;
	
	String namespace = "Reservation.";

	@Override
	public boolean addReserv(ReservDto dto) {
		int n = sqlSession.insert(namespace + "addReserv", dto);
		return n>0?true:false;
	}

	
	
	
	
	
	
	
	
	@Override
	public List<ReservDto> getReservList(String id) {
		System.out.println("id : "+ id);
		List<ReservDto> list = sqlSession.selectList(namespace + "getReservList", id);		
		System.out.println("list size : " + list.size());
		
		return list;
	}
	

}
