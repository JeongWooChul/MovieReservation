package com.service;

import com.model.MemberDto;

public interface MemberService {

	MemberDto login(MemberDto dto);

	boolean addMember(MemberDto dto);

}
