package com.weis.startfun.admin.model;

import java.util.List;
import java.util.Map;

import com.weis.startfun.member.model.MemberVO;
import com.weis.startfun.project.model.ProjectVO;
import com.weis.startfun.utils.Criteria;

public interface AdminDAO {

	// 개인회원 리스트
	public List<MemberVO> userList(Criteria cri);

	// 개인회원 수정
	public int updateUser(MemberVO vo);

	// 법인회원 리스트
	public List<MemberVO> companyList(Criteria cri);

	// 법인회원 수정
	public int updateCompany(MemberVO vo);

	// 개인회원 상세
	public MemberVO getList(String email);

	// 법인회원 상세
	public MemberVO getCompanyList(String email);

	// 법인회원 수정
	public int companyEdit(MemberVO vo);

	// 개인회원 수
	public int getUserCount();

	// 법인회원 수
	public int getCompanyCount();

	// 개인회원 검색(이메일)
	public List<MemberVO> searchUser(String email);

	// 개인회원 검색(이름)
	public List<MemberVO> searchUserName(String name);

	// 법인회원 검색(이메일)
	public List<MemberVO> searchCompany(String email);

	// 법인회원 검색(이름)
	public List<MemberVO> searchCompanyName(String name);

	// 프로젝트 차트
	public List<Map<String, Object>> chartProject();

	// 프로젝트 차트(투자)
	public int chartInvest();

	// 프로젝트 차트(후원)
	public int chartSupport();

	// 메인 프로젝트 현황
	public List<ProjectVO> mainProject(Criteria cri);
	
	/////////////////////////////////////////////////////////////////////////

	// 신청프로젝트 리스트
	public List<ProjectVO> requestList(Criteria cri);

	// 신청프로젝트 리스트
	public List<ProjectVO> getRequestPaging(Criteria cri);

	// 승인프로젝트 리스트
	public List<ProjectVO> getPermitPaging(Criteria cri);

	// 총 신청검색건수
	public int searchRequestTotal(Criteria cri);

	// 총 승인검색건수
	public int searchPermitTotal(Criteria cri);

	// 신고리스트
	public List<ReportVO> reportList(int project_no);

	// 총 신고건수
	public int getReportCount(int project_no);

	// 총 리스트 개수
	public int totalListCount();

	// 총 신청리스트 개수
	public int totalRequestCount(Criteria cri);

	// 총 승인리스트 개수
	public int totalPermitCount();

	// 신청프로젝트 상태변경
	public int updateStatus(Map<String, Object> statusMap);

	// 승인프로젝트 정산 상태변경
	public int updatePayment(int project_no);

	// 신고프로젝트 상태변경
	public int updateReport(int projectNo);
}
