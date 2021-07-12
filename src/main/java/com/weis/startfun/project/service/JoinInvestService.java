package com.weis.startfun.project.service;

import java.security.Principal;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weis.startfun.admin.model.ReportVO;
import com.weis.startfun.project.model.InvestVO;
import com.weis.startfun.project.model.JoinInvestDAO;
import com.weis.startfun.project.model.JoinInvestVO;
import com.weis.startfun.project.model.JoinSupportDAO;
import com.weis.startfun.project.model.ProjectVO;
import com.weis.startfun.utils.Criteria;

/* 
설 명 : JoinInvest Service
작성일 : 2021.06.08
작성자 : 이보희 
*/
@Service
public class JoinInvestService {
	
	@Autowired 
	private SqlSession sqlsession;
		
	//투자형 프로젝트 리스트
	public List<ProjectVO> getInvestList(Criteria cri) {
		
		List<ProjectVO> projectList = null;
		
		try {
			
			JoinInvestDAO joinInvestDAO = sqlsession.getMapper(JoinInvestDAO.class);
			projectList = joinInvestDAO.getInvestList(cri);
			
		} catch (ClassNotFoundException e) { 
			e.printStackTrace(); 
		} catch (SQLException e) { 
			e.printStackTrace();
		}
		
		return projectList; 
	}
	 
	
	//투자형 프로젝트 상세페이지(상단)
	public ProjectVO getInvestDetailTop(int project_no) {
		
		ProjectVO investDetailTop = null;
		
	    try {
	    	
	    	JoinInvestDAO joinInvestDAO = sqlsession.getMapper(JoinInvestDAO.class);
	    	investDetailTop = joinInvestDAO.getInvestDetailTop(project_no);
	    	
		} catch (ClassNotFoundException e) { 
			e.printStackTrace(); 
		} catch(SQLException e) { 
			e.printStackTrace(); 
		} 
	    
	    return investDetailTop;
	}

	
	//투자형 프로젝트 상세페이지(증권발행조건)
	public InvestVO checkBond(int project_no) {
		
		InvestVO checkBond = null;
		
		try {
			
			JoinInvestDAO joinInvestDAO = sqlsession.getMapper(JoinInvestDAO.class);
			checkBond = joinInvestDAO.checkBond(project_no);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return checkBond;
	}
	
	
	//신고하기
	public String investReport(ReportVO reportVO, Principal principal) { 
		
		try {
			reportVO.setReport_email(principal.getName());
			JoinSupportDAO joinSupportDAO = sqlsession.getMapper(JoinSupportDAO.class);
			joinSupportDAO.report(reportVO);
			
		} catch (ClassNotFoundException e) { 
			e.printStackTrace(); 
		} catch (SQLException e) { 
			e.printStackTrace(); 
		} 
		
		return "redirect:investDetail.do?project_no="+reportVO.getProject_no();
	}
	
	
	//투자하기(투자내용 및 한도)
	public ProjectVO getInvestInfo(Map<Object, Object> info) {
		
		ProjectVO investInfo = null;
		
		try {
			
			JoinInvestDAO joinInvestDAO = sqlsession.getMapper(JoinInvestDAO.class);
			investInfo = joinInvestDAO.getInvestInfo(info);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return investInfo;
	}
	
	
	//투자하기
	public String joinInvest(JoinInvestVO joinInvestVO, Principal principal) {
		
		try {
			
			joinInvestVO.setSponsor_email(principal.getName());
			JoinInvestDAO joinInvestDAO = sqlsession.getMapper(JoinInvestDAO.class);
			joinInvestDAO.joinInvest(joinInvestVO);
			
		} catch (ClassNotFoundException e) { 
			e.printStackTrace(); 
		} catch (SQLException e) { 
			e.printStackTrace(); 
		} 
		
		return "redirect:completeInvestJoin.do?invest_no="+joinInvestVO.getInvest_no();
	}
	
	//프로젝트 총 개수
	public int getProjectCount(Criteria cri) throws ClassNotFoundException, SQLException {
		
		JoinInvestDAO joinInvestDAO = sqlsession.getMapper(JoinInvestDAO.class);
		
		return joinInvestDAO.getProjectCount(cri);
	}
}
