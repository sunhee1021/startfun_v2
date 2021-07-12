package com.weis.startfun.member.model;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import lombok.Data;

@Data
public class MemberVO {
	
	private String member_email; // 이메일
	private String member_password; // 비밀번호
	private String member_name; // 이름 
	private String member_phone; // 휴대폰
	private String member_regdate; // 가입일
	private String member_profile; // 프로필사진
	private String member_introduce; // 소개
	private String member_status; // 상태
	private String member_type; // 구분
	private String member_sns; // SNS연동
	private String member_company; // 기업명
	private String member_brn; // 사업자 등록번호
	private String member_crn; // 법인 등록번호
	private String member_enabled; // 활성상태
	private String member_emailkey; // 인증번호
	
	private CommonsMultipartFile member_file; //파일 업로드
	
}
