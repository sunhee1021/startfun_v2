package com.weis.startfun.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.weis.startfun.notice.model.NoticeVO;
import com.weis.startfun.notice.service.NoticeService;
import com.weis.startfun.utils.Criteria;
import com.weis.startfun.utils.PageDTO;

@Controller
@RequestMapping("/admin/notice/")
public class AdminNoticeController {

	private NoticeService service;
	
	@Autowired
	public void setService(NoticeService service) {
		this.service = service;
	}
	
	//공지글 목록(관리자)
	@RequestMapping("adminNotice.do")
	public String adminNotices(Model model, Criteria cri) {
		
		cri.setStartNum((cri.getPageNum()-1)*cri.getAmount());	//시작번호 정해주기
		
		List<NoticeVO> list = service.getNotices(cri);
		int noticeCount = service.getNoticeCount();
		
		model.addAttribute("list",list);
		model.addAttribute("pageMaker", new PageDTO(cri, noticeCount));
		
		return "admin/adminNotice";
	}
	
	//공지글 검색(admin)
	@RequestMapping("adminNoticeSearch.do")
	public String adminNoticeSearch(Model model, String keyword, Criteria cri) {
		
		cri.setStartNum((cri.getPageNum()-1)*cri.getAmount());	//시작번호 정해주기
		int searchNoticeCount = service.searchNoticeCount();
		
		List<NoticeVO> list = service.searchNotices(keyword, cri);
		model.addAttribute("list",list);
		model.addAttribute("pageMaker", new PageDTO(cri, searchNoticeCount));
		return "admin/adminNoticeSearch";
	}
	
	//공지글 작성
	@RequestMapping(value="noticeAdd.do",  method = RequestMethod.GET)
	public String noticeAdd() {
		return "admin/noticeAdd";
	}
	//공지글 등록
	@RequestMapping(value="noticeAdd.do",  method = RequestMethod.POST)
	public String noticeReg(NoticeVO notice) {		
		return service.insert(notice);
	}
	
	//공지글 수정
	@RequestMapping(value = "noticeEdit.do", method = RequestMethod.GET)
	public String noticeEdit(int notice_no,Model model) {
		NoticeVO notice = service.getNotice(notice_no);
		model.addAttribute("notice",notice);
		return "admin/noticeEdit";
	}
	//공지글 수정(처리)
	@RequestMapping(value = "noticeEdit.do", method = RequestMethod.POST)
	public String noticeEdit(NoticeVO notice) {
		return service.update(notice);
	}
	
	//공지글 삭제
	@RequestMapping(value = "noticeDel.do", method = RequestMethod.GET)
	public String noticeDel(int notice_no) {
		return service.delete(notice_no);
	}

}