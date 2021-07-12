package com.weis.startfun.project.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weis.startfun.project.model.ProjectNoticeDAO;
import com.weis.startfun.project.model.ProjectNoticeVO;

@Service
public class ProjectNoticeService {

	@Autowired
	private SqlSession sqlsession;

	// 프로젝트 공지사항 목록
	public List<ProjectNoticeVO> projectList(int project_no) {
		ProjectNoticeDAO projectdao = sqlsession.getMapper(ProjectNoticeDAO.class);
		List<ProjectNoticeVO> list = projectdao.proNotices(project_no);
		return list;
	}

	// 프로젝트 공지사항 등록
	public int projectInsert(ProjectNoticeVO proNotice) {
		ProjectNoticeDAO projectdao = sqlsession.getMapper(ProjectNoticeDAO.class);
		int insert = projectdao.proInsert(proNotice);
		return insert;
	}

	// 프로젝트 공지사항 삭제
	public int projectDelete(int notice_no) {
		ProjectNoticeDAO projectdao = sqlsession.getMapper(ProjectNoticeDAO.class);
		return projectdao.proDelete(notice_no);
	}

	// 프로젝트 공지사항 수정(view)
	public ProjectNoticeVO projectEdit(int notice_no) {
		ProjectNoticeDAO projectdao = sqlsession.getMapper(ProjectNoticeDAO.class);
		return projectdao.proNotice(notice_no);
	}

	// 프로젝트 공지사항 수정(처리)
	public int projectUpdate(ProjectNoticeVO notice) {
		ProjectNoticeDAO projectdao = sqlsession.getMapper(ProjectNoticeDAO.class);
		return projectdao.proUpdate(notice);
	}

}
