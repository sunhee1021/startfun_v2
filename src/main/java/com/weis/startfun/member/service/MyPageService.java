package com.weis.startfun.member.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weis.startfun.member.model.FollowerVO;
import com.weis.startfun.member.model.FollowingVO;
import com.weis.startfun.member.model.MemberVO;
import com.weis.startfun.member.model.MyPageDAO;
import com.weis.startfun.member.model.WishVO;
import com.weis.startfun.project.model.JoinInvestVO;
import com.weis.startfun.project.model.JoinSupportDAO;
import com.weis.startfun.project.model.JoinSupportVO;
import com.weis.startfun.project.model.ProjectVO;
import com.weis.startfun.project.model.ReviewVO;
import com.weis.startfun.utils.Criteria;

/*    
	설 명 : MyPage Service    
	작성일 : 2021.06.05
	작성자 : 정수빈 
*/

@Service
public class MyPageService {
	
	private SqlSession sqlsession;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	//마이페이지 계정정보
	public MemberVO editMember(String email) {
		
		MemberVO member = null;
		
		try {
			MyPageDAO mypageDao = sqlsession.getMapper(MyPageDAO.class);
			member = mypageDao.getMember(email);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		return member;
	}
	
	//마이페이지 계정정보 수정
	public String editMember(MemberVO member, HttpServletRequest request) {
		
		if(!member.getMember_file().isEmpty()) {
			String filename = member.getMember_file().getOriginalFilename();
			String path = request.getServletContext().getRealPath("/upload");
			String fpath = path +"\\" +filename;
			
			FileOutputStream fs = null;
			try {
				fs = new FileOutputStream(fpath);
				fs.write(member.getMember_file().getBytes());
				
			}catch (Exception e) {
				System.out.println(e.getMessage());
			}finally {
				try {
					fs.close();
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}
			member.setMember_profile(filename);
		}
		
		try {
			MyPageDAO mypageDao = sqlsession.getMapper(MyPageDAO.class);
			mypageDao.updateMember(member);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		return "redirect:/startfun/mypage/account.do";
	}
	
	//마이페이지 계정정보 탈퇴
	public String withdrawMember(String email, HttpSession sessoin) {
		
		try {
			MyPageDAO mypageDao = sqlsession.getMapper(MyPageDAO.class);
			mypageDao.withdrawMember(email);
			sessoin.invalidate();
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		return "redirect:/startfun/index.do";
	}
	
	//관심프로젝트 리스트
	public List<WishVO> getWishList(String email) {
		
		List<WishVO> wishList = null;
		
		try {
			MyPageDAO mypageDao = sqlsession.getMapper(MyPageDAO.class);
			wishList = mypageDao.getWishList(email);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		return wishList;
	}
	
	//팔로잉 리스트
	public List<FollowingVO> getFollowingList(String email) {
		
		List<FollowingVO> followingList = null;
		
		try {
			MyPageDAO mypageDao = sqlsession.getMapper(MyPageDAO.class);
			followingList = mypageDao.getFollowingList(email);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		return followingList;
	}
	
	//팔로잉 취소
	public String cancelFollowing(int followingNo) {
		
		try {
			MyPageDAO mypageDao = sqlsession.getMapper(MyPageDAO.class);
			mypageDao.delFollowing(followingNo);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		return "redirect:/startfun/mypage/following.do";
	}
	
	//팔로워 리스트
	public List<FollowerVO> getFollowerList(String email) {
		
		List<FollowerVO> followerList = null;
		
		try {
			MyPageDAO mypageDao = sqlsession.getMapper(MyPageDAO.class);
			followerList = mypageDao.getFollowerList(email);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		return followerList;
	}
	
	//개설프로젝트 리스트
	public List<ProjectVO> getOpenProjectList(String email) {
		
		List<ProjectVO> openProjectList = null;
		
		try {
			MyPageDAO mypageDao = sqlsession.getMapper(MyPageDAO.class);
			openProjectList = mypageDao.getOpenProjectList(email);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		return openProjectList;
	}
	
	//개설프로젝트 삭제
	public String deleteProject(int projectNo) {
		
		try {
			MyPageDAO mypageDao = sqlsession.getMapper(MyPageDAO.class);
			mypageDao.deleteProject(projectNo);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		return "redirect:/startfun/mypage/openproject.do";
	}
	
	//후원프로젝트 정산요청
	public String requestCalculation(String projectNo) {
		
		Map<String, String> projectStatusMap = new HashMap<String, String>();
		projectStatusMap.put("projectNo", projectNo);
		projectStatusMap.put("projectStatus", "정산요청");
		
		try {
			MyPageDAO mypageDao = sqlsession.getMapper(MyPageDAO.class);
			mypageDao.updateProjectStatus(projectStatusMap);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		return "redirect:/startfun/mypage/openproject.do";
	}
	
	//후원스폰서 리스트
	public List<JoinSupportVO> getSupportSponsorList(int projectNo, Criteria cri) {
		
		List<JoinSupportVO> supportSponsorList = null;
		Map<String, Object> supportSponsorParam = new HashMap<String, Object>();
		supportSponsorParam.put("projectNo", projectNo);
		supportSponsorParam.put("cri", cri);
		
		try {
			MyPageDAO mypageDao = sqlsession.getMapper(MyPageDAO.class);
			supportSponsorList = mypageDao.getSupportSponsorList(supportSponsorParam);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		return supportSponsorList;
	}
	
	//후원스폰서 총 인원
	public int getSupportSponsorCount(int projectNo) {
		
		int result = 0;
		
		try {
			MyPageDAO mypageDao = sqlsession.getMapper(MyPageDAO.class);
			result = mypageDao.getSupportSponsorCount(projectNo);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	//후원스폰서 상태변경
	public String changeRewardStatus(String[] supportNo, String rewardStatus, int projectNo) {
		
		Map<String, String> rewardStatusMap = new HashMap<String, String>();
		String url = "";
		
		try {
			MyPageDAO mypageDao = sqlsession.getMapper(MyPageDAO.class);
			
			if(supportNo.length == 1) {
				rewardStatusMap.put("supportNo", supportNo[0]);
				rewardStatusMap.put("rewardStatus", rewardStatus);
				mypageDao.updateRewardStatus(rewardStatusMap);
				url = "redirect:/startfun/mypage/sponsor/support.do?no="+supportNo[0];
				
			}else {
				for(int i = 0; i < supportNo.length; i++) {
					rewardStatusMap.put("supportNo", supportNo[i]);
					rewardStatusMap.put("rewardStatus", rewardStatus);
					mypageDao.updateRewardStatus(rewardStatusMap);
				}
				url = "redirect:/startfun/mypage/sponsor/supportlist.do?no="+projectNo;
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		return url;
	}
	
	//후원스폰서 - 후원 참여 상세
	public JoinSupportVO getSupportSponsor(int supportNo) {
		
		JoinSupportVO supportSponsor = null;
		
		try {
			MyPageDAO mypageDao = sqlsession.getMapper(MyPageDAO.class);
			supportSponsor = mypageDao.getJoinSupport(supportNo);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		return supportSponsor;
	}
	
	//투자스폰서 리스트
	public List<JoinInvestVO> getInvestSponsorList(int projectNo, Criteria cri) {
		
		cri.setAmount(10);
		
		List<JoinInvestVO> investSponsorList = null;
		Map<String, Object> investSponsorParam = new HashMap<String, Object>();
		investSponsorParam.put("projectNo", projectNo);
		investSponsorParam.put("cri", cri);
		
		try {
			MyPageDAO mypageDao = sqlsession.getMapper(MyPageDAO.class);
			investSponsorList = mypageDao.getInvestSponsorList(investSponsorParam);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		return investSponsorList;
	}
	
	//투지스폰서 총 인원
	public int getInvestSponsorCount(int projectNo) {
		
		int result = 0;
		
		try {
			MyPageDAO mypageDao = sqlsession.getMapper(MyPageDAO.class);
			result = mypageDao.getInvestSponsorCount(projectNo);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	//투자스폰서 - 투자 참여 상세
	public JoinInvestVO getInvestSponsor(int investNo) {
		
		JoinInvestVO investSponsor = null;
		
		try {
			MyPageDAO mypageDao = sqlsession.getMapper(MyPageDAO.class);
			investSponsor = mypageDao.getInvestSponsor(investNo);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		return investSponsor;
	}
	
	//투자스폰서 채권증서 업로드
	public String uploadInvestBond(JoinInvestVO joinInvest, HttpServletRequest request) {
		
		if(!joinInvest.getBond_file().isEmpty()) {
			String filename = joinInvest.getBond_file().getOriginalFilename();
			String path = request.getServletContext().getRealPath("/upload");
			String fpath = path +"\\" +filename;
			
			FileOutputStream fs = null;
			try {
				fs = new FileOutputStream(fpath);
				fs.write(joinInvest.getBond_file().getBytes());
				
			}catch (Exception e) {
				System.out.println(e.getMessage());
			}finally {
				try {
					fs.close();
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}
			joinInvest.setInvest_bond(filename);
		}
		
		try {
			MyPageDAO mypageDao = sqlsession.getMapper(MyPageDAO.class);
			mypageDao.uploadInvestBond(joinInvest);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		return "redirect:/startfun/mypage/sponsor/invest.do?no="+joinInvest.getInvest_no();
	}
	
	//참여프로젝트 후원리스트
	public List<JoinSupportVO> getJoinSupportList(String email) {
		
		List<JoinSupportVO> joinSupportList = null;
		
		try {
			MyPageDAO mypageDao = sqlsession.getMapper(MyPageDAO.class);
			joinSupportList = mypageDao.getJoinSupportList(email);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		return joinSupportList;
	}
	
	//참여프로젝트 후원 상세 - 후원 참여 상세
	public JoinSupportVO getJoinSupport(int supportNo) {
		
		JoinSupportVO joinSupport = null;
		
		try {
			MyPageDAO mypageDao = sqlsession.getMapper(MyPageDAO.class);
			joinSupport = mypageDao.getJoinSupport(supportNo);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		return joinSupport;
	}
	
	//참여프로젝트 후원 배송지 수정
	public int editShipInfo(JoinSupportVO modifyShipInfo) {
		
		int result = 0;
		
		try {
			MyPageDAO mypageDao = sqlsession.getMapper(MyPageDAO.class);
			result = mypageDao.editShipInfo(modifyShipInfo);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	//참여프로젝트 후원 배송지 수정 결과
	public Map<String, String> getShipInfo(int supportNo) {
		
		Map<String, String> shipInfo = null;
		
		try {
			MyPageDAO mypageDao = sqlsession.getMapper(MyPageDAO.class);
			JoinSupportVO joinSupportInfo = mypageDao.getJoinSupport(supportNo);
			
			shipInfo = new HashMap<String, String>();
			shipInfo.put("ship_name", joinSupportInfo.getShip_name());
			shipInfo.put("ship_phone", joinSupportInfo.getShip_phone());
			shipInfo.put("ship_address", joinSupportInfo.getShip_address());
			shipInfo.put("ship_memo", joinSupportInfo.getShip_memo());
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		return shipInfo;
	}
	
	//참여프로젝트 후원 취소
	public String cancelJoinSupport(int supportNo) {
		
		try {
			MyPageDAO mypageDao = sqlsession.getMapper(MyPageDAO.class);
			mypageDao.cancelJoinSupport(supportNo);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		return "redirect:/startfun/mypage/join/supportlist.do";
	}

	//참여프로젝트 투자리스트
	public List<JoinInvestVO> getJoinInvestList(String email) {
		
		List<JoinInvestVO> joinInvestList = null;
		
		try {
			MyPageDAO mypageDao = sqlsession.getMapper(MyPageDAO.class);
			joinInvestList = mypageDao.getJoinInvestList(email);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		return joinInvestList;
	}
	
	//참여프로젝트 투자 상세 - 투자 참여 상세
	public JoinInvestVO getJoinInvest(int investNo) {
		
		JoinInvestVO joinInvest = null;
		
		try {
			MyPageDAO mypageDao = sqlsession.getMapper(MyPageDAO.class);
			joinInvest = mypageDao.getInvestSponsor(investNo);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		return joinInvest;
	}
	
	//참여프로젝트 후원 취소
	public String cancelJoinInvest(int investNo) {
		
		try {
			MyPageDAO mypageDao = sqlsession.getMapper(MyPageDAO.class);
			mypageDao.cancelJoinInvest(investNo);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		return "redirect:/startfun/mypage/join/investlist.do";
	}
	
	//후기쓰기
	public int writeReview(int project_no, String[] scoreArr, Principal principal) {
	     
	    int result = 0;
	    
	    ReviewVO reviewVO = new ReviewVO();
	    
	    for(int i=0; i<scoreArr.length; i++) {
	    	
	    	reviewVO.setProject_no(project_no);
	    	reviewVO.setReview_email(principal.getName());
	    	reviewVO.setReview_code(i+1);
	    	reviewVO.setReview_score(Integer.parseInt(scoreArr[i]));
	    	
	    	try {
	    		
	    		MyPageDAO mypageDao = sqlsession.getMapper(MyPageDAO.class);
	    		result = mypageDao.writeReview(reviewVO);
			
	    	} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
   	 	}
	     
	    return result; 
     }
	
	//후기작성 후 상태변경
	public int changeStatus(int support_no) {
		
		int result = 0;
		
		try {
			
			MyPageDAO mypageDao = sqlsession.getMapper(MyPageDAO.class);
			result = mypageDao.changeStatus(support_no);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
