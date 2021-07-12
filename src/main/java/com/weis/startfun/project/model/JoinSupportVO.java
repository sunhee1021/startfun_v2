package com.weis.startfun.project.model;

import com.weis.startfun.member.model.MemberVO;

import lombok.Data;

/* 
설 명 : JoinSupport VO 
작성일 : 2021.06.05
작성자 : 이보희 
*/
@Data
public class JoinSupportVO {

	private int support_no; //후원번호
	private int project_no; //프로젝트번호
	private String sponsor_email; //참여회원이메일
	private String support_dt; //후원일
	private int support_reward; //리워드
	private int support_amount; //후원금액
	private Integer support_add_amount; //추가참여금
	private String reward_status; //리워드상태
	private String support_status; //결제상태
	private String ship_name; //받는사람
	private String ship_phone; //연락처
	private String ship_address; //주소
	private String ship_memo; //배송메모
	
	private String payment_dt; //결제예정일(DB별칭)
	private int total; //마이페이지 getSupportSponsorList total
	
	private MemberVO member; //join member
	private RewardVO reward; //join reward
	private ProjectVO project; //join project
	private ProjectCategoryVO project_category; //join project_category

	//삭제예정
	private int rate; //달성률(DB별칭)
	private int sponsor_count; //참여자수(DB별칭)
	private int dday; //남은기간(DB별칭)
}
