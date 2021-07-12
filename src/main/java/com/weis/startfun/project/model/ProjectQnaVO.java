package com.weis.startfun.project.model;

import lombok.Data;

@Data
public class ProjectQnaVO {
	private int qna_no;
	private int project_no;
	private String qna_email;
	private String qna_regdate;
	private String qna_content;
	private String qna_reply;
}
