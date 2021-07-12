package com.weis.startfun.main.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.weis.startfun.member.model.WishVO;
import com.weis.startfun.member.service.MyPageService;
import com.weis.startfun.project.model.ProjectVO;
import com.weis.startfun.project.service.ProjectService;
import com.weis.startfun.utils.Criteria;

@Controller
@RequestMapping("/startfun/")
public class IndexController {

	@Autowired
	private ProjectService service;
	
	@Autowired
	private MyPageService mypageService;
	
	@RequestMapping("/index.do")
	public String index(Model model, Principal principal) {
		
		
		Criteria cri = new Criteria(1, 4);
		cri.setStartNum((cri.getPageNum()-1)*cri.getAmount());
		cri.setStatus("진행중");	//메인은 진행중인 프로젝트만 보여준다
		
		/////////////인기 프로젝트/////////////
		cri.setListSort("sponsor_count");	//참여자수 정렬
		
		//인기프로젝트 - 후원형
		cri.setType("후원");	//후원형만 받아오기
		List<ProjectVO> sponsorSortSupport = service.getProjectSearcList(cri);
		model.addAttribute("sponsorSortSupport", sponsorSortSupport);
		//인기프로젝트 - 투자형
		cri.setType("투자"); // 투자형만 받아오기
		List<ProjectVO> sponsorSortInvest = service.getProjectSearcList(cri);
		model.addAttribute("sponsorSortInvest", sponsorSortInvest);
		
		
		
		/////////////신규 프로젝트/////////////
		cri.setListSort("project_start");	//시작순 정렬
		
		//신규프로젝트 - 후원형
		cri.setType("후원");	//후원형만 받아오기
		List<ProjectVO> startSortSupport = service.getProjectSearcList(cri);
		model.addAttribute("startSortSupport", startSortSupport);
		// 신규프로젝트 - 투자형
		cri.setType("투자"); // 투자형만 받아오기
		List<ProjectVO> startSortInvest = service.getProjectSearcList(cri);
		model.addAttribute("startSortInvest", startSortInvest);
		
		
		/////////////인기프로젝트/////////////
		cri.setStatus("승인");
		cri.setType(null);	//후원 & 투자 한꺼번에 받아옴
		List<ProjectVO> commingsoonProject = service.getProjectSearcList(cri);
		model.addAttribute("commingsoonProject", commingsoonProject);
		
		
		////////////관심프로젝트리스트 가져오기/////////////
		if(principal != null) {		//로그인한 상태면 wish 리스트 가져온다
			List<WishVO> wishList = mypageService.getWishList(principal.getName());
			model.addAttribute("wishList", wishList);
		}
		
		return "index";
	}
}
