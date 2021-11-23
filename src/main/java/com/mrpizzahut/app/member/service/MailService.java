package com.mrpizzahut.app.member.service;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.mrpizzahut.app.member.dto.MemberDTO;

import Daos.IMemberDAO;

@Service
public class MailService {
	@Autowired private JavaMailSender mailSender;
	@Autowired HttpSession session;
	@Autowired IMemberDAO dao;
	@Autowired MailService service;
	
    public void sendMail(String to, String subject, String body) {
    	System.out.println("sendmail");
		MimeMessage message = mailSender.createMimeMessage();
		try {
		    MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"UTF-8");
		    messageHelper.setSubject(subject);//제목
		    messageHelper.setTo(to); // 수신자
		    messageHelper.setText(body);//내용
		    mailSender.send(message);
		}catch(Exception e) {
		    e.printStackTrace();
		}
		System.out.println("이메일 전송성공");
    }
    
    public void sendAuth(String name, String email) {
    	
    	//이메일이 회원가입이 되어있나  검사 dao검사
    	System.out.println("오셨나요?");
    	System.out.println(name + email);
    	MemberDTO member = new MemberDTO();
    	member.setName(name);
    	member.setEmail(email);
    	MemberDTO m = dao.findPw(member);
    	System.out.println(m.getName());
    	System.out.println(m.getEmail());
		String authNum = (String)session.getAttribute("authNum");
		if(m.getEmail()!=null) {
			System.out.println(m.getName() + "여기오셨슴?");
				System.out.println("여기는요??");
				Random r = new Random();
				System.out.println("객채생성");
				authNum = String.format("%06d", r.nextInt(1000000));
				service.sendMail(email, "[인증번호]", authNum);
				session.setAttribute("authNum", authNum);
				session.setAttribute("email", email);
				session.setMaxInactiveInterval(180);
		}
	}
   

	public String sendConfirm(String authNum) {
		String sessionAuthNum = (String) session.getAttribute("authNum");
		String email = (String) session.getAttribute("email");
		
		System.out.println("원번호"+sessionAuthNum);
		System.out.println("제출 "+authNum);
		if(sessionAuthNum == null) {
			return "인증번호를 생성하세요";
//			return 0;
		}
		if(sessionAuthNum.equals(authNum)) {
			String num = null;
			session.setAttribute("authState", true);
			//update 임시비밀번호
			Random r = new Random();
			num = String.format("%06d", r.nextInt(1000000));
			MemberDTO member = new MemberDTO();
			member.setEmail(email);
			BCryptPasswordEncoder bpe = new BCryptPasswordEncoder();
			String securePw = bpe.encode(num);
			member.setPw(securePw);
			dao.updatePw(member);
		
			System.out.println(num);
		
			sendMail(email, "[변경된 비밀번호]", num);
			
			return "이메일전송완료";
//			return 1;
		}
		return "인증 실패";
//		return 0;
	}

	
	
}
