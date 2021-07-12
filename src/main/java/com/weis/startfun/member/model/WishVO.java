package com.weis.startfun.member.model;

import com.weis.startfun.project.model.ProjectCategoryVO;
import com.weis.startfun.project.model.ProjectVO;

import lombok.Data;

/*    
	설 명 : wish VO    
	작성일 : 2021.06.05
	작성자 : 정수빈 
*/
@Data
public class WishVO {
	
	private int wish_no;
	private int project_no;
	private String email;

	//wish join으로 인한 컬럼 중복
	private int support_sponsor_count;
	private int support_total;
	private int support_rate;
	private int invest_sponsor_count;
	private int invest_total;
	private int invest_rate;
	
	private ProjectVO project; //join project
	private MemberVO member; //join member
	private ProjectCategoryVO project_category; //join project_category
	
}
