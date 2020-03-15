package com.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dao.MemberDao;
import com.model.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	SqlSession sqlSession;
	
	String namespace = "Member.";

	@Override
	public MemberDto login(MemberDto dto) {
		MemberDto mem = sqlSession.selectOne(namespace + "login", dto);
		return mem;
	}

	@Override
	public boolean addmember(MemberDto dto) {
		int n = sqlSession.insert(namespace + "addMember", dto);
		return n>0?true:false;
	}
	
	
}
