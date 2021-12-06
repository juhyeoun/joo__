package com.mrpizzahut.app.buket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.mrpizzahut.app.utillService;

import Daos.buketDao;

@Service
public class buketService {
	
	
	@Autowired
	private buketDao buketDao;
	@Autowired
	private HttpSession session;
	public void deleteBuket(String email) {
		System.out.println("deleteBuket");
		//buketDao.deleteByEmail(email);
	}
	public boolean getCartByEmail(String email,Model model) {
		System.out.println("getCartByEmail");
		// email 변수 데이터 출력해서 값 담긴 여부 확인
		System.out.println(email);
		List<Map<String, Object>>maps=buketDao.findByEmail(email);
		// map null인지 체크, null이라면 dao와 mapper, db봐야함
		System.out.println(maps);
		if(maps.isEmpty()) {
			return true;
		}
		int totalPrice=0;
		for(Map<String, Object>map:maps) {
			System.out.println("조회 "+map.toString());
        	Map<String, Object>product=buketDao.findByPizzaName(map);
        	System.out.println("결과 "+product.toString());
			int countAndPrice=Integer.parseInt(product.get("PRICE").toString().replace(",", ""))*Integer.parseInt(map.get("CCOUNT").toString());
			map.put("img", product.get("IMG"));
			map.put("price", countAndPrice);
			totalPrice+=countAndPrice;
		}
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("maps",maps);
		return false;
	}
	public JSONObject changeCount(JSONObject jsonObject,HttpServletRequest request) {
		System.out.println("changeCount");
		System.out.println(jsonObject);
		String email=utillService.getEmail(request);
		int bid=Integer.parseInt(jsonObject.get("bid").toString());
		Map<String, Object>map=Optional.ofNullable(buketDao.findByBid(bid)).orElseThrow(()->utillService.makeRuntimeEX("존재하지 않는 장바구니 품목입니다", "changeCount"));
		System.out.println("장바구니 조회결과" +map.toString());
		String dbEmail=(String)map.get("CEMAIL");
		int num=Integer.parseInt(jsonObject.get("num").toString());
		if(!dbEmail.equals(email)) {
			throw utillService.makeRuntimeEX("장바구니 이메일 불일치", "changeCount");
		}/*else if(num!=1||num!=1) {
			throw utillService.makeRuntimeEX("카운트 수량을 조작하였습니다", "changeCount");
		}*/
		Map<String, Object>product=Optional.ofNullable(buketDao.findPriceByProduct(map)).orElseThrow(()->utillService.makeRuntimeEX("존재하지 않는 상품발견", "changeCount"));
		System.out.println("상품의 현재 상태 "+product.toString());
		int menuCount=Integer.parseInt(product.get("MCOUNT").toString());
		int dbCount=Integer.parseInt(map.get("CCOUNT").toString());
		dbCount +=num;
		if(menuCount<dbCount) {
			throw utillService.makeRuntimeEX("재고가 부족합니다 남은재고 "+menuCount, "changeCount");
		}
		int menuPrice=Integer.parseInt(product.get("PRICE").toString().replace(",", ""));
		if(dbCount<=0) {
			buketDao.deleteById(bid);
			return utillService.makeJson(false, "0");
		}else {
			map.put("count", dbCount);
			map.put("bid", bid);
			buketDao.updateCount(map);
		}
	
		JSONObject response=new JSONObject();
		response.put("flag", true);
		response.put("count", dbCount);
		response.put("price", dbCount*menuPrice);
		return response;
	}
	@Transactional(rollbackFor = Exception.class)
	public JSONObject deleteCart(deleteCartDto dto,String loginEmail) {
		System.out.println("deleteCart");
		List<Map<String, Object>>maps=new ArrayList<Map<String,Object>>();
		List<Integer>integers=dto.getArr();
		for(int i:integers) {
			Map<String, Object>map=Optional.ofNullable(buketDao.findByBid(i)).orElseThrow(()->utillService.makeRuntimeEX("장바구니에 물건이 존재하지 않습니다", "deleteCart"));
			maps.add(map);
		}
		for(Map<String, Object>map:maps) {
			String dbemail=(String)map.get("CEMAIL");
			if(!dbemail.equals(loginEmail)) {
				throw utillService.makeRuntimeEX("장바구니 이메일이 일치하지 않습니다", "deleteCart");
			}
			int cnum=Integer.parseInt(map.get("CNUM").toString());
			System.out.println("장바구니 삭제번호 "+cnum);
			buketDao.deleteById(cnum);
		}
		return utillService.makeJson(true,"장바구니삭제");
		
	}
	public void totalPriceAndUser(String email,Model model) {
		System.out.println("totalPriceAndUser");
		System.out.println(email);
		Map<String, Object>map=Optional.ofNullable(buketDao.findUser(email)).orElseThrow(()->utillService.makeRuntimeEX("존재하지 않는 회원입니다", "totalPriceAndUser"));
		System.out.println(map + "이게뭔지알려줘");
		String name = (String) map.get("NAME");
		System.out.println(name);
		String mobile = (String) map.get("MOBILE");
		String addr = (String) map.get("ADDR");
		map.put("name", name);
		map.put("mobile", mobile);
		map.put("addr", addr);
//		String mobile=map.get("MOBILE").toString();
//		map.put("MOBILE1", mobile.substring(0, 3));
//		map.put("MOBILE2", mobile.substring(3, 7));
//		map.put("MOBILE3", mobile.substring(7, 11));
		model.addAttribute("user", map);
		getCartByEmail(email, model);

	}
	public JSONObject insertCart(JSONObject jsonObject, HttpServletRequest request) {
	      System.out.println("insertCart");

	      String email = (String) session.getAttribute("email");
	      String productName = jsonObject.get("productName").toString();
	      String edge = jsonObject.get("edge").toString();
	      String size = jsonObject.get("size").toString();
	      int count = Integer.parseInt(jsonObject.get("count").toString());

	      // 제품 조회
	      Map<String, Object> map = new HashMap<String, Object>();
	      map.put("productName", productName);
	      map.put("edge", edge);
	      map.put("size", size);
	      map.put("count", count);
	      Map<String, Object> product = buketDao.findByProductNameAndSizeAndEdge(map);
	      System.out.println("제품 조회 정보 " + productName.toString());
	      // product==null이면 팔지 않는 제품이니 에러처리를 하든 맘대로

	      // 수량이 남아있는지 검사 부족하다면 에러처리를 하든 맘대로
	      map.put("count", count);
	      map.put("email", email);
	      
	     
	         buketDao.insertcart(map);
	      
	         JSONObject respon = new JSONObject();
	      respon.put("flag", true);
	      respon.put("message", "장바구니 저장 성공");
	      return respon;

	   }
}
