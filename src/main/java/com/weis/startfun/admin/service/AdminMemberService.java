package com.weis.startfun.admin.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weis.startfun.admin.model.AdminDAO;
import com.weis.startfun.member.model.MemberDAO;
import com.weis.startfun.member.model.MemberVO;
import com.weis.startfun.project.model.ProjectVO;
import com.weis.startfun.utils.Criteria;

@Service
public class AdminMemberService {

	private SqlSession sqlsession;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	// 개인회원 리스트
	public List<MemberVO> userList(Criteria cri) {
		cri.setAmount(10);
		AdminDAO admindao = sqlsession.getMapper(AdminDAO.class);
		List<MemberVO> list = admindao.userList(cri);
		return list;

	}

	// 법인회원 리스트
	public List<MemberVO> companyList(Criteria cri) {
		cri.setAmount(10);
		AdminDAO admindao = sqlsession.getMapper(AdminDAO.class);
		List<MemberVO> list = admindao.companyList(cri);
		return list;
	}

	// 프로젝트 리스트
	public List<ProjectVO> mainProject(Criteria cri) {

		cri.setAmount(10);
		AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
		List<ProjectVO> list = dao.mainProject(cri);

		return list;
	}

	// 개인회원 상세
	public MemberVO getUserList(String email) {
		AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
		MemberVO vo = dao.getList(email);

		return vo;
	}

	// 개인회원 수정
	public String userEdit(MemberVO vo, HttpServletRequest request) {
		AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
		int result = dao.updateUser(vo);
		return "redirect:userEdit.do?member_email=" + vo.getMember_email();
	}

	// 법인회원 상세
	public MemberVO getCompanyList(String email) {
		AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
		MemberVO vo = dao.getCompanyList(email);
		return vo;
	}

	// 법인회원 수정
	public String updateCompany(MemberVO vo, HttpServletRequest request) {
		AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
		int result = dao.updateCompany(vo);
		return "redirect:companyEdit.do?member_email=" + vo.getMember_email();
	}

	// 개인회원 수
	public int getUserCount() {
		AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
		int result = dao.getUserCount();
		return result;

	}

	// 법인회원 수
	public int getCompanyCount() {
		AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
		int result = dao.getCompanyCount();
		return result;
	}

	// 프로젝트 수
	public int totalListCount() {
		AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
		int result = dao.totalListCount();
		return result;
	}

	// 개인회원 검색(이메일)
	public List<MemberVO> searchUser(String email) {
		AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
		List<MemberVO> result = dao.searchUser(email);
		return result;
	}

	// 개인회원 검색(이름)
	public List<MemberVO> searchUserName(String name) {
		AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
		List<MemberVO> result = dao.searchUserName(name);
		return result;
	}

	// 법인회원 검색(이메일)
	public List<MemberVO> searchCompany(String email) {
		AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
		List<MemberVO> result = dao.searchCompany(email);
		return result;
	}

	// 법인회원 검색(이름)
	public List<MemberVO> searchCompanyName(String name) {
		AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
		List<MemberVO> result = dao.searchCompanyName(name);
		return result;
	}

	// 프로젝트 차트
	public List<Map<String, Object>> chartProject() {
		AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
		List<Map<String, Object>> result = dao.chartProject();
		return result;
	}

	// 프로젝트 차트(투자)
	public int chartInvest() {
		AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
		int result = dao.chartInvest();
		return result;
	}

	// 프로젝트 차트(후원)
	public int chartSupport() {
		AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
		int result = dao.chartSupport();
		return result;
	}

	// 개인회원 중복체크
		public int idCheck(String member_email){
			MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
			int result = dao.idCheck(member_email);
			return result;
		}
		
		// 법인회원 중복체크
		public int companyIdCheck(String company_email){
			MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
			int result = dao.companyIdCheck(company_email);
			return result;
		}
}
