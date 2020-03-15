package com.dao;

import com.model.MemberDto;

public interface MemberDao {

	MemberDto login(MemberDto dto);

	boolean addmember(MemberDto dto);

}
