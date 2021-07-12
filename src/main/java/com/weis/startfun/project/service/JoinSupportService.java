package com.weis.startfun.project.service;

import java.security.Principal;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weis.startfun.admin.model.ReportVO;
import com.weis.startfun.member.model.FollowingVO;
import com.weis.startfun.member.model.MemberVO;
import com.weis.startfun.member.model.WishVO;
import com.weis.startfun.project.model.JoinSupportDAO;
import com.weis.startfun.project.model.JoinSupportVO;
import com.weis.startfun.project.model.ProjectVO;
import com.weis.startfun.project.model.ReviewVO;
import com.weis.startfun.project.model.RewardVO;
import com.weis.startfun.project.model.SupportVO;
import com.weis.startfun.utils.Criteria;

/* 
설 명 : JoinSupport Service
작성일 : 2021.06.08
작성자 : 이보희 
*/
@Service
public class JoinSupportService {

	@Autowired
	private SqlSession sqlsession;

	//후원형 프로젝트 리스트
	public List<ProjectVO> getSupportList(Criteria cri) {

		List<ProjectVO> projectList = null;

		try {

			JoinSupportDAO joinSupportDAO = sqlsession.getMapper(JoinSupportDAO.class);
			projectList = joinSupportDAO.getSupportList(cri);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return projectList;
	}

	//후원형 프로젝트 상세페이지(상단)
	public ProjectVO getSupportDetailTop(int project_no) {

		ProjectVO supportDetailTop = null;

		try {

			JoinSupportDAO joinSupportDAO = sqlsession.getMapper(JoinSupportDAO.class);
			supportDetailTop = joinSupportDAO.getSupportDetailTop(project_no);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return supportDetailTop;
	}

	//후원형 프로젝트 상세페이지(옵션)
	public List<RewardVO> getSupportOption(int project_no) {

		List<RewardVO> optionList = null;

		try {

			JoinSupportDAO joinSupportDAO = sqlsession.getMapper(JoinSupportDAO.class);
			optionList = joinSupportDAO.getSupportOption(project_no);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return optionList;
	}
	
	//신고여부확인
	public ReportVO checkReport(ReportVO reportVO) {

		ReportVO report_no = null;
		
		try {
			
			JoinSupportDAO joinSupportDAO = sqlsession.getMapper(JoinSupportDAO.class);
			report_no = joinSupportDAO.checkReport(reportVO);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return report_no;
	}
	
	//신고하기
	public String supportReport(ReportVO reportVO, Principal principal) {

		try {
			reportVO.setReport_email(principal.getName());
			JoinSupportDAO joinSupportDAO = sqlsession.getMapper(JoinSupportDAO.class);
			joinSupportDAO.report(reportVO);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return "redirect:supportDetail.do?project_no=" + reportVO.getProject_no();
	}

	//후원하기 옵션선택
	public RewardVO joinSupportOption(RewardVO rewardVO) {

		RewardVO reward = null;
		
		try {

			JoinSupportDAO joinSupportDAO = sqlsession.getMapper(JoinSupportDAO.class);
			reward = joinSupportDAO.joinSupportOption(rewardVO);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return reward;
	}

	//후원하기
	public String joinSupport(JoinSupportVO joinSupportVO, Principal principal) {

		try {
			joinSupportVO.setSponsor_email(principal.getName());
			JoinSupportDAO joinSupportDAO = sqlsession.getMapper(JoinSupportDAO.class);
			joinSupportDAO.joinSupport(joinSupportVO);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return "redirect:completeSupportJoin.do";
	}

	//후기탭(항목별 평균)
	public List<ReviewVO> getReviewAvg(int project_no) {

		List<ReviewVO> reviewAvgList = null;

		try {

			JoinSupportDAO joinSupportDAO = sqlsession.getMapper(JoinSupportDAO.class);
			reviewAvgList = joinSupportDAO.getReviewAvg(project_no);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return reviewAvgList;
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
	
	//관심프로젝트번호 찾기
	public WishVO searchWish_no(WishVO wishVO) {
		
		WishVO wish_no = null;
		
		try {
			
			JoinSupportDAO joinSupportDAO = sqlsession.getMapper(JoinSupportDAO.class);
			wish_no = joinSupportDAO.searchWish_no(wishVO);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return wish_no;
	}
	
	//관심프로젝트 설정하기
	public int doWishProject(WishVO wishVO) {
		
		int result = 0;
		
		try {
			
			JoinSupportDAO joinSupportDAO = sqlsession.getMapper(JoinSupportDAO.class);
			result = joinSupportDAO.doWishProject(wishVO);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//관심프로젝트 취소하기
	public int delWishProject(WishVO wishVO) {
		
		int result = 0;
		
		try {
			
			JoinSupportDAO joinSupportDAO = sqlsession.getMapper(JoinSupportDAO.class);
			result = joinSupportDAO.delWishProject(wishVO);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//리워드 정책 찾기
	public SupportVO searchGuide(int project_no) {

		SupportVO guide = null;

		try {

			JoinSupportDAO joinSupportDAO = sqlsession.getMapper(JoinSupportDAO.class);
			guide = joinSupportDAO.searchGuide(project_no);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return guide;
	}
	
	//로그인한 사용자의 타입찾기(일반/법인)
	public MemberVO searchMember_Type(String member_email) {
		
		MemberVO member_type = null;
		
		try {
			
			JoinSupportDAO joinSupportDAO = sqlsession.getMapper(JoinSupportDAO.class);
			member_type = joinSupportDAO.searchMember_Type(member_email);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return member_type;
	}
	
	//프로젝트 총 개수
	public int getProjectCount(Criteria cri) throws ClassNotFoundException, SQLException {
		
		JoinSupportDAO joinSupportDAO = sqlsession.getMapper(JoinSupportDAO.class);
		
		return joinSupportDAO.getProjectCount(cri);
	}
}
