package com.weis.startfun.project.controller;

import java.security.Principal;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.weis.startfun.chat.model.ChatRoomVO;
import com.weis.startfun.chat.service.ChatService;
import com.weis.startfun.member.model.MemberVO;
import com.weis.startfun.member.service.MyPageService;
import com.weis.startfun.project.model.InvestVO;
import com.weis.startfun.project.model.ProjectVO;
import com.weis.startfun.project.model.RewardVO;
import com.weis.startfun.project.model.SupportVO;
import com.weis.startfun.project.service.ProjectService;
import com.weis.startfun.utils.Criteria;
import com.weis.startfun.utils.PageDTO;

/*    
설 명 : projectController    
작성일 : 2021.06.05
작성자 : 조하선
*/
@Controller
@RequestMapping("/startfun")
public class ProjectController {

	@Autowired
	private ProjectService service;
	
	@Autowired
	private MyPageService memberservice;
	
	@Autowired
	private ChatService chatservice;
	
	//후원형 프로젝트 신청 페이지 이동
	@RequestMapping(value="/project/supportProjectReg.do", method = RequestMethod.GET)
	public String supportProjectReg(Model model, Principal principal) {
		
		//회원정보 가져오기
		MemberVO member = null;
		member = memberservice.editMember(principal.getName());
		model.addAttribute("member", member);
		
		return "project/supportProjectReg";
	}
	
	//후원형 프로젝트 등록 처리
	@RequestMapping(value="/project/supportProjectReg.do", method = RequestMethod.POST)
	public String supportProjectReg(MemberVO member, ProjectVO project, SupportVO support, RewardVO reward, HttpServletRequest request, Principal principal) throws Exception {
		
		//project.project_status -> 접수 or 임시저장
		//hidden값으로 project_status value 변경 후 submit
		
		//회원정보 수정하기
		member.setMember_email(principal.getName());
		memberservice.editMember(member, request);
		
		return service.supportProjectReg(project, support, reward, request, principal);
	}
	
	//후원형 프로젝트 수정 페이지 이동
	@RequestMapping(value="/project/supportProjectEdit.do", method = RequestMethod.GET)
	public String supportProjcetEdit(String project_no, Model model, Principal principal) {
		
		//status -> 접수 or 임시저장
		//status 값에 따라 접수된 프로젝트 수정 페이지 or 임시저장 마저 작성하기 페이지로 이동
		
		//1. service에서 값 가져오기 ( 회원정보, project, support, reward )
		//회원정보 가져오기
		MemberVO member = memberservice.editMember(principal.getName());
		
		//project 가져오기
		ProjectVO project = service.getProject(project_no);
		
		//support 가져오기
		SupportVO support = service.getSupport(project_no);
		
		//reward 가져오기
		List<RewardVO> reward = service.getReward(project_no);
		
		//addAttribute
		model.addAttribute("member", member);
		model.addAttribute("project",project);
		model.addAttribute("support",support);
		model.addAttribute("reward",reward);
		
		//String url = "mypage/updateMember";
		
		/*
		//2. status에 따라서 페이지 이동처리
		switch (project.getProject_status()) {
		case "접수":
			//TODO : 수정 페이지 이동
			url = "project/supportProjectEdit";
			break;

		case "임시저장":
			//TODO : 임시저장 수정 페이지 이동
			url = "project/supportProjectEdit";
			break;
		}
		*/
		return "project/supportProjectEdit";
	}
	
	//후원형 프로젝트 수정 처리
	@RequestMapping(value="/project/supportProjectEdit.do", method = RequestMethod.POST)
	public String supportProjectEdit(MemberVO member, ProjectVO project, SupportVO support, RewardVO reward, HttpServletRequest request, Principal principal) throws Exception {
		
		
		//project.project_status -> 접수 or 임시저장
		//1. 임시저장한 프로젝트 다시 임시저장 2. 임시저장한 프로젝트 접수 3. 접수한 프로젝트 수정
		//1. project_status값 변동 없음
		//2. project_status value값 접수로 변경 후 submit
		//3. project_status값 변동 없음
		
		//회원정보 수정하기
		member.setMember_email(principal.getName());
		memberservice.editMember(member, request);
		
		return service.supportProjectEdit(project, support, reward, request, principal);
	}

	/////////////////////////////////////////////////////////////
	/////////////////////	투자형	/////////////////////////////
	/////////////////////////////////////////////////////////////
	
	//투자형 프로젝트 신청 페이지 이동
	@RequestMapping(value="/project/investProjectReg.do", method = RequestMethod.GET)
	public String investProjectReg(Model model, Principal principal) {
		
		//회원정보 가져오기
		MemberVO member = null;
		member = memberservice.editMember(principal.getName());
		model.addAttribute("member", member);
		
		return "project/investProjectReg";
	}
	
