package com.weis.startfun.project.model;

import java.sql.SQLException;
import java.util.List;

import com.weis.startfun.utils.Criteria;

/*    
설 명 : projectDAO    
작성일 : 2021.06.05
작성자 : 조하선
*/
public interface ProjectDAO {
	//프로젝트 생성
	public int insertProject(ProjectVO project) throws ClassNotFoundException, SQLException;
	
	//후원프로젝트 생성
	public int insertSupport(SupportVO support) throws ClassNotFoundException, SQLException;
	
	//리워드 생성
	public int insertReward(RewardVO reward) throws ClassNotFoundException, SQLException;
	
	//투자프로젝트 생성
	public int insertInvest(InvestVO invest) throws ClassNotFoundException, SQLException;
	
	//프로젝트 수정
	public int updateProject(ProjectVO project) throws ClassNotFoundException, SQLException;
	
	//후원프로젝트 수정
	public int updateSupport(SupportVO support) throws ClassNotFoundException, SQLException;
	
	//리워드 수정
	public int updateReward(RewardVO reward) throws ClassNotFoundException, SQLException;
	
	//투자프로젝트 수정
	public int updateInvest(InvestVO invest) throws ClassNotFoundException, SQLException;
	
	//프로젝트 불러오기
	public ProjectVO selectProject(int project_no) throws ClassNotFoundException, SQLException;
	
	//후원프로젝트 불러오기
	public SupportVO selectSupport(int project_no) throws ClassNotFoundException, SQLException;
	
	//리워드 불러오기
	public List<RewardVO> selectReward(int project_no) throws ClassNotFoundException, SQLException;
	
	//투자프로젝트 불러오기
	public InvestVO selectInvest(int project_no) throws ClassNotFoundException, SQLException;
	
	//프로젝트분야 불러오기
	public List<ProjectCategoryVO> selectProjectCategory() throws ClassNotFoundException, SQLException;
	
	//리워드 지우기
	public int deleteReward(Integer reward_no) throws ClassNotFoundException, SQLException;
	
	//프로젝트 제목 검색
	public List<ProjectVO> getProjectByTitle(Criteria cri) throws ClassNotFoundException, SQLException;
		
	//프로젝트 총 개수
	public int getProjectTotalCount(Criteria cri) throws ClassNotFoundException, SQLException;

	
	
}
