package com.weis.startfun.member.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.weis.startfun.project.model.JoinInvestVO;
import com.weis.startfun.project.model.JoinSupportVO;
import com.weis.startfun.project.model.ProjectVO;
import com.weis.startfun.project.model.ReviewVO;
import com.weis.startfun.utils.Criteria;

/*    
	설 명 : MyPage DAO 
	작성일 : 2021.06.05
	작성자 : 정수빈 
*/
public interface MyPageDAO {
	
	//마이페이지 계정정보
	public MemberVO getMember(String email) throws ClassNotFoundException, SQLException;
	//마이페이지 계정정보 수정
	public int updateMember(MemberVO member) throws ClassNotFoundException, SQLException;
	//마이페이지 계정정보 탈퇴
	public int withdrawMember(String email) throws ClassNotFoundException, SQLException;
	//팔로잉 리스트
	public List<FollowingVO> getFollowingList(String fromEmail) throws ClassNotFoundException, SQLException;
	//팔로잉 취소
	public int delFollowing(int followingNo) throws ClassNotFoundException, SQLException;
	//팔로워 리스트
	public List<FollowerVO> getFollowerList(String toEmail) throws ClassNotFoundException, SQLException;
	//관심프로젝트 리스트
	public List<WishVO> getWishList(String email) throws ClassNotFoundException, SQLException;
	//개설프로젝트 리스트
	public List<ProjectVO> getOpenProjectList(String email) throws ClassNotFoundException, SQLException;
	//개설프로젝트 삭제
	public int deleteProject(int projectNo) throws ClassNotFoundException, SQLException;
	//개설프로젝트 상태변경
	public int updateProjectStatus(Map<String, String> projectStatusMap) throws ClassNotFoundException, SQLException;
	//후원스폰서 리스트
	public List<JoinSupportVO> getSupportSponsorList(Map<String, Object> supportSponsorParam) throws ClassNotFoundException, SQLException;
	//후원스폰서 총 인원
	public int getSupportSponsorCount(int projectNo) throws ClassNotFoundException, SQLException;
	//후원스폰서 상태변경
	public int updateRewardStatus(Map<String, String> rewardStatusMap) throws ClassNotFoundException, SQLException;
	//후원 참여 상세
	public JoinSupportVO getJoinSupport(int supportNo) throws ClassNotFoundException, SQLException;
	//투자스폰서 리스트
	public List<JoinInvestVO> getInvestSponsorList(Map<String, Object> investSponsorParam) throws ClassNotFoundException, SQLException;
	//투자스폰서 총 인원
	public int getInvestSponsorCount(int projectNo) throws ClassNotFoundException, SQLException;
	//투자 참여 상세
	public JoinInvestVO getInvestSponsor(int investNo) throws ClassNotFoundException, SQLException;
	//투자스폰서 채권증서 업로드
	public int uploadInvestBond(JoinInvestVO joinInvest) throws ClassNotFoundException, SQLException;
	//참여프로젝트 후원리스트
	public List<JoinSupportVO> getJoinSupportList(String email) throws ClassNotFoundException, SQLException;
	//참여프로젝트 후원 배송지 수정
	public int editShipInfo(JoinSupportVO shipInfo) throws ClassNotFoundException, SQLException;
	//참여프로젝트 후원 취소
	public int cancelJoinSupport(int supportNo) throws ClassNotFoundException, SQLException;
	//참여프로젝트 투자리스트
	public List<JoinInvestVO> getJoinInvestList(String email) throws ClassNotFoundException, SQLException;
	//참여프로젝트 투자 취소
	public int cancelJoinInvest(int investNo) throws ClassNotFoundException, SQLException;
	//후기쓰기
	public int writeReview(ReviewVO reviewVO) throws ClassNotFoundException, SQLException;
	//후기작성 후 상태변경
	public int changeStatus(int support_no) throws ClassNotFoundException, SQLException;
}
