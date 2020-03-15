package com.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.MemberDao;
import com.model.MemberDto;
import com.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDao memberDao;
	
	@Override
	public MemberDto login(MemberDto dto) {
		return memberDao.login(dto);
	}

	@Override
	public boolean addMember(MemberDto dto) {
		return memberDao.addmember(dto);
	}
}
