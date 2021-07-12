package com.weis.startfun.member.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.weis.startfun.member.model.MemberVO;
import com.weis.startfun.member.service.JoinService;

@Controller
@RequestMapping("/startfun/")
public class LoginController {

	@Autowired
	private JoinService service;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@RequestMapping(value="login.do", method=RequestMethod.GET)
	public String login() {
		return "login/login";
	}
	
	//아이디 찾기 화면
	@RequestMapping(value = "searchId.do", method = RequestMethod.GET)
	public String searchID() {
		return "login/searchId";
	}
	
	//아이디 찾기 - 가입정보확인
	@RequestMapping(value = "searchUserInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public int searchUserInfo(@RequestParam String member_name, @RequestParam String member_phone, HttpServletResponse response) {
		int result = service.searchUserInfo(member_name, member_phone);
		return result;
	}
	
	//아이디 찾기
	@RequestMapping(value = "searchId.do", method = RequestMethod.POST)
	public String searchId(MemberVO membervo, Model model) {

		MemberVO member = service.searchId(membervo);
		model.addAttribute("member", member);

		return "login/searchIdOk";
	}
	
	//비밀번호 찾기
	@RequestMapping(value="forgotpassword.do", method=RequestMethod.GET)
	public String findPassword() {
		
		return "login/forgotPassword";
	}
	
	//비밀번호 찾기
	@RequestMapping(value="forgotpassword.do", method=RequestMethod.POST)
	@ResponseBody
	public String forgotPassword(String member_email, HttpServletResponse response) {
		
		int result = service.forgotPassword(member_email);
		String resultmsg = "<script>alert('인증메일이 발송되었습니다. 이메일을 확인해주세요.'); location.href='/startfun/index.do';</script>";
		
		return resultmsg;
	}
	
	//이메일 확인
	@RequestMapping(value="passwordConfirm.do", method=RequestMethod.GET)
	public String confirmPassword(String email, String key) {
		
		String url = service.confirmPassword(email, key);
		return url;
	}
	
	//비밀번호 바꾸기
	@RequestMapping(value="passwordChange.do", method=RequestMethod.POST)
	public String updatePassword(String member_email, String member_password) {
		
		member_password = bCryptPasswordEncoder.encode(member_password);
		String url = service.updatePassword(member_email, member_password);
		
		return url;
	}

}
