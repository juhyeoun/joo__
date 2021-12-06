package com.mrpizzahut.app.member.controller;


import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mrpizzahut.app.buket.CartDto;
import com.mrpizzahut.app.config.KakaoConfig;
import com.mrpizzahut.app.member.dto.MemberDTO;
import com.mrpizzahut.app.member.dto.PagingVO;
import com.mrpizzahut.app.member.dto.QnaDTO;
import com.mrpizzahut.app.member.service.IMemberService;
import com.mrpizzahut.app.member.service.MemberServiceImpl;

import Daos.IMemberDAO;


@Controller
public class MemberController {
	private final static Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired IMemberService service;
	@Autowired IMemberDAO dao;
	@Autowired HttpSession session;
	
	
	@RequestMapping(value = "/emailCheck", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, String> emailCheck(@RequestBody Map<String, String> map) {
		System.out.println("emailcheck");
		String email = map.get("email");
		String result = service.EmailCheck(email);
		map.put("msg", result);
		System.out.println(redirectedUrl(result));
		return map;
	}
	
	
	@RequestMapping(value = "/loginMember", produces = "application/json; charset=utf-8", method=RequestMethod.POST)
	@ResponseBody
	public MemberDTO loginMember(@RequestBody MemberDTO member) {
		System.out.println("컨트롤러");
		System.out.println(member);
		MemberDTO result = service.loginMember(member);
		return result;
	}
	
	
	
	@RequestMapping(value = "/check", produces = "application/json; charset=utf-8", method=RequestMethod.POST)
	@ResponseBody
	public MemberDTO check(@RequestBody MemberDTO member) {
		System.out.println("인포컨트롤러");
		System.out.println(member);
		MemberDTO result = service.check(member);
		return result;
	}
	
	@RequestMapping(value = "/admin/searchKeywordProc", produces = "application/json; charset=utf-8", method=RequestMethod.POST)
	@ResponseBody
	public List<MemberDTO> searchKeywordProc(@RequestBody MemberDTO member, Model model) {
		
		System.out.println("컨트롤러?");
		System.out.println(member);
		MemberDTO m = new MemberDTO();
		m.setName(member.getName());
		return service.searchKeywordProc(m);
	}
	
	@GetMapping("admin/memberManage")
	public String boardList(PagingVO vo, ModelAndView mv, Model model,
							@RequestParam(value = "nowPage", required = false)String nowPage,
							@RequestParam(value = "cntPerPage", required = false)String cntPerPage) {
		System.out.println("here come?");
		int total = service.countBoard();
		System.out.println(total);
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		}else if(nowPage == null) {
			nowPage = "1";
		}else if(cntPerPage == null) {
			cntPerPage = "5";
		}
		System.out.println(nowPage + cntPerPage);
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		System.out.println(vo);
		model.addAttribute("paging", vo);
		ArrayList<MemberDTO> list = service.list();
//		List<MemberDTO> list2 = service.selectBoard(vo);
//		model.addAttribute("list", list);
		model.addAttribute("list", service.selectBoard(vo));
		
		return "admin/memberManage";
	}
	
	@RequestMapping(value = "/check_delete", produces = "application/json; charset=utf-8", method=RequestMethod.POST)
	@ResponseBody
	public MemberDTO check_delete(@RequestBody MemberDTO member) {
		System.out.println("인포컨트롤러");
		System.out.println(member);
		MemberDTO result = service.check_delete(member);
		return result;
	}
	
	
	
