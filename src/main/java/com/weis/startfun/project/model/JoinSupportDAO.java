package com.weis.startfun.project.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.weis.startfun.admin.model.ReportVO;
import com.weis.startfun.member.model.FollowingVO;
import com.weis.startfun.member.model.MemberVO;
import com.weis.startfun.member.model.WishVO;
import com.weis.startfun.utils.Criteria;

/* 
설 명 : JoinSupport DAO 
작성일 : 2021.06.07
작성자 : 이보희 
*/
public interface JoinSupportDAO {
	
	//후원형 프로젝트 리스트
	public List<ProjectVO> getSupportList(Criteria cri) throws ClassNotFoundException, SQLException;
			
	//후원형 프로젝트 상세페이지(상단)
	public ProjectVO getSupportDetailTop(int project_no) throws ClassNotFoundException, SQLException;
	
	//후원형 프로젝트 상세페이지(옵션창)
	public List<RewardVO> getSupportOption(int project_no) throws ClassNotFoundException, SQLException;
	
	//신고여부확인
	public ReportVO checkReport(ReportVO reportVO) throws ClassNotFoundException, SQLException;
	
	//신고하기
	public int report(ReportVO reportVO) throws ClassNotFoundException, SQLException;
		
	//후원하기 다음단계(옵션선택)
	public RewardVO joinSupportOption(RewardVO rewardVO) throws ClassNotFoundException, SQLException; 
	
	//후원하기 처리
	public int joinSupport(JoinSupportVO joinSupportVO) throws ClassNotFoundException, SQLException;
	
	//후기탭(항목별 평균)
	public List<ReviewVO> getReviewAvg(int project_no) throws ClassNotFoundException, SQLException;
	
	//팔로잉 번호 찾기
	public FollowingVO searchFollowing_no(FollowingVO followingVO) throws ClassNotFoundException, SQLException;
	
	//팔로우 이메일 찾기
	public ProjectVO searchEmail(int project_no) throws ClassNotFoundException, SQLException;
	
	//팔로우하기
	public int doFollow(FollowingVO followingVO) throws ClassNotFoundException, SQLException;
	
	//팔로우 취소하기
	public int delFollow(FollowingVO followingVO) throws ClassNotFoundException, SQLException;
	
	//관심프로젝트 번호 찾기
	public WishVO searchWish_no(WishVO wishVO) throws ClassNotFoundException, SQLException;
	
	//관심프로젝트 설정하기
	public int doWishProject(WishVO wishVO) throws ClassNotFoundException, SQLException;
	
	//관심프로젝트 취소하기
	public int delWishProject(WishVO wishVO) throws ClassNotFoundException, SQLException;
	
	//리워드정책 찾기
	public SupportVO searchGuide(int project_no) throws ClassNotFoundException, SQLException;
	
	//로그인 사용자 타입구분(일반/법인)
	public MemberVO searchMember_Type(String member_email) throws ClassNotFoundException, SQLException;
	
	//프로젝트 총 개수
	public int getProjectCount(Criteria cri) throws ClassNotFoundException, SQLException;

}
