package com.weis.startfun.project.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.weis.startfun.admin.model.ReportVO;
import com.weis.startfun.utils.Criteria;

/* 
설 명 : JoinInvest DAO 
작성일 : 2021.06.07
작성자 : 이보희 
*/
public interface JoinInvestDAO {
	
	//투자형 프로젝트 리스트
	public List<ProjectVO> getInvestList(Criteria cri) throws ClassNotFoundException, SQLException;
		
	//투자형 프로젝트 상세페이지(상단)
	public ProjectVO getInvestDetailTop(int project_no) throws ClassNotFoundException, SQLException;

	//투자형 프로젝트 상세페이지(증권발행조건)
	public InvestVO checkBond(int project_no) throws ClassNotFoundException, SQLException;
	
	//투자하기(투자내용 및 한도)
	public ProjectVO getInvestInfo(Map<Object, Object> info) throws ClassNotFoundException, SQLException;
	
	//투자하기 처리
	public int joinInvest(JoinInvestVO joinInvestVO) throws ClassNotFoundException, SQLException;

	//프로젝트 총 개수
	public int getProjectCount(Criteria cri) throws ClassNotFoundException, SQLException;
}
