package com.weis.startfun.project.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weis.startfun.project.model.ProjectQnaDAO;
import com.weis.startfun.project.model.ProjectQnaVO;

@Service
public class ProjectQnaService {
	
	@Autowired
	private SqlSession sqlsession;
	
	//qna 목록
	public List<ProjectQnaVO> getQna(int project_no) {
		ProjectQnaDAO projectdao = sqlsession.getMapper(ProjectQnaDAO.class);
		List<ProjectQnaVO> result = projectdao.getReply(project_no);
		return result;
	}
	
	//qna 등록
	public int qnawrite(ProjectQnaVO qna) {
		ProjectQnaDAO projectdao = sqlsession.getMapper(ProjectQnaDAO.class);
		return projectdao.replywrite(qna);
	}
	
	//qna 삭제
	public int qnadelete(int qna_no) {
		ProjectQnaDAO projectdao = sqlsession.getMapper(ProjectQnaDAO.class);
		return projectdao.replydelete(qna_no);
	}
	
	//qna 수정(view)
	public ProjectQnaVO qnaedit(int qna_no) {
		ProjectQnaDAO projectdao = sqlsession.getMapper(ProjectQnaDAO.class);
		return projectdao.editReply(qna_no);
	}
	
	//qna 수정(처리)
	public int qnaupdate(ProjectQnaVO qna) {
		ProjectQnaDAO projectdao = sqlsession.getMapper(ProjectQnaDAO.class);
		return projectdao.replyupdate(qna);
	}
	
	//qna 대댓글 등록
	public int rereplywrite(ProjectQnaVO qna) {
		ProjectQnaDAO projectdao = sqlsession.getMapper(ProjectQnaDAO.class);
		return projectdao.rereplywrite(qna);
	}
	
	//qna 대댓글 삭제
	public int rereplydelete(int qna_no) {
		ProjectQnaDAO projectdao = sqlsession.getMapper(ProjectQnaDAO.class);
		return projectdao.rereplydelete(qna_no);
	}
}
