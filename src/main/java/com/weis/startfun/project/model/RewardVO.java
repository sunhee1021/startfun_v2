package com.weis.startfun.project.model;

import java.util.List;

import lombok.Data;

/*    
설 명 : rewardVO   
작성일 : 2021.06.05
작성자 : 조하선
*/
@Data
public class RewardVO {
	private Integer reward_no; // 리워드번호
	private String reward_compose; // 리워드구성
	private Integer reward_price; // 리워드금액
	private String reward_ship_type;// 배송조건
	private Integer reward_charge; // 배송료
	private String due_date; // 배송예정일
	private Integer reward_order; // 노출순서
	private Integer project_no; // 프로젝트번호

	private List<RewardVO> RewardVOList; // 리워드리스트a

	private int sponsor_count; // 참여인원(DB별칭)

	private JoinSupportVO joinSupportVO; // resultMap조인
	private ProjectVO projectVO; //resultMap조인
}