	@RequestMapping(value = "/sendMessage")
	@ResponseBody
	public Map<String, String> sendMessage(@RequestBody MemberDTO member) {
		Map<String, String> map = new HashMap<String, String>();
		System.out.println("호호홓" + member.getMobile());
		String mobile = member.getMobile();
		Random r = new Random();
		String randNum = String.format("%06d", r.nextInt(1000000));
		String text = "mrpizzahut 인증번호: " + randNum;
		
		map.put("randNum", randNum);
		
		// int num = sendMessageService.sendMessage(mobile, text);
		int num = 0;
		map.put("flag", String.valueOf(num));
		System.out.println(num);
		System.out.println(randNum);
		return map;
	}
	@RequestMapping(value = "/findIdsendMessage")
	@ResponseBody
	public Map<String, String> findIdsendMessage(@RequestBody MemberDTO member, Model model) {
		System.out.println("controller");
		Map<String, String> map = new HashMap<String, String>();
		
		
		MemberDTO m = service.findIdsendMessage(member);
		int fail = -1;
		System.out.println(m + "제발요");
		if(m == null) {
			map.put("flag", String.valueOf(fail));
			System.out.println(m +"요기" +  map.get("flag"));
		}else {
			String name = m.getName();
			String mobile = m.getMobile();
			Random r = new Random();
			String randNum = String.format("%06d", r.nextInt(1000000));
			String text = "mrpizzahut 인증번호: " + randNum;
			
			map.put("randNum", randNum);
			map.put(name, m.getName());
			//int num = sendMessageService.sendMessage(mobile, text);
			int num = 0;
			map.put("flag", String.valueOf(num));
			System.out.println(num);
			System.out.println(randNum);
		}
		return map;
	}
	
	
	
	// 컨트롤러1 서비스2 다오3
	@RequestMapping(value = "/joinSuccessProc")
	public String joinSuccessProc(MemberDTO member, Model model) {
		System.out.println("컨트롤러?");
		int result = service.joinSuccessProc(member);
		if(result == 0) {
			return "/mypage/login_join/join";
		}else if(result == 1) {
			model.addAttribute("name", member.getName());
			model.addAttribute("id", member.getEmail());
			return "/mypage/login_join/joinSuccess";
		}else {
			return "/mypage/login_join/join";
		}
	}
	@RequestMapping(value = "/qnaProc")
	public String qnaProc(QnaDTO qna, Model model) {
		System.out.println("qna컨트롤러?");
		System.out.println(qna);
		int result = service.qnaProc(qna);
//		if(result == 0) {
//			return "/mypage/login_join/join";
//		}else if(result == 1) {
//			model.addAttribute("name", member.getName());
//			model.addAttribute("id", member.getEmail());
//			return "/mypage/login_join/joinSuccess";
//		}else {
//			return "/mypage/login_join/join";
//		}
		return "sad";
	}
	
	@RequestMapping(value = "/updateProc")
	public String updateProc(MemberDTO member, Model model) {
		System.out.println("컨트롤러?");
		System.out.println(member);
		int result = service.updateProc(member);
		if(result == 0) {
			return "/mypage/afterLogin/myInfo_step2";
		}else if(result == 1) {
			
			return "home";
		}else {
			return "/mypage/afterLogin/myInfo_step2";
		}
	}
	
	
	@Autowired KakaoConfig kakao;
	@RequestMapping(value = "kakaoLogin")
	public String kakaoLogin(String code, HttpSession session) {
		logger.warn("code" + code);
		String accessToken = kakao.getAccessToken(code);
		HashMap<String, Object> userInfo = kakao.getUserInfo(accessToken);
		session.setAttribute("email", userInfo.get("nickname"));
		session.setAttribute("accessToken", accessToken);
		return "home";
	}
	
	@RequestMapping(value = "deleteProc")
	public String deleteProc(MemberDTO member) {
		System.out.println("도착");
		boolean b = service.deleteProc(member);
//		boolean b = true;
		if(b == false) {
			return "home";
		}else {
			return "home";
		}	
	}
	
//	@RequestMapping(value = "/bucketCount", produces = "application/json; charset=utf-8")
//	@ResponseBody
//	public CartDto bucketCount(@RequestBody CartDto cart) {
//		System.out.println("cart controller");
//		System.out.println(cart);
//		CartDto result = service.bucketCount(cart);
//		return result;
//	}
	


		
}
