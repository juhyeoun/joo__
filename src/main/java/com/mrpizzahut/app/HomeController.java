package com.mrpizzahut.app;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

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
import com.mrpizzahut.app.member.service.IMemberService;
import com.mrpizzahut.app.member.service.MemberServiceImpl;
import com.mrpizzahut.app.order.OrderDTO;

import Daos.EventDAO;
import Daos.IMemberDAO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private IMemberDAO dao;
	@Autowired
	private IMemberService service;
	@Autowired
	private EventDAO eventDao;
	
	
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
			System.out.println(email + "이거 뭐라고찍히죠?");
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
	@RequestMapping(value = "/myQnaList")
	public String myQnaList() {
		return "/mypage/afterLogin/myQnaList";
	}
	@RequestMapping(value = "/qnaplz")
	public String qnaplz() {
		return "/mypage/afterLogin/qnaplz";
	}
	@RequestMapping(value = "/orderList")
	public String orderList(HttpServletRequest request,HttpServletResponse response,Model model, MemberDTO member) {
		
			
			ArrayList<OrderDTO> orderList = service.orderList();
			model.addAttribute("orderList", orderList);
			System.out.println(orderList);
			return "/orderPages/orderList";
		} 
	
	@RequestMapping(value = "/event_on")
	   public String event_on(HttpServletRequest request,HttpServletResponse response,Model model) {
	      System.out.println("event_on");
	      String eTitle = request.getParameter("eTitle");
	      System.out.println(eTitle);
	      List<Map<String, Object>>eventList=eventDao.showList();
	      System.out.println(eventList.toString());
	      model.addAttribute("eventList", eventList);
	      return "/event/event_on";
	   }
	   @RequestMapping(value = "/event_view")
	   public String event_view(HttpServletRequest request,HttpServletResponse response,Model model) {
	      System.out.println("event_view");
	      String eTitle = request.getParameter("eTitle");
	      List<Map<String, Object>>event=eventDao.selectOne(eTitle);
	      System.out.println(event.toString());
	      model.addAttribute("event", event);
	      return "/event/event_view";
	   }
	
	
	
}
