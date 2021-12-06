package com.mrpizzahut.app;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mrpizzahut.app.buket.buketService;
import com.mrpizzahut.app.member.dto.MemberDTO;
import com.mrpizzahut.app.member.service.IMemberService;
import com.mrpizzahut.app.order.OrderDTO;
import com.mrpizzahut.app.order.orderService;
import com.mrpizzahut.app.pay.productService;
import com.mrpizzahut.app.pay.coupon.couponService;




@Controller
public class controller {

	@Autowired
	private buketService buketService;
	@Autowired
	private productService productService;
	@Autowired
	private couponService couponService;
	@Autowired
	private orderService orderService;
	@Autowired
	private HttpSession session;
	@Autowired
	private IMemberService memberService;
	
	
	@RequestMapping(value = "/buket", method = RequestMethod.GET)
	public String goBuket(HttpSession session, HttpServletRequest request,HttpServletResponse response,Model model) {
		System.out.println("goBuket: "+request.getSession().getAttribute("email"));
		try {
			if(buketService.getCartByEmail(request.getSession().getAttribute("email").toString(), model)) {
				return "/home";
			}
			return "/orderPages/buket";
		} catch (Exception e) {
			return "/home";
		}

	}
	@RequestMapping(value = "/pay", method = RequestMethod.GET)
	public String goPay(HttpSession session, HttpServletRequest request,HttpServletResponse response,Model model) {
		System.out.println("goPay");
		String email = (String) session.getAttribute("email");
		
		buketService.totalPriceAndUser(email, model);
	//	session.getAttribute("user");
		return "/orderPages/pay";
	}
	@RequestMapping(value = "/address", method = RequestMethod.GET)
	public String goAddress(HttpServletRequest request,HttpServletResponse response) {
		return "/orderPages/address";
	}
	@RequestMapping(value = "/donePay", method = RequestMethod.GET)
	public String donePay(HttpServletRequest request,HttpServletResponse response,Model model) {
		System.out.println("donePay");
		boolean flag=Boolean.parseBoolean(request.getParameter("flag"));
		String buykind=request.getParameter("buykind");
		if(flag) {
			System.out.println("결제성공");
			String productNames=request.getParameter("productNames");
			productNames=productNames.replace("%2C", ",");
			model.addAttribute("productNames",productNames);
			model.addAttribute("price", request.getParameter("price"));
			if(buykind.equals("vbank")) {
				System.out.println("가상계좌 이므로 추가");
				model.addAttribute("vbanknum", request.getParameter("vbanknum"));
				model.addAttribute("expireDate", request.getParameter("expireDate"));
			}
		}else {
			System.out.println("결제실패");
			model.addAttribute("message", request.getParameter("message"));
		}
		model.addAttribute("flag", flag);
		model.addAttribute("buykind", buykind);


		return"/orderPages/donePay";
	}
	@RequestMapping(value = "/admin/home",method =  RequestMethod.GET)
	public String goAdminMain(HttpServletRequest request,HttpServletResponse servletResponse) {
		System.out.println("goAdminMain");
		//request.getSession().setAttribute("email", "kim@kim.com");
		request.getSession().setAttribute("email", "admin@care.com");
		//request.getSession().setAttribute("role", "admin");
		request.getSession().setAttribute("role", "관리자");
		if(!utillService.checkRole(request)) {
			return "/home";
		}
		return "/admin/adminHome";
	}

	
//	@RequestMapping(value ="/admin/menu",method = RequestMethod.GET)
//	public String goAdminMenu(HttpServletRequest request,HttpServletResponse response,Model model) {
//		System.out.println("goAdminMenu");
//		if(!utillService.checkRole(request)) {
//			return "/home";
//		}
//		String scope=request.getParameter("scope");
//		if(scope.equals("메뉴등록")) {
//			return "/admin/adminMenu";
//		}else if(scope.equals("메뉴수정삭제")) {
//			productService.getAllProducts(request, model);
//			return "/admin/adminMenuUpdate";
//		}else {
//			productService.getByMnum(request, model);
//			return "/admin/adminMenuShow";
//		}
//	}
	
//	@RequestMapping(value ="/admin/adminMenu2")
//	public String adminMenu2(HttpServletRequest request,HttpServletResponse response,Model model) {
//		System.out.println("adminMenu2");
//		if(!utillService.checkRole(request)) {
//			return "/home";
//		}
//		return "/admin/adminMenu2";
//		
//	}
	@RequestMapping(value ="/admin/event",method = RequestMethod.GET)
	public String goAdminEvent(HttpServletRequest request, HttpServletResponse response,Model model) {
		System.out.println("goAdminEvent");
		if(!utillService.checkRole(request)) {
			return "/home";
		}
		String scope=request.getParameter("scope");
		if(scope.equals("쿠폰등록")) {
			return "/admin/insertCoupon";
		}else if(scope.equals("쿠폰수정삭제")) {
			couponService.getAllCoupon(request, response,model);
			return "/admin/updateCoupon";
		}else {
			couponService.getCoupon(request, model);
			return "/admin/showCoupon";
		}
	}
	@RequestMapping(value = "/admin/order",method = RequestMethod.GET)
	public String showOrders(HttpServletRequest request,HttpServletResponse response,Model model) {
		System.out.println("showOrders");
		String detail=request.getParameter("detail");
		if(detail.equals("all")) {
			orderService.getAllOrders(request, model);
			return "/admin/showOrders";
		}else {
			orderService.getOrder(request,model);
			return "/admin/showOrder";
		}

	}
	
	
	@RequestMapping(value = "/admin/sales",method = RequestMethod.GET)
	public String showSales(HttpServletRequest request,HttpServletResponse response,Model model) {
		System.out.println("showSales");
		orderService.getAllPrice(request, model);
		return "/admin/showPay";
	}
	
//	@RequestMapping(value = "admin/memberManage")
//	public String list(HttpServletRequest req, HttpServletResponse res, Model model) {
//		if(!utillService.checkRole(req)) {
//			return "/home";
//		}
//		System.out.println("왔니");
//		ArrayList<MemberDTO> list = memberService.list();
//		model.addAttribute("list", list);
//		System.out.println(list);
//		return "admin/memberManage";
//	}
	
