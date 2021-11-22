package com.mrpizzahut.app.member.controller;

import java.util.Map;

import org.slf4j.Logger; import org.slf4j.LoggerFactory; import
org.springframework.beans.factory.annotation.Autowired; import
org.springframework.web.bind.annotation.RequestBody; import
org.springframework.web.bind.annotation.RequestMapping; import
org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.mrpizzahut.app.member.service.MailService;



@RestController 
public class MailController { 
	  private final static Logger logger = LoggerFactory.getLogger(MailController.class);

	  @Autowired MailService service;
	  
	  @RequestMapping(value = "/sendAuth", produces = "application/json; charset=utf-8") 
	  public Map<String, String> sendAuth(@RequestBody Map<String, String> map) { 
		  logger.warn("email : "+map.get("email")); 
		  logger.warn("name : "+map.get("name")); 
		  String name = map.get("name");
		  String email = map.get("email"); 
		  
		  
		  if(email != "" || email != "" || name != null || name != null) {
				service.sendAuth(name, email);
		  }else {
			  map.put("msg", "빈칸을 확인하세요");
		  }
		  map.put("msg", "이메일에서 인증번호를 확인하세요."); 
		  return map; 
	  }

	  @RequestMapping(value = "/sendConfirm", produces = "application/json; charset=utf-8") 
	  public Map<String, String> sendConfirm(@RequestBody Map<String, String> map) { 
		  logger.warn("authNum : "+ map.get("authNum")); 
		  String authNum = map.get("authNum");
		  map.put("msg", service.sendConfirm(authNum));
		  return map; 
	  }

}