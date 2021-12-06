package com.mrpizzahut.app.member.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.mrpizzahut.app.buket.CartDto;
import com.mrpizzahut.app.member.dto.MemberDTO;
import com.mrpizzahut.app.member.dto.PagingVO;
import com.mrpizzahut.app.member.dto.QnaDTO;
import com.mrpizzahut.app.order.OrderDTO;

import Daos.IMemberDAO;
import Daos.buketDao;


@Service
public class MemberServiceImpl implements IMemberService{
	
	@Autowired IMemberDAO dao;
	@Autowired buketDao cartDao;
	@Autowired HttpSession session;
	
	@Override
	public String EmailCheck(String email) {
		int count = dao.EmailCheck(email);
		System.out.println(count);
		if(count == 0) {
			return "사용 가능한 이메일입니다.";
		}
		return "중복된 이메일입니다.";
	}

	@Override
	public int joinSuccessProc(MemberDTO member) {
		System.out.println("서비스?");
		System.out.println(member);
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePw = encoder.encode(member.getPw());
		member.setPw(securePw);
		System.out.println(securePw);
		if(dao.joinSuccessProc(member) == 1) {		
			return 1;
		}else {
			return 2;
		}
	}
	
	@Override
	public int qnaProc(QnaDTO qna) {
		System.out.println("qna 서비스");
		System.out.println(qna);
		
		return 0;
	}

	
	@Override
	public int updateProc(MemberDTO member) {
		String email = (String)session.getAttribute("email");
		member.setEmail(email);
		System.out.println("서비스?");
		System.out.println(member);
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePw = encoder.encode(member.getPw());
		member.setPw(securePw);
		if(dao.updateProc(member) == 1) {		
			return 1;
		}else {
			return 2;
		}
	}
	
	@Override
	public int adminUpdateMember(MemberDTO member) {
		System.out.println(member);
		member.setEmail(member.getEmail());
		member.setMobile(member.getMobile());
		member.setAddr(member.getAddr());
		System.out.println(member);
		if(dao.adminUpdateMember(member) == 1) {
			return 1;
		}else {
			return 2;
		}
	}


	@Override
	public MemberDTO loginMember(MemberDTO member) {
		System.out.println("서비스?");
		System.out.println(member);
		
		MemberDTO loginFail = new MemberDTO();
		
		MemberDTO daoMember = dao.loginMember(member);
		System.out.println(daoMember);
		if(daoMember == null) {
			//계정이 없을때
			loginFail.setRescode("fail");
			return loginFail;
		}else {
			// 비번땡
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			if(encoder.matches(member.getPw(), daoMember.getPw())) {
				daoMember.setRescode("success");
				session.setAttribute("email", daoMember.getEmail());
				session.setAttribute("user", daoMember);
				session.setAttribute("role", daoMember);
				//비밀번호는 널
				return daoMember;
			}
			loginFail.setRescode("fail");
			return loginFail;
		}
	}
	
//	@Override
//	public CartDto bucketCount(CartDto cart) {
//		System.out.println("cart service");
//		System.out.println(cart);
//		MemberDTO member = new MemberDTO();
//		MemberDTO m = dao.loginMember(member);
//		System.out.println(m + "이거");
//		if(m == null) {
//			return null;
//		}
//		
//		CartDto cartCount = cartDao.selectCount(cart); 
//		System.out.println(cartCount);
//		return cartCount;
//		
//	}
	


	@Override
	public MemberDTO findIdsendMessage(MemberDTO member) {
		System.out.println("service?");
		System.out.println(member);
		MemberDTO fail = new MemberDTO();
		MemberDTO m = dao.findEmail(member);
		System.out.println(m + "이건가?");
		
		if(m == null) {
			return null;
		}else {
			if(member.getName().equals(m.getName()) && member.getMobile().equals(m.getMobile())) {
				return m;
			}			
			return null;
		}
	}
	
	@Override
	public List<MemberDTO> searchKeywordProc(MemberDTO member) {

		List<MemberDTO> list =  dao.selectList(member);
		if(list == null) {
			return null;
		}else {
			return list;
		}
		
	}
	
	@Override
	public List<OrderDTO> searchCodeProc(OrderDTO order) {
		System.out.println("service" + order);
		List<OrderDTO> orderList =  dao.selectOrderList(order);
		System.out.println("orderList: " + orderList);
		if(orderList == null) {
			return null;
		}else {
			return orderList;
		}
	}

	

	@Override
	public MemberDTO check(MemberDTO member) {
		String email = (String)session.getAttribute("email");
		member.setEmail(email);
		MemberDTO loginFail = new MemberDTO();
		MemberDTO check = dao.loginMember(member);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		if(encoder.matches(member.getPw(), check.getPw())) {
			/* session.setAttribute("findUser", check); */
			return check;
		}else {
			loginFail.setRescode("fail");
			return loginFail;
		}
	}

	@Override
	public MemberDTO check_delete(MemberDTO member) {
		String email = (String)session.getAttribute("email");
		member.setEmail(email);
		MemberDTO loginFail = new MemberDTO();
		MemberDTO check = dao.loginMember(member);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		if(encoder.matches(member.getPw(), check.getPw())) {
			/* session.setAttribute("findUser", check); */
			return check;
		}else {
			loginFail.setRescode("fail");
			return loginFail;
		}
	}

	@Override
	public boolean deleteProc(MemberDTO member) {
		String email = (String) session.getAttribute("email");
		System.out.println(email + "호홓");
			member.setEmail(email);
			System.out.println(member.getEmail() + "멤버");
		
			dao.delete(member);
			session.removeAttribute("email");
			session.invalidate();
			return true;
	}

	@Override
	public ArrayList<MemberDTO> list() {
		return dao.list();
	}
	@Override
	public ArrayList<OrderDTO> orderList() {
		ArrayList<OrderDTO> list = dao.orderList();
		System.out.println("일단 여긴오지?");
		System.out.println(list);
		
		return list;
	}


	@Override
	public int adminMemberDelete(String name, MemberDTO member) {
		System.out.println(name);
		System.out.println(member.getEmail());
		System.out.println(member.getPw());
		if("".equals(name)) {
			return 0;
		}
		MemberDTO m = dao.memberName(name);
		System.out.println(m + "ㅋㅊㅌ");
		if(m == null) {
			return 0;
		}
		MemberDTO adminPw = dao.loginMember(member);
		System.out.println(adminPw + "ㅁㅇ");
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		if(encoder.matches(member.getPw(), adminPw.getPw())) {
//			String email = m.getEmail();
			dao.delete(m);
			return 1;
		}
		return 0;
	}

	@Override
	public int countBoard() {
		return dao.countBoard();
	}

	@Override
	public List<MemberDTO> selectBoard(PagingVO vo) {
		
		return dao.selectBoard(vo);
	}




	

	

	


}

	
	
	

