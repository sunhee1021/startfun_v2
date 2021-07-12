package com.weis.startfun.project.model;

import java.util.List;

//후원 or 투자하기 qna(댓글 형식)
public interface ProjectQnaDAO {
	
	//댓글 등록
	public int replywrite(ProjectQnaVO qna);
		
	//댓글 목록
	public List<ProjectQnaVO> getReply(int project_no);
		
	//댓글 삭제
	public int replydelete(int qna_no);
		
	//댓글 수정(view)
	public ProjectQnaVO editReply(int qna_no);
	
	//댓글 수정(처리)
	public int replyupdate(ProjectQnaVO qna);
	
	//대댓글 등록
	public int rereplywrite(ProjectQnaVO qna);
	
	//대댓글 삭제
	public int rereplydelete(int qna_no);
}
