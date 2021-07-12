package com.weis.startfun.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.weis.startfun.project.model.ProjectNoticeVO;
import com.weis.startfun.project.service.ProjectNoticeService;

@Controller
@RequestMapping("/startfun/project/*")
public class ProjectNoticeController {

//	@Autowired
//	private ProjectService service;
	
	@Autowired
	private ProjectNoticeService nservice;
	
	//프로젝트 공지 목록
	@RequestMapping(value = "projectNotice.do", method = RequestMethod.GET)
	@ResponseBody
	public List<ProjectNoticeVO> projectNotice(@RequestParam int project_no, Model model){
		
		List<ProjectNoticeVO> list = nservice.projectList(project_no);
		model.addAttribute("list", list);
		System.out.println("프로젝트 공지 목록: "+list);
		return list;
	}
	
	//프로젝트 공지 등록
	@RequestMapping(value = "projectNoticeAdd.do", method = RequestMethod.POST)
	@ResponseBody
	public int projectNoticeAdd(@ModelAttribute("proNotice") ProjectNoticeVO proNotice) {
		int result = nservice.projectInsert(proNotice);
		System.out.println("프로젝트 공지 등록 : "+result);
		return result;
	}
	
	//프로젝트 공지 삭제
	@RequestMapping(value = "projectNoticeDel.do")
	@ResponseBody
	public int projectNoticeDel(@RequestParam int notice_no) {
		return nservice.projectDelete(notice_no);
	}
	
	//프로젝트 공지 수정(값 가져오기)
	@RequestMapping(value = "projectNoticeDetail.do")
	@ResponseBody
	public ProjectNoticeVO projectNoticeDetail(@RequestParam int notice_no) {
		ProjectNoticeVO result = nservice.projectEdit(notice_no);
		return result;
	}
	
	//프로젝트 공지 수정(처리)
	@RequestMapping(value = "projectNoticeUp.do")
	@ResponseBody
	public int projectNoticeUp(@ModelAttribute("notice") ProjectNoticeVO notice) {
		System.out.println("controller단");
		return nservice.projectUpdate(notice);
	}
	
}
