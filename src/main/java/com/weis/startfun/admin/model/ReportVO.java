package com.weis.startfun.admin.model;

import lombok.Data;

@Data
public class ReportVO {
	private int report_no;
	private int project_no;
	private String report_email;
	private int report_code;
	private String report_category;
	private String report_reason;
	private String report_regdate;
	private String project_status; //DB join 추가
}
