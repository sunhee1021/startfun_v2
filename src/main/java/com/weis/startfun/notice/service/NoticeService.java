package com.weis.startfun.notice.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weis.startfun.notice.model.NoticeDAO;
import com.weis.startfun.notice.model.NoticeReplyVO;
import com.weis.startfun.notice.model.NoticeVO;
import com.weis.startfun.utils.Criteria;

@Service
public class NoticeService {
	
	//DB
	private SqlSession sqlsession;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	//공지글 목록
	public List<NoticeVO> getNotices(Criteria cri){
		
		cri.setAmount(10);
		
		List<NoticeVO> list = null;
		
		try {
			NoticeDAO noticedao = sqlsession.getMapper(NoticeDAO.class);
			list = noticedao.getNotices(cri);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}
	//목록 : end
	
	//공지글 검색
	public List<NoticeVO> searchNotices(String keyword, Criteria cri){
		
		cri.setAmount(10);
		
		List<NoticeVO> search = null;
		Map<String, Object> searchParam = new HashMap<String, Object>();
		searchParam.put("keyword", keyword);
		searchParam.put("cri", cri);
	
		try {
			NoticeDAO noticedao = sqlsession.getMapper(NoticeDAO.class);
			search = noticedao.searchNotices(searchParam);
		} catch (Exception e) {
			e.getStackTrace();
		}
		return search;
	}
	
	//공지글 전체 개수
	public int getNoticeCount() {
		int result = 0;
		
		try {
			NoticeDAO noticedao = sqlsession.getMapper(NoticeDAO.class);
			result = noticedao.getNoticeCount();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	
	//공지글 검색 개수
	public int searchNoticeCount() {
		int result = 0;
		
		try {
			NoticeDAO noticedao = sqlsession.getMapper(NoticeDAO.class);
			result = noticedao.searchNoticeCount();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	
	//공지글 상세
	public NoticeVO getNotice(int notice_no) {
		NoticeVO notice = null;
		
		try {
			NoticeDAO noticedao = sqlsession.getMapper(NoticeDAO.class);
			notice = noticedao.getNotice(notice_no);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return notice;
	}
	//상세 : end
	
	//공지글 등록
	public String insert(NoticeVO notice) {
		NoticeDAO noticedao = sqlsession.getMapper(NoticeDAO.class);
		noticedao.insert(notice);
		//return "redirect:/admin/notice/adminNotice.do";
		return "redirect:/startfun/notice/noticeDetail.do?notice_no="+notice.getNotice_no();
	}
	//등록 : end
	
	//공지글 수정
	public NoticeVO update(int notice_no) {
		NoticeVO notice = null;
		
		try {
			NoticeDAO noticedao = sqlsession.getMapper(NoticeDAO.class);
			notice = noticedao.getNotice(notice_no);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return notice;
	}
	//수정(view) : end
	
	//공지글 수정
	public String update(NoticeVO notice) {
		NoticeDAO noticedao = sqlsession.getMapper(NoticeDAO.class);
		noticedao.update(notice);
		return "redirect:/startfun/notice/noticeDetail.do?notice_no="+notice.getNotice_no();
	}
	//수정(back) : end
	
	//공지글 삭제
	public String delete(int notice_no) {
		NoticeDAO noticedao = sqlsession.getMapper(NoticeDAO.class);
		noticedao.delete(notice_no);
		return "redirect:/admin/notice/adminNotice.do";
	}
	//삭제 : end
	
	//댓글 등록
	public int replywrite(NoticeReplyVO reply) {
		NoticeDAO noticedao = sqlsession.getMapper(NoticeDAO.class);
		return noticedao.replywrite(reply);
	}
	//댓글 등록 : end
	
	//댓글 목록
	public List<NoticeReplyVO> getReply(int notice_no){
		NoticeDAO noticedao = sqlsession.getMapper(NoticeDAO.class);
		List<NoticeReplyVO> result = noticedao.getReply(notice_no);
		return result;
	}
	//댓글 목록 : end
	

	//댓글 삭제
	public int replydelete(int reply_no) {
		NoticeDAO noticedao = sqlsession.getMapper(NoticeDAO.class);
		return noticedao.replydelete(reply_no);
	}
	//댓글 삭제 : end
	
	//댓글 수정
	public void replyupdate(NoticeReplyVO reply) {
		NoticeDAO noticedao = sqlsession.getMapper(NoticeDAO.class);
		noticedao.replyupdate(reply);
	}
	
	//댓글 상세 값
	public NoticeReplyVO replydetail(int reply_no) {
		NoticeDAO noticedao = sqlsession.getMapper(NoticeDAO.class);
		return noticedao.replydetail(reply_no);
	}
	
}
