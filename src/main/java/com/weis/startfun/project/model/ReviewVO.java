package com.weis.startfun.project.model;

import lombok.Data;

/*    
설 명 : review VO    
작성일 : 2021.06.5
작성자 : 정수빈 
*/
@Data
public class ReviewVO {

	private int review_no; //후기번호
	private String review_email; //회원이메일
	private int review_code; //평가항목
	private int review_score; //점수
	private int project_no; //프로젝트번호
  
	private String[] scoreArr; //후기점수배열
	
    private double review_avg; //항목별평균(DB별칭)
    private int review_count; //후기작성자수(DB별칭)
}
