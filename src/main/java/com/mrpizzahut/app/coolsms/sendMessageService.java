package com.mrpizzahut.app.coolsms;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;

import com.mrpizzahut.app.member.dao.IMemberDAO;
import com.mrpizzahut.app.member.dto.MemberDTO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class sendMessageService {
	@Autowired IMemberDAO dao;
	 private static final String apikey="NCSGOMUMFKHSINXI";//키받고 교체
	 private static final  String apiSecret="UVC0HVLS1HNX3PUQ7U6C0HFX0ATC5FXQ";//시크릿키받고교체
	 private static final String companyPhone="01053719495";// 김준영  계정이여서 김준영 번호로만 발송가능 번호인증후 주현님번호로 교체
    
	 /**
	  * 문자전송
	  * @methodname sendMessage
	  * @param phone 수신번호
	  * @param text  전송내용
	  * @return 0: 전송성공
	  * 	   -1: 전송실패 
	  */
	public static int sendMessage(String phone,String text) {
		 System.out.println("sms요청");   
	   
	       
	        Message coolsms = new Message(apikey, apiSecret);
	        HashMap<String, String> params = new HashMap<String, String>();
	        params.put("to", phone);//받는사람
	        params.put("from", companyPhone);///보내는 번호
	        params.put("type", "SMS");//건들지 마시오
	        params.put("text", text);///보낼내용
	        try {
	            coolsms.send(params);
	            System.out.println("문자 전송 완료");
	            return 0;
	        } catch (CoolsmsException e) {
	        	System.out.println("문자 전송실패");
	            return -1;
	        }
	}
	
	
}
