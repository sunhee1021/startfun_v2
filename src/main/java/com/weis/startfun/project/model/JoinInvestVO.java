package com.weis.startfun.project.model;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.weis.startfun.member.model.MemberVO;

import lombok.Data;

/* 
설 명 : JoinInvest VO 
작성일 : 2021.06.05
작성자 : 이보희 
*/
@Data
public class JoinInvestVO {

	private int invest_no; //투자번호
	private int project_no; //프로젝트번호
	private String sponsor_email; //참여회원이메일
	private String invest_dt; //투자일
	private int invest_amount; //투자금액
	private String invest_status; //결제상태
	private String invest_bond; //채권증서
	private String merchant_uid; //결제번호
	
	private CommonsMultipartFile bond_file; //파일 업로드
	
	private MemberVO member; //join member
	private ProjectVO project; //join project
	private ProjectCategoryVO project_category; //join project_category
}
