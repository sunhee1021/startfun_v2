package com.weis.startfun.member.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weis.startfun.member.model.FollowingVO;
import com.weis.startfun.member.model.MemberVO;
import com.weis.startfun.member.model.ProfileDAO;
import com.weis.startfun.project.model.JoinSupportDAO;
import com.weis.startfun.project.model.ProjectDAO;
import com.weis.startfun.project.model.ProjectVO;

@Service
public class ProfileService {
	
	@Autowired
	private SqlSession sqlsession;
	
	//프로필 페이지
	public MemberVO getMainIR(String member_email) {
		ProfileDAO profiledao = sqlsession.getMapper(ProfileDAO.class);
		return profiledao.getMeber(member_email);
	}
	
	//프로필 페이지 개설 프로젝트(ajax)
	public List<ProjectVO> getProjects(String project_email){
		ProfileDAO profiledao = sqlsession.getMapper(ProfileDAO.class);
		return profiledao.getProjects(project_email);
	}
	
	//팔로잉번호 찾기
		public FollowingVO searchFollowing_no(FollowingVO followingVO) {
			
			FollowingVO following_no = null;
			
			try {
				
				JoinSupportDAO joinSupportDAO = sqlsession.getMapper(JoinSupportDAO.class);
				following_no = joinSupportDAO.searchFollowing_no(followingVO);
				
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return following_no;
		}
		
		//팔로우할 이메일 찾기
		public ProjectVO searchEmail(int project_no) {
			
			ProjectVO email = null;
			
			try {
				
				JoinSupportDAO joinSupportDAO = sqlsession.getMapper(JoinSupportDAO.class);
				email = joinSupportDAO.searchEmail(project_no);
				
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return email;
		}
		   
		//팔로우하기
		public int doFollow(FollowingVO followingVO) {
			
			int result = 0;
			
			try {
				
				JoinSupportDAO joinSupportDAO = sqlsession.getMapper(JoinSupportDAO.class);
				result = joinSupportDAO.doFollow(followingVO);
				
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return result;
		}
		
		//팔로우 취소하기
		public int delFollow(FollowingVO followingVO) {
			
			int result = 0;
			
			try {
				
				JoinSupportDAO joinSupportDAO = sqlsession.getMapper(JoinSupportDAO.class);
				result = joinSupportDAO.delFollow(followingVO);
				
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return result;
		}
		
		//팔로워 수
		public int followerCount(String member_email) {
			ProfileDAO profiledao = sqlsession.getMapper(ProfileDAO.class);
			return profiledao.followerCount(member_email);
		}
		
		//팔로잉 수
		public int followingrCount(String member_email) {
			ProfileDAO profiledao = sqlsession.getMapper(ProfileDAO.class);
			return profiledao.followingCount(member_email);
		}
}
