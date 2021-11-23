package com.mrpizzahut.app;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mrpizzahut.app.member.dto.MemberDTO;

import Daos.IMemberDAO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private IMemberDAO dao;
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "home";
	}
	
	
	@RequestMapping(value = "/login")
	public String login() {
		return "/mypage/login_join/login";
	}
	
	@RequestMapping(value = "/logout")
	public String logout() {
		return "/mypage/login_join/logout";
	}
	
	@RequestMapping(value = "/join")
	public String join() {
		return "/mypage/login_join/join";
	}
	
	@RequestMapping(value = "/findId")
	public String findId() {
		return "/mypage/login_join/findId";
	}
	@RequestMapping(value = "/findIdResult")
	public String findIdResult(HttpServletRequest request,HttpServletResponse response,Model model) {
		String phone=request.getParameter("phone");
		MemberDTO memberDTO=dao.findMobile(phone);
		model.addAttribute("dto", memberDTO);
		
		return "/mypage/login_join/findIdResult";
	}
	@RequestMapping(value = "/findPwResult")
	public String findPwResult() {	
		return "/mypage/login_join/findPwResult";
	}
	
	@RequestMapping(value = "/findPw")
	public String findPw() {
		return "/mypage/login_join/findPw";
	}
	@RequestMapping(value = "/phoneCheck")
	public String phoneCheck() {
		System.out.println("phonecheck");
		return "/mypage/login_join/phoneCheck";
	}
	@RequestMapping(value = "/findIdphoneCheck")
	public String findIdphoneCheck() {
		return "/mypage/login_join/findIdphoneCheck";
	}
	@RequestMapping(value = "/myMipi")
	public String myMipi(HttpServletRequest request) {
		try {
			String email=request.getSession().getAttribute("email").toString();
			if(email==null) {
				throw new RuntimeException("비로그인 사용자");
			}
			return "/mypage/afterLogin/myMipi";
		} catch (Exception e) {
			return "/mypage/login_join/login";
		}
	
	}
	@RequestMapping(value = "/myInfo_step1")
	public String myInfo_step1() {
		return "/mypage/afterLogin/myInfo_step1";
	}
	@RequestMapping(value = "/myInfo_step2")
	public String myInfo_step2() {
		return "/mypage/afterLogin/myInfo_step2";
	}
	@RequestMapping(value = "/drop_member")
	public String drop_member() {
		return "/mypage/afterLogin/drop_member";
	}
	
	@RequestMapping(value = "/drop_member2")
	public String drop_member2() {
		return "/mypage/afterLogin/drop_member2";
	}
	
	@RequestMapping(value = "/admin/home")
	public String admin2Home() {
		return "/admin/adminHome";
	}
	
	
	
	
}
