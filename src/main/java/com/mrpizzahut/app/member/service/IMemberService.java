package com.mrpizzahut.app.member.service;

import com.mrpizzahut.app.member.dto.MemberDTO;

public interface IMemberService {
	public String EmailCheck(String email);

	public int joinSuccessProc(MemberDTO member);

	public MemberDTO loginMember(MemberDTO member);

	public MemberDTO check(MemberDTO member);

	public MemberDTO findIdsendMessage(MemberDTO member);

	public MemberDTO check_delete(MemberDTO member);

	public boolean deleteProc(MemberDTO member);

	public int updateProc(MemberDTO member);



}
