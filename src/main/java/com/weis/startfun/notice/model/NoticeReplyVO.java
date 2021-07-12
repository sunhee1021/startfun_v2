package com.weis.startfun.notice.model;

import lombok.Data;

@Data
public class NoticeReplyVO {
	private int notice_no; //공지글 번호
	private int reply_no; //댓글 번호
	private String reply_content; //댓글 내용
	private String reply_email; //댓글 작성자
	private String reply_regdate; //댓글 등록일
}