	@RequestMapping(value = "/admin/showOrder2",method = RequestMethod.GET)
	public String showOrder2(HttpServletRequest request,HttpServletResponse response,Model model) {
		System.out.println("showOrder2");
		if(!utillService.checkRole(request)) {
			return "/home";
		}
		System.out.println("orderController");
		ArrayList<OrderDTO> orderList = memberService.orderList();
		model.addAttribute("orderList", orderList);
		System.out.println(orderList);
		
		return "/admin/showOrder2";
	}
	@RequestMapping(value = "/admin/insertEvent")
	public String insertEvent(HttpServletRequest request,HttpServletResponse response,Model model) {
		System.out.println("insertEvent");
		if(!utillService.checkRole(request)) {
			return "/home";
		}
		return "/admin/insertEvent";
	}
	
	@RequestMapping(value = "/admin/adminMenu")
	public String adminMenu(HttpServletRequest request,HttpServletResponse response,Model model) {
		System.out.println("menuList");
		if(!utillService.checkRole(request)) {
			return "/home";
		}
		return "/admin/adminMenu";
	}
	@RequestMapping(value = "/admin/menuList")
	public String menuList(HttpServletRequest request,HttpServletResponse response,Model model) {
		System.out.println("menuList");
		if(!utillService.checkRole(request)) {
			return "/home";
		}
		return "/admin/menuList";
	}
	@RequestMapping(value = "/admin/getEventList")
	public String getEvent(HttpServletRequest request,HttpServletResponse response,Model model) {
		System.out.println("getEventList");
		if(!utillService.checkRole(request)) {
			return "/home";
		}
		return "/admin/getEventList";
	}
	
	
	@RequestMapping(value = "/admin/searchCode", produces = "application/json; charset=utf-8", method = RequestMethod.POST)
	@ResponseBody
	public List<OrderDTO> searchCode(@RequestBody OrderDTO order, Model model) {
		System.out.println("searchCode");
		System.out.println(order);
		if(order == null) {
			return null;
		}
		OrderDTO o = new OrderDTO();
		o.setOmchttrdno(order.getOmchttrdno());
		
		
		return memberService.searchCodeProc(o);
	}

	
	@RequestMapping(value = "admin/adminDelete")
	public String adminDelete(HttpServletRequest req, HttpServletResponse res, Model model) {
		if(!utillService.checkRole(req)) {
			return "/home";
		}
		System.out.println("어드민딜리트");
		
		return "admin/adminDelete";
	}
	
	@RequestMapping(value = "/admin/adminMemberDelete")
	public String adminMemberDelete(String name, MemberDTO member, Model model) {
		System.out.println("못옴?");
		System.out.println(name);
		System.out.println(member);
		int result = memberService.adminMemberDelete(name, member);
		
		if(result == 0) {
			model.addAttribute("msg", "잘못입력하셨습니다");
			return "admin/adminDelete";
		}else {
			model.addAttribute("msg", "삭제되었습니다");
			return "admin/adminDelete";
		}
	}
	
	@RequestMapping(value = "/admin/adminUpdateMember", produces = "application/json; charset=utf-8", method = RequestMethod.POST)
	@ResponseBody
	public int adminUpdateMember(@RequestBody MemberDTO member) {
		System.out.println("adminUpdateController");
		System.out.println(member);
		int result = memberService.adminUpdateMember(member);
		return result;
	}

	
	
	

}
