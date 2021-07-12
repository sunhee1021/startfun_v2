package com.weis.startfun.member.model;

import java.sql.SQLException;
import java.util.List;

import com.weis.startfun.project.model.ProjectVO;

public interface ProfileDAO {

	//프로필 페이지(main 출력)
	public MemberVO getMeber(String member_email);
	
	//프로필 페이지 개설 프로젝트(ajax)
	public List<ProjectVO> getProjects(String project_email);
	
	//프로필 페이지 팔로우
	public int addFollow(String to_user, String from_user);
	
	//팔로잉 번호 찾기
	public FollowingVO searchFollowing_no(FollowingVO followingVO);
		
	//팔로우 이메일 찾기
	public ProjectVO searchEmail(int project_no);
		
	//팔로우하기
	public int doFollow(FollowingVO followingVO);
		
	//팔로우 취소하기
	public int delFollow(FollowingVO followingVO);
	
	//팔로워 수
	public int followerCount(String member_email);
	
	//팔로잉 수
	public int followingCount(String member_email);
}
