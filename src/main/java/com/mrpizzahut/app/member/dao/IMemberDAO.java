package com.mrpizzahut.app.member.dao;


import java.util.Map;

import org.springframework.stereotype.Repository;

import com.mrpizzahut.app.member.dto.MemberDTO;

@Repository
public interface IMemberDAO {
	public int EmailCheck(String email);
	public Map<String, Object>findByEmail(String email);
	public int joinSuccessProc(MemberDTO member);
	public MemberDTO loginMember(MemberDTO member);
	public MemberDTO check(MemberDTO member);
	public MemberDTO findEmail(MemberDTO member);
	public MemberDTO findMobile(String phone);
	public int updatePw(MemberDTO member);
	public MemberDTO findPw(MemberDTO member);
	public int delete(MemberDTO member);
	public MemberDTO makeNewPw(MemberDTO member);
	public MemberDTO chkOldPw(MemberDTO member);
	public int updateProc(MemberDTO member);

	
}
