package com.weis.startfun.notice.model;

import java.util.List;
import java.util.Map;

import com.weis.startfun.utils.Criteria;

//공지사항 게시판
public interface NoticeDAO {
	
	//공지글 목록
	public List<NoticeVO> getNotices(Criteria cri);

	//공지글 전체 개수
	public int getNoticeCount();
	
	//공지글 검색
	public List<NoticeVO> searchNotices(Map<String, Object> searchParam);
	
	//공지글 전체 개수
	public int searchNoticeCount();
		
	//공지글 상세
	public NoticeVO getNotice(int notice_no);
	
	//공지글 등록
	public int insert(NoticeVO notice);
	
	//공지글 수정
	public int update(NoticeVO notice);
	
	//공지글 삭제
	public int delete(int notice_no);
	
	//댓글 등록
	public int replywrite(NoticeReplyVO reply);
	
	//댓글 목록
	public List<NoticeReplyVO> getReply(int notice_no);
	
	//댓글 삭제
	public int replydelete(int reply_no);
	
	//댓글 수정
	public void replyupdate(NoticeReplyVO reply);
	
	//댓글 상세
	public NoticeReplyVO replydetail(int reply_no);

}
