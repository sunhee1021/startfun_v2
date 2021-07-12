package com.weis.startfun.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.weis.startfun.notice.model.NoticeReplyVO;
import com.weis.startfun.notice.model.NoticeVO;
import com.weis.startfun.notice.service.NoticeService;
import com.weis.startfun.utils.Criteria;
import com.weis.startfun.utils.PageDTO;

@Controller
@RequestMapping("/startfun/notice/")
public class NoticeController {
	
	private NoticeService service;
	
	@Autowired
	public void setService(NoticeService service) {
		this.service = service;
	}
	
	//공지글 목록
	@RequestMapping("notice.do")
	public String notices(Model model, Criteria cri) {
		
		cri.setStartNum((cri.getPageNum()-1)*cri.getAmount());	//시작번호 정해주기
		
		List<NoticeVO> list = service.getNotices(cri);
		int noticeCount = service.getNoticeCount();
		
		model.addAttribute("list",list);
		model.addAttribute("pageMaker", new PageDTO(cri, noticeCount));
		
		return "notice/notice";
	}
	
	//공지글 검색
	@RequestMapping("noticeSearch.do")
	public String noticeSearch(Model model, String keyword, Criteria cri) {
		
		cri.setStartNum((cri.getPageNum()-1)*cri.getAmount());	//시작번호 정해주기
		int searchNoticeCount = service.searchNoticeCount();
		
		List<NoticeVO> list = service.searchNotices(keyword, cri);
		model.addAttribute("list",list);
		model.addAttribute("pageMaker", new PageDTO(cri, searchNoticeCount));
		
		return "notice/notice";
	}
	
	//공지글 상세
	@RequestMapping("noticeDetail.do")
	public String notice(int notice_no, Model model) {
		NoticeVO notice = service.getNotice(notice_no);
		List<NoticeReplyVO> reply = service.getReply(notice_no);
		
		model.addAttribute("notice",notice);
		model.addAttribute("reply",reply);
		System.out.println("reply: "+reply);
		return "notice/noticeDetail";
	}
	
}
