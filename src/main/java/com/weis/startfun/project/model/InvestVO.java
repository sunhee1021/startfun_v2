package com.weis.startfun.project.model;

import lombok.Data;

@Data
public class InvestVO {
	private String interest_rate;	//표면이자율
	private String deposit_date;	//입고일
	private Integer min_amount;		//최소투자금액
	private Integer pay_period;		//이자지급주기
	private Integer expiry_date;	//만기일수
	private int project_no;			//프로젝트번호
	
	private int invest_limit; //투자한도(DB별칭)
}
