package com.weis.startfun.project.controller;

import java.security.Principal;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.weis.startfun.admin.model.ReportVO;
import com.weis.startfun.member.model.FollowingVO;
import com.weis.startfun.member.model.WishVO;
import com.weis.startfun.project.model.InvestVO;
import com.weis.startfun.project.model.JoinInvestVO;
import com.weis.startfun.project.model.ProjectVO;
import com.weis.startfun.project.service.JoinInvestService;
import com.weis.startfun.project.service.JoinSupportService;
import com.weis.startfun.utils.Criteria;
import com.weis.startfun.utils.PageDTO;

/*    
설 명 : JoinInvest Controller 
작성일 : 2021.06.08
작성자 : 이보희 
*/
@Controller
@RequestMapping("/startfun/")
public class JoinInvestController {

	@Autowired
	private JoinInvestService joinInvestService;
	
	@Autowired
	private JoinSupportService joinSupportService;

	//투자형 프로젝트 리스트
	@RequestMapping("investList.do") 
	public String getInvestList(String listSort, Criteria cri, Model model)throws ClassNotFoundException, SQLException {
		
		cri.setStartNum((cri.getPageNum()-1)*cri.getAmount());	//시작번호 정해주기
		
		List<ProjectVO> List = joinInvestService.getInvestList(cri); //리스트
		int projectCount = joinInvestService.getProjectCount(cri); //총 프로젝트 수
		
		model.addAttribute("List", List);
		model.addAttribute("type", "투자");
		model.addAttribute("pageMaker", new PageDTO(cri, projectCount));
		
		return "project/projectList";
	}
	
	//투자형 프로젝트 상세페이지
	@RequestMapping("investDetail.do")
	public String investDetail(int project_no, Model model, Principal principal) {
		//상세상단내용
		ProjectVO investDetailTop = joinInvestService.getInvestDetailTop(project_no);
		//증권발행조건
		InvestVO checkBond = joinInvestService.checkBond(project_no);
		
		//팔로우여부
		ProjectVO projectEmail = joinSupportService.searchEmail(project_no);
		FollowingVO follow = new FollowingVO();
		follow.setTo_user(projectEmail.getProject_email());
		
 		if(principal != null) {
			follow.setFrom_user(principal.getName());
		}else {
			follow.setFrom_user("any");
		}
 		FollowingVO following = joinSupportService.searchFollowing_no(follow);
 		
 		//관심설정여부
 		WishVO wishVO = new WishVO(); 
 		wishVO.setProject_no(project_no);
 		
 		if(principal != null) {
			wishVO.setEmail(principal.getName());
		}else {
			wishVO.setEmail("any");
		}
 		WishVO wish = joinSupportService.searchWish_no(wishVO);
 		
 		//신고프로젝트 여부
 		ReportVO report = new ReportVO(); 
 		report.setProject_no(project_no);
 		
 		if(principal != null) {
 			report.setReport_email(principal.getName());
		}else {
			report.setReport_email("any");
		}
 		ReportVO report_no = joinSupportService.checkReport(report);
 		
		model.addAttribute("investDetailTop", investDetailTop);
		model.addAttribute("checkBond", checkBond);
		model.addAttribute("following", following); 
 		model.addAttribute("wish", wish); 
 		model.addAttribute("report_no", report_no); 
 		
		return "project/investDetail";
	}
	
	//신고하기
	@RequestMapping(value = "investReport.do", method = RequestMethod.POST)
	public String investReport(ReportVO reportVO, Principal principal) {
		String url = null;

		try {
			url = joinInvestService.investReport(reportVO, principal);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return url;
	}
	
	//투자하기(투자내용 및 한도)
	@RequestMapping(value = "joinInvest.do", method = RequestMethod.GET)
	public String joinSupport(int project_no, Model model, Principal principal) {
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		String url = "";
		
		if(principal == null) {
			model.addAttribute("msg", "로그인 후 투자가능합니다.");
			model.addAttribute("url", "login/login.do");
			url = "project/redirect";
		}else {
			map.put("sponsor_email", principal.getName());
			map.put("project_no", project_no);
			
			ProjectVO investInfo = joinInvestService.getInvestInfo(map);
			model.addAttribute("investInfo", investInfo);
			url = "project/joinInvest";
		}
		
		return url;
	}

	//투자하기 처리
	@RequestMapping(value = "joinInvest.do", method = RequestMethod.POST)
	public String joinSupport(JoinInvestVO joinInvestVO, Principal principal) {

		String url = null;

		try {
			url = joinInvestService.joinInvest(joinInvestVO, principal);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return url;
	}
	

	//펀딩 완료(후원/투자)
	@RequestMapping("completeInvestJoin.do") 
	public String completeJoin(int invest_no, Model model) {
				
		model.addAttribute("type", "invest");
		
		return "project/completeJoin";
	}

}
