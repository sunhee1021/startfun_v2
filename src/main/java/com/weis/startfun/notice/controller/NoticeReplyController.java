package com.weis.startfun.notice.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.weis.startfun.notice.model.NoticeReplyVO;
import com.weis.startfun.notice.service.NoticeService;

@RestController
@RequestMapping("/startfun/notice/reply")
public class NoticeReplyController {

	@Autowired
	private NoticeService service;
	
	//댓글 등록
	@RequestMapping(value="", method={RequestMethod.POST})
	public int insertReply(@RequestBody NoticeReplyVO reply, Principal principal) {
		
		System.out.println(principal.getName());
		reply.setReply_email(principal.getName());
		return service.replywrite(reply);
	}

	
	//댓글 조회
	@RequestMapping(value="/{reply_no}", method={RequestMethod.GET})
	public NoticeReplyVO replyDetail(@PathVariable int reply_no) {
		
		NoticeReplyVO result = service.replydetail(reply_no);
		return result;
	}
	
	//댓글 수정
	@RequestMapping(value = "/{reply_no}", method={RequestMethod.PUT})
	public ResponseEntity<String> replyEdit(@PathVariable int reply_no, @RequestBody NoticeReplyVO reply) {
		
		System.out.println(reply);
		ResponseEntity<String> entity = null;
		
		try {
			service.replyupdate(reply);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
			
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		System.out.println(entity);
		return entity;
	}
	
	//댓글 삭제
	@RequestMapping(value = "/{reply_no}", method=RequestMethod.DELETE)
	public ResponseEntity<String> replyDel(@PathVariable int reply_no){
		
		ResponseEntity<String> entity = null;
		try {
			service.replydelete(reply_no);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.getStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//댓글 목록
	@RequestMapping(value = "list", method=RequestMethod.GET)
	public List<NoticeReplyVO> replyList(@RequestParam int notice_no){
		
		List<NoticeReplyVO> list = service.getReply(notice_no);
		System.out.println("list controller 값: "+list);
		return list;
	}
	
}
