package com.weis.startfun.project.model;

import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.weis.startfun.member.model.MemberVO;


import lombok.Data;

@Data
public class ProjectVO {
	private int project_no;				//프로젝트번호
	private Integer project_category;	//프로젝트분야
	private String project_title;		//제목
	private String project_thumbnail;	//이미지
	private String project_video;		//동영상
	private String project_content;		//상세
	private String project_file;		//프로젝트관련파일
	private String project_start;		//펀딩시작일
	private String project_end;			//펀딩마감일
	private Integer project_goal;		//펀딩목표금액
	private String project_regdate;		//등록일
	private String project_status;		//상태
	private String project_email;		//스타터_이메일
	private String project_type;		//구분(후원 or 투자)
	
	//선희
	private int reportCount;            //신고횟수
	private int total; 					//총 후원투자금
	private int firstPay; 				//선지급금액
	private int balance; 				//잔금
	private int comm; 					//수수료(부가세포함)
	private int lastPay; 				//선지급액 + 잔금
	private String category_name; 		//프로젝트 카테고리 이름
	private String searchOption;		//검색 옵션
	private String search; 				//검색어
	
	private int dday; //남은기간(DB별칭)
	private int sponsor_count; //참여자수(DB별칭)
	private int rate; //달성률(DB별칭)
	private int done; //진행중,마감구분(DB별칭)

	private List<CommonsMultipartFile> files;	//이미지 + 프로젝트관련파일

	//보희
	private MemberVO memberVO; //resultMap조인
	private ProjectCategoryVO projectCategoryVO; //resultMap조인
	private InvestVO investVO; //resultMap조인
	
	//삭제예정
	private JoinSupportVO joinSupportVO;
	
}
