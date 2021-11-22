package com.mrpizzahut.app.config;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.springframework.context.annotation.Configuration;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Configuration
public class KakaoConfig {
	
	
	//https://developers.kakao.com/docs/latest/ko/kakaologin/rest-api#refresh-token
	public String getAccessToken (String code) {
		String accessToken = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		try {
			String sendMessage = "grant_type=authorization_code" 
					+ "&client_id=c0b47f93e344126c581f8f273799a792"
					+"&redirect_uri=http://localhost:8085/app/kakaoLogin" 
					+ "&code=" + code;
		
			URL url = new URL(reqURL); // POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("POST"); //POST 요청을 위해 기본값 false에서 setDoOutput을 true로 변경
			conn.setDoOutput(true);
			
			// 기본 outputStream을 통해 문자열로 처리할 수 있는 OutPutStreamWriter 변환 후 처리속도를 빠르게 하기위한
			// BufferedWriter로 변환해서 사용한다.
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			bw.write(sendMessage); 
			bw.flush();
			
			int responseCode = conn.getResponseCode(); // 결과 코드가 200이라면 성공
			System.out.println("responseCode : " + responseCode);
			
			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "", result = "";
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
			System.out.println("result.split : "+result.split(","));
			
			//Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonParser parser = new JsonParser(); 
			JsonElement element = parser.parse(result);
			accessToken = element.getAsJsonObject().get("access_token").getAsString();
			System.out.println("access_token : " + accessToken);
			
			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		} 
		return accessToken;
	}
	
	//https://developers.kakao.com/docs/latest/ko/kakaologin/rest-api#req-user-info
	public HashMap<String, Object> getUserInfo (String accessToken) {
	    HashMap<String, Object> userInfo = new HashMap<String, Object>();
	    String reqURL = "https://kapi.kakao.com/v2/user/me";
	    
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        
	        // 요청에 필요한 Header에 포함될 내용
	        conn.setRequestProperty("Authorization", "Bearer " + accessToken);
	        
	        
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        String line = "";
	        String result = "";
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        System.out.println("response body : " + result);
	        
	        JsonParser parser = new JsonParser();
	        JsonElement element = parser.parse(result);
	        JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	        String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	        userInfo.put("nickname", nickname);
	        
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    return userInfo;
	}
	
	 // https://developers.kakao.com/docs/latest/ko/kakaologin/rest-api#logout
	public void logout(String accessToken) {
	    String reqURL = "https://kapi.kakao.com/v1/user/logout";
	    
	    try {
	        URL url = new URL(reqURL); // URL 객체 생성
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection(); 
	        conn.setRequestMethod("POST"); // 메소드 설정
	        
	        // 요청 정보 헤더에 담기.
	        conn.setRequestProperty("Authorization", "Bearer " + accessToken);
	        // 응답 코드 확인
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);
	    }catch (Exception e) {
			e.printStackTrace();
		}
	}
}
