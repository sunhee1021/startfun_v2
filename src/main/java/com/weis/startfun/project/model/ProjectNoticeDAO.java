package com.weis.startfun.project.model;

import java.util.List;

//후원 or 투자하기 공지사항
public interface ProjectNoticeDAO {
	//글 목록
	public List<ProjectNoticeVO> proNotices(int project_no);
		
	//글 상세
	public ProjectNoticeVO proNotice(int notice_no);
		
	//글 등록
	public int proInsert(ProjectNoticeVO notice);
		
	//글 수정
	public int proUpdate(ProjectNoticeVO notice);
		
	//글 삭제
	public int proDelete(int notice_no);
		
	
}
