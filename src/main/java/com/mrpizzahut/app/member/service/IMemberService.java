package com.mrpizzahut.app.member.service;




import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;

import com.mrpizzahut.app.buket.CartDto;
import com.mrpizzahut.app.member.dto.MemberDTO;
import com.mrpizzahut.app.member.dto.PagingVO;
import com.mrpizzahut.app.member.dto.QnaDTO;
import com.mrpizzahut.app.order.OrderDTO;

import Daos.IMemberDAO;

public interface IMemberService {
	public String EmailCheck(String email);

	public int joinSuccessProc(MemberDTO member);

	public MemberDTO loginMember(MemberDTO member);

	public MemberDTO check(MemberDTO member);

	public MemberDTO findIdsendMessage(MemberDTO member);

	public MemberDTO check_delete(MemberDTO member);

	public boolean deleteProc(MemberDTO member);

	public int updateProc(MemberDTO member);

	public ArrayList<MemberDTO> list();

	public int adminUpdateMember(MemberDTO member);

	public int adminMemberDelete(String name, MemberDTO member);

	public List<MemberDTO> searchKeywordProc(MemberDTO member);

	public ArrayList<OrderDTO> orderList();

	public List<OrderDTO> searchCodeProc(OrderDTO o);

	public int countBoard();
	
	public List<MemberDTO> selectBoard(PagingVO vo);

	public int qnaProc(QnaDTO qna);
 	
//	public CartDto bucketCount(CartDto cart);




}
