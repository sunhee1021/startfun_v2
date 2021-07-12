package com.weis.startfun.member.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.weis.startfun.member.model.MemberVO;
import com.weis.startfun.member.service.JoinService;

@Controller
@RequestMapping("/startfun/joinus/")
public class JoinController {

	@Autowired
	private JoinService service;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	// 회원가입페이지
	@RequestMapping(value = "join.do", method = RequestMethod.GET)
	public String join() {

		return "joinus/register_View";
	}

	// 법인회원가입
	@RequestMapping(value = "companyregister.do", method = RequestMethod.GET)
	public String companyRegister(String member_email) {

		return "joinus/companyRegister";
	}

	@RequestMapping(value = "companyregister.do", method = RequestMethod.POST)
	public String companyJoin(MemberVO member) throws ClassNotFoundException, SQLException {
		System.out.println(member.toString());

		int result = 0;
		String viewpage = "";
		member.setMember_password(this.bCryptPasswordEncoder.encode(member.getMember_password()));
		result = service.companyInsertMember(member);
		result = service.insert_company_auth(member);

		System.out.println("result" + result);

		if (result > 0) {
			System.out.println("가입성공");
			viewpage = "redirect:/startfun/index.do";
		} else {
			System.out.println("가입실패");
			viewpage = "join.do";
		}

		return viewpage;

	}

	// 개인회원가입
	@RequestMapping(value = "register.do", method = RequestMethod.GET)
	public String userRegister(String member_email) {

		return "joinus/register";
	}

	@RequestMapping(value = "register.do", method = RequestMethod.POST)
	public String join(MemberVO member) throws ClassNotFoundException, SQLException {
		System.out.println(member.toString());

		int result = 0;
		String viewpage = "";
		member.setMember_password(this.bCryptPasswordEncoder.encode(member.getMember_password()));
		result = service.insertMember(member);
		result = service.insert_member_auth(member);

		System.out.println("result" + result);

		if (result > 0) {
			System.out.println("가입성공");
			viewpage = "redirect:/startfun/index.do";
		} else {
			System.out.println("가입실패");
			viewpage = "join.do";
		}

		return viewpage;

	}

	// 중복체크
	@RequestMapping(value = "idcheck.do", method = RequestMethod.POST)
	public void idcheck(@RequestParam("member_email") String member_email, HttpServletResponse response) {
		System.out.println("email" + member_email);
		ObjectMapper mapper = new ObjectMapper();
		int result = service.idCheck(member_email);
		try {
			response.getWriter().print(mapper.writeValueAsString(result));
		} catch (Exception e) {

		}
	}

	// 중복체크
	@RequestMapping(value = "companyIdCheck.do", method = RequestMethod.POST)
	public void companyIdCheck(@RequestParam("member_email") String company_email, HttpServletResponse response) {
		System.out.println("email" + company_email);
		ObjectMapper mapper = new ObjectMapper();
		int result = service.companyIdCheck(company_email);
		try {
			response.getWriter().print(mapper.writeValueAsString(result));
		} catch (Exception e) {

		}
	}

}
