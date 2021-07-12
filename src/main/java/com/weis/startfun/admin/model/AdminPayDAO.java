package com.weis.startfun.admin.model;

import java.util.List;

import com.weis.startfun.project.model.JoinSupportVO;
import com.weis.startfun.project.model.ProjectVO;

public interface AdminPayDAO {

		/* 총 후원투자금 확인 */
		public List<JoinSupportVO> finalPayment(int project_no, String project_status);

		/* 정산 리스트 */
		public ProjectVO payDetail(int project_no);

		
	}


