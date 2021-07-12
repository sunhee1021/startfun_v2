package com.weis.startfun.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.weis.startfun.project.model.ProjectQnaVO;
import com.weis.startfun.project.service.ProjectQnaService;

@RestController
@RequestMapping("/startfun/")
public class ProjectQnaController {

	@Autowired
	private ProjectQnaService service;
	
	//qna 목록(ajax)
	@RequestMapping(value = "qnaList.do", method = RequestMethod.GET)
	@ResponseBody
	public List<ProjectQnaVO> qnaList(@RequestParam int project_no){
		List<ProjectQnaVO> list = service.getQna(project_no);
		return list;
	}
	
	//qna 등록
	@RequestMapping(value = "insertQna.do")
	@ResponseBody
	public int insertQna(@ModelAttribute("qna") ProjectQnaVO qna, String qna_email){
		//String email = (String) session.getAttribute(qna_email);
		System.out.println("qna email : "+qna_email);
		qna.setQna_email(qna_email);
		return service.qnawrite(qna);
	}
	
	//qna 삭제
	@RequestMapping(value = "deleteQna.do")
	@ResponseBody
	public int deleteQna(@ModelAttribute("qna_no") int qna_no) {
		return service.qnadelete(qna_no);
	}
	
	//qna 수정(view)
	@RequestMapping(value = "editQna.do")
	@ResponseBody
	public ProjectQnaVO editQna(@RequestParam int qna_no) {
		return service.qnaedit(qna_no);
	}
	
	//qna 수정(처리)
	@RequestMapping(value = "updateQna.do")
	@ResponseBody
	public int updateQna(@ModelAttribute("qna") ProjectQnaVO qna) {
		return service.qnaupdate(qna);
	}
	
	//qna 대댓글 등록
	@RequestMapping(value = "insertReReply.do")
	@ResponseBody
	public int insertReReply(@ModelAttribute("qna") ProjectQnaVO qna) {
		return service.rereplywrite(qna);
	}
	
	//qna 대댓글 삭제
	@RequestMapping(value = "deleteReReply.do")
	@ResponseBody
	public String deleteReReply(@ModelAttribute("qna_no") int qna_no) {
		int del = service.rereplydelete(qna_no);
		String result = null;
		if(del == 0) {
			result = "fail";
		}else {
			result = "ok";
		}
		return result;
	}
}
