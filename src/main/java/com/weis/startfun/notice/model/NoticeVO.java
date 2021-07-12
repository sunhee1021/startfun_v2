package com.weis.startfun.notice.model;

import lombok.Data;

@Data
public class NoticeVO {
	private int notice_no;
	private String notice_title;
	private String notice_content;
	private String notice_regdate;
}