	//투자형 프로젝트 등록 처리
	@RequestMapping(value="/project/investProjectReg.do", method = RequestMethod.POST)
	public String investProjectReg(MemberVO member, ProjectVO project, InvestVO invest, HttpServletRequest request, Principal principal) throws Exception {
		
		//project.project_status -> 접수 or 임시저장
		//hidden값으로 project_status value 변경 후 submit
		
		//회원정보 수정하기
		//member.setMember_email(principal.getName());
		//memberservice.editMember(member, request);
		
		return service.investProjectReg(project, invest, request, principal);
	}
	
	//투자형 프로젝트 수정 페이지 이동
	@RequestMapping(value="/project/investProjectEdit.do", method = RequestMethod.GET)
	public String investProjectEdit(String project_no, Model model, Principal principal) {
		
		//status -> 접수 or 임시저장
		//status 값에 따라 접수된 프로젝트 수정 페이지 or 임시저장 마저 작성하기 페이지로 이동
		
		//1. service에서 값 가져오기 ( 회원정보, project, support, reward )
		//회원정보 가져오기
		MemberVO member = memberservice.editMember(principal.getName());
				
		//project 가져오기
		ProjectVO project = service.getProject(project_no);
				
		//support 가져오기
		InvestVO invest = service.getInvest(project_no);
		
		//addAttribute
		model.addAttribute("member", member);
		model.addAttribute("project", project);
		model.addAttribute("invest", invest);
		
		/*
		String url = "mypage/updateMember";
		
		//2. status에 따라서 페이지 이동처리
		switch (project.getProject_status()) {
		case "접수":
			url = "project/investProjectEdit";
			break;

		case "임시저장":
			url = "project/investProjectEdit";
			break;
		}
		*/
		
		return "project/investProjectEdit";
	}
	
	
	//투자형 프로젝트 수정 처리
	@RequestMapping(value="/project/investProjectEdit.do", method = RequestMethod.POST)
	public String investProjectEdit(MemberVO member, ProjectVO project, InvestVO invest, HttpServletRequest request, Principal principal) throws Exception {
		
		//project.project_status -> 접수 or 임시저장
		//1. 임시저장한 프로젝트 다시 임시저장 2. 임시저장한 프로젝트 접수 3. 접수한 프로젝트 수정
		//1. project_status값 변동 없음
		//2. project_status value값 접수로 변경 후 submit
		//3. project_status값 변동 없음
		
		//회원정보 수정하기
		//member.setMember_email(principal.getName());
		//memberservice.editMember(member, request);
		
		return service.investProjectEdit(project, invest, request, principal);
	}
	
	//프로젝트 검색
	@RequestMapping(value="projectSearch.do")
	public String projectSearch(Criteria cri, String listSort, Model model) throws ClassNotFoundException, SQLException {
		
		cri.setStartNum((cri.getPageNum()-1)*cri.getAmount());	//시작번호 정해주기
		
		List<ProjectVO> List = service.getProjectSearcList(cri); //criteria(검색조건)으로 list 구하기
		int projectCount = service.getProjectTotalCount(cri);	//총 게시글 수
		model.addAttribute("List", List);									//펀딩리스트
		model.addAttribute("pageMaker", new PageDTO(cri, projectCount));	//검색
		model.addAttribute("projectCount", projectCount);					//검색된 펀딩 수
		
		return "project/searchProject";
	}
	
	//실시간상담
	@RequestMapping(value="/liveChat.do")
	public String liveChat(@RequestParam("room_id") String room_id, Principal principal, Model model) {
		
		// 방정보
		ChatRoomVO room = chatservice.selectChatRoom(Integer.parseInt(room_id));
		model.addAttribute("room", room);
		
		// 프로젝트 정보
		ProjectVO project = service.getProject(Integer.toString(room.getProject_no()));
		model.addAttribute("project", project);
		
		// 상대방 정보 + 내 정보 (send할때 필요)
		MemberVO receiver = null;
		String myname = null;
		// 내가 스타터일때는 상대방 user (스펀서)
		if (room.getMaster_email().equals(principal.getName())) {
			receiver = memberservice.editMember(room.getUser_email());
			myname = room.getMaster_name();
		} 
		// 내가 스펀서일때는 상대방 master (스타터)
		else if (room.getUser_email().equals(principal.getName())) {
			receiver = memberservice.editMember(room.getMaster_email());
			myname = room.getUser_name();
		}
		model.addAttribute("receiver", receiver);
		model.addAttribute("myname", myname);
		model.addAttribute("myemail", principal.getName());
		
		return "project/liveChatting";
	}
}
