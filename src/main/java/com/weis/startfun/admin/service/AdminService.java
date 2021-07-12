package com.weis.startfun.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.weis.startfun.admin.model.AdminDAO;
import com.weis.startfun.admin.model.AdminPayDAO;
import com.weis.startfun.admin.model.ReportVO;
import com.weis.startfun.project.model.ProjectVO;
import com.weis.startfun.utils.Criteria;

@Service
public class AdminService {

	@Autowired
	private SqlSession sqlsession;

	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	// 신청프로젝트 리스트
	public List<ProjectVO> requestList(Criteria cri) {

		AdminDAO admindao = sqlsession.getMapper(AdminDAO.class);
		List<ProjectVO> list = admindao.requestList(cri);

		return list;
	}
	
	// 신청프로젝트 페이징
	public List<ProjectVO> getRequestPaging(Criteria cri) {

		AdminDAO admindao = sqlsession.getMapper(AdminDAO.class);
		List<ProjectVO> list = admindao.getRequestPaging(cri);

		return list;
	}
	
	// 승인프로젝트 페이징
	public List<ProjectVO> getPermitPaging(Criteria cri) {

		AdminDAO admindao = sqlsession.getMapper(AdminDAO.class);
		List<ProjectVO> list = admindao.getPermitPaging(cri);
		
		for (int i = 0; i <= list.size() - 1; i++) {
			int tempCount = admindao.getReportCount(list.get(i).getProject_no());
			list.get(i).setReportCount(tempCount);
		}

		return list;
	}
	
	// 신고내역 리스트
	public List<ReportVO> reportList(@RequestParam(defaultValue = "0") int project_no) {

		AdminDAO admindao = sqlsession.getMapper(AdminDAO.class);
		List<ReportVO> report = admindao.reportList(project_no);

		return report;
	}

	// 신고내역 건수
	public int countReport(@RequestParam(defaultValue = "0") int project_no) {

		AdminDAO admindao = sqlsession.getMapper(AdminDAO.class);
		int countList = admindao.getReportCount(project_no);

		return countList;
	}

	// 정산 상세내역
	public ProjectVO payDetail(@RequestParam(defaultValue = "0") int project_no) {

		ProjectVO payDetail = null;
		AdminPayDAO adminPaydao = sqlsession.getMapper(AdminPayDAO.class);

		payDetail = adminPaydao.payDetail(project_no);

		return payDetail;
	}
	
	//신청프로젝트 총 개수
	public int totalRequestCount(Criteria cri) {
		
		AdminDAO admindao = sqlsession.getMapper(AdminDAO.class);
		int total = admindao.totalRequestCount(cri);
		
		return total;
	}
	
	//승인프로젝트 총 개수
	public int totalPermitCount() {
		
		AdminDAO admindao = sqlsession.getMapper(AdminDAO.class);
		int total = admindao.totalPermitCount();
		
		return total;
	}
	
	//신청프로젝트 총 검색개수
	public int searchRequestTotal(Criteria cri) {
		AdminDAO admindao = sqlsession.getMapper(AdminDAO.class);
		int total = admindao.searchRequestTotal(cri);
		
		return total;
	}
	
	//승인프로젝트 총 검색개수
	public int searchPermitTotal(Criteria cri) {
		AdminDAO admindao = sqlsession.getMapper(AdminDAO.class);
		int total = admindao.searchPermitTotal(cri);
		
		return total;
	}
	
	// 신청프로젝트 상태 변경
	public Map<String, Object> updateStatus(String[] projectNo, String projectStatus) {

		Map<String, Object> statusMap = new HashMap<String, Object>();

		AdminDAO admindao = sqlsession.getMapper(AdminDAO.class);

		for (int i = 0; i < projectNo.length; i++) {
			statusMap.put("projectNo", projectNo[i]);
			statusMap.put("projectStatus", projectStatus);
			admindao.updateStatus(statusMap);
		}

		return statusMap;
	}
		
	// 신고상태 변경
	public int updateReport(int projectNo) {
		
		int status = 0;
		
		AdminDAO admindao = sqlsession.getMapper(AdminDAO.class);
		status = admindao.updateReport(projectNo);
			
		return status;
	}
	
	// 정산상태 변경(정산완료)
	public int updatePayment(@RequestParam(defaultValue = "0") int project_no) {

		int status = 0;
		
		AdminDAO admindao = sqlsession.getMapper(AdminDAO.class);
		status = admindao.updatePayment(project_no);

		return status;
	}
}
