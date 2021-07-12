package com.weis.startfun.project.model;

import lombok.Data;

@Data
public class ProjectNoticeVO {
	private int notice_no;
	private String notice_regdate;
	private String notice_title;
	private String notice_content;
	private int project_no;
}
