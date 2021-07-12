package com.weis.startfun.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.weis.startfun.admin.model.ReportVO;
import com.weis.startfun.admin.service.AdminService;
import com.weis.startfun.project.model.ProjectVO;
import com.weis.startfun.utils.Criteria;
import com.weis.startfun.utils.PageDTO;

@Controller
@RequestMapping("/admin")
public class AdminProjectController {
	
	@Autowired
	private AdminService adservice;
	
	// 관리자 로그인 페이지
	@RequestMapping(value="/login.do", method =RequestMethod.GET)
	public String loginPage() {
		return "/admin/admin";
	}
	
	//신청프로젝트 페이징+검색
	@RequestMapping("/requestProjectList.do")
	public String requestProjectList(Criteria cri, Model model) {
	
		List<ProjectVO> list = adservice.getRequestPaging(cri);
		model.addAttribute("requestList",list);
		
		int count = adservice.searchRequestTotal(cri);
		PageDTO pagedto = new PageDTO(cri, count);
		
		model.addAttribute("pageMaker",pagedto);
		model.addAttribute("count",count);
		
		return "admin/requestProjectList";
		
	}
	
	//승인프로젝트 페이징+검색
	@RequestMapping("/permitProjectList.do")
	public String permitProjectList(Criteria cri, Model model) {
		
		List<ProjectVO> list = adservice.getPermitPaging(cri);
		model.addAttribute("permitList",list);
		
		int count = adservice.searchPermitTotal(cri);
		PageDTO pagedto = new PageDTO(cri, count);
		
		model.addAttribute("pageMaker",pagedto);
		model.addAttribute("count",count);
		
		return "admin/permitProjectList";		
	}
	
	//신고내역 리스트
	@RequestMapping("/reportList.do")
	public String report_List(@RequestParam(defaultValue="0") int project_no,Criteria cri, Model model) {
		
		List<ReportVO> list = adservice.reportList(project_no);
		model.addAttribute("reportList",list);
		model.addAttribute("cri",cri);
		
		return "admin/reportList";
	}
	
	//신고건수
	@RequestMapping("/countReport.do")
	public String countReport(@RequestParam(defaultValue="0") int project_no, Model model) {
		
		int reportCount = adservice.countReport(project_no);
		model.addAttribute("reportCount",reportCount);
		
		return "admin/countReport";
	}
	
	//정산 상세내역
	@RequestMapping(value="/payDetail.do", produces = "text/json; charset=utf-8", method = RequestMethod.GET)
	public String payDetail(
			@RequestParam(defaultValue="0") int project_no,Criteria cri ,Model model) {
		
		ProjectVO payDetail = adservice.payDetail(project_no);
		model.addAttribute("payDetail",payDetail);
		model.addAttribute("cri",cri);
		
		return "admin/payDetail";
	}
}
