package com.weis.startfun.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.weis.startfun.admin.service.AdminMemberService;
import com.weis.startfun.member.model.MemberVO;
import com.weis.startfun.project.model.ProjectVO;
import com.weis.startfun.utils.Criteria;
import com.weis.startfun.utils.PageDTO;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/admin")
public class AdminMemberController {

	@Autowired
	private AdminMemberService service;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	// 관리자 메인
	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String adminMain(HttpServletRequest request, Criteria cri) {
		int result = service.getUserCount();
		request.setAttribute("count", result);

		int resultcom = service.getCompanyCount();
		request.setAttribute("companycount", resultcom);

		int projectResult = service.totalListCount();
		request.setAttribute("projectResult", projectResult);

		int chartInvest = service.chartInvest();
		request.setAttribute("chartInvest", chartInvest);

		int chartSupport = service.chartSupport();
		request.setAttribute("chartSupport", chartSupport);

		cri.setStartNum((cri.getPageNum() - 1) * cri.getAmount());
		List<ProjectVO> list = service.mainProject(cri);
		request.setAttribute("projectList", list);
		return "admin/adminMain";
	}

	// 관리자 개인회원 리스트
	@RequestMapping(value = "/user.do", method = RequestMethod.GET)
	public String adminUser(Criteria cri, Model model) {
		cri.setStartNum((cri.getPageNum() - 1) * cri.getAmount());

		List<MemberVO> list = service.userList(cri);
		int count = service.getUserCount();
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", new PageDTO(cri, count));
		model.addAttribute("count", count);

		return "admin/userList";
	}

	// 관리자 개인회원 상세
	@RequestMapping(value = "/userEdit.do", method = RequestMethod.GET)
	public String getUserList(@RequestParam("member_email") String email, Model model) {
		MemberVO vo = service.getUserList(email);
		model.addAttribute("list", vo);

		return "admin/userEdit";
	}

	// 관리자 개인회원 수정
	@RequestMapping(value = "/userEdit.do", method = RequestMethod.POST)
	public String userEdit(MemberVO vo, HttpServletRequest request) {

		if(vo.getMember_password() != null) {
			vo.setMember_password(bCryptPasswordEncoder.encode(vo.getMember_password()));
		}
		return service.userEdit(vo, request);
	}

	// 관리자 법인회원 리스트
	@RequestMapping(value = "/companyUser.do", method = RequestMethod.GET)
	public String adminCompany(Criteria cri, Model model) {
		cri.setStartNum((cri.getPageNum() - 1) * cri.getAmount());
		List<MemberVO> list = service.companyList(cri);
		int count = service.getCompanyCount();
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", new PageDTO(cri, count));
		model.addAttribute("count", count);

		return "admin/companyList";
	}

	// 관리자 법인회원 상세
	@RequestMapping(value = "/companyEdit.do", method = RequestMethod.GET)
	public String getCompanyList(@RequestParam("member_email") String email, Model model) {
		MemberVO vo = service.getCompanyList(email);
		model.addAttribute("list", vo);

		return "admin/companyEdit";
	}

	// 관리자 법인회원 수정
	@RequestMapping(value = "/companyEdit.do", method = RequestMethod.POST)
	public String companyEdit(MemberVO vo, HttpServletRequest request) {

		if(vo.getMember_password() != null) {
			vo.setMember_password(bCryptPasswordEncoder.encode(vo.getMember_password()));
		}
		return service.updateCompany(vo, request);
	}

	// 개인회원 검색(이메일)
	@RequestMapping(value = "/searchUser.do", method = RequestMethod.POST)
	public void searchUser(@RequestParam("member_email") String email, HttpServletResponse response)
			throws IOException {
		List<MemberVO> vo = new ArrayList<MemberVO>();
		vo = service.searchUser(email);
		JSONArray array = JSONArray.fromObject(vo);
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(array);
	}

	// 개인회원 검색(이름)
	@RequestMapping(value = "/searchUserName.do", method = RequestMethod.POST)
	public void searchUserName(@RequestParam("member_name") String name, HttpServletResponse response)
			throws IOException {
		List<MemberVO> vo = new ArrayList<MemberVO>();
		vo = service.searchUserName(name);
		JSONArray array = JSONArray.fromObject(vo);
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(array);
	}

	// 법인회원 검색(이메일)
	@RequestMapping(value = "/searchCompany.do", method = RequestMethod.POST)
	public void searchCompany(@RequestParam("company_email") String email, HttpServletResponse response)
			throws IOException {
		List<MemberVO> vo = new ArrayList<MemberVO>();
		vo = service.searchCompany(email);

		JSONArray array = JSONArray.fromObject(vo);
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(array);
	}

	// 법인회원 검색(이름)
	@RequestMapping(value = "/searchCompanyName.do", method = RequestMethod.POST)
	public void searchCompanyName(@RequestParam("company_name") String name, HttpServletResponse response)
			throws IOException {
		List<MemberVO> vo = new ArrayList<MemberVO>();
		vo = service.searchCompanyName(name);

		JSONArray array = JSONArray.fromObject(vo);
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(array);
	}

	// 중복체크
	@RequestMapping(value = "idcheck.do", method = RequestMethod.POST)
	public void idcheck(@RequestParam("member_email") String member_email, HttpServletResponse response) {
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
		ObjectMapper mapper = new ObjectMapper();
		int result = service.companyIdCheck(company_email);
		try {
			response.getWriter().print(mapper.writeValueAsString(result));
		} catch (Exception e) {

		}
	}

}
