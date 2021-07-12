package com.weis.startfun.member.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.weis.startfun.member.service.JoinService;

@RestController
public class SnsLoginController {

	@Autowired
	private JoinService service;
	
	@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public String login() {
		return "login/login";
	}

	@RequestMapping(value = "/kakao/login.do", method = RequestMethod.POST)
	public Map<String, Object> kakaoLoginPro(@RequestParam Map<String,Object> paramMap, HttpSession session) throws SQLException, Exception {
		System.out.println("paramMap:" + paramMap);
		String email = String.valueOf(paramMap.get("email"));
		System.out.println(email);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		int kakaoConnectionCheck = service.idCheck(email);
		if(kakaoConnectionCheck == 0) { //일치하는 이메일 없으면 가입
			resultMap.put("JavaData", "register");
//		}else if(kakaoConnectionCheck == 1) { //이메일 가입 되어있고 카카오 연동 안되어 있을시
//			System.out.println("일반회원");
//			userservice.setKakaoConnection(paramMap);
//			session.setAttribute("userInfo", loginCheck);
//			resultMap.put("JavaData", "YES");
		}else{
			session.setAttribute("userInfo", "login");
			resultMap.put("JavaData", "YES");
		}
		
		return resultMap;
	}

}
