package com.weis.startfun.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.weis.startfun.admin.service.AdminService;
import com.weis.startfun.project.model.ProjectVO;
import com.weis.startfun.utils.Criteria;

@RestController
public class AdminAjaxController {

	@Autowired
	private AdminService adservice;

	//신청프로젝트 상태변경
	@RequestMapping("/updateStatus.do")
	public List<ProjectVO> updateStatus(@RequestParam(value="projectNo[]") String[] projectNo, String projectStatus,
			Criteria cri) {
		
		Map<String, Object> updateStatus = adservice.updateStatus(projectNo, projectStatus);
		List<ProjectVO> statusList = adservice.getRequestPaging(cri);
		
		return statusList;
		
	}
	
	// 신고상태 변경
	@RequestMapping("/updateReport.do")
	public void updateReport(int project_no) {
		
		int updateReport = adservice.updateReport(project_no);
		return;
		
	}
		
	// 정산상태 변경
	@RequestMapping("/updatePayment.do")
	public ProjectVO updatePayment(@RequestParam(defaultValue = "0") int project_no) {

		int status = adservice.updatePayment(project_no);
		ProjectVO list = adservice.payDetail(project_no);
		
		return list;
		
	}
}
