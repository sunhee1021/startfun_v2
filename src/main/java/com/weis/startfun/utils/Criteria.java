package com.weis.startfun.utils;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	
	private int pageNum;	//페이지 번호
	private int amount;		//한 페이지당 몇 개의 데이터를 보여줄 것인지
	private int startNum;	//시작 글번호
	private int skip;
	
	private String keyword;
	private String listSort;
	private String category;
	private String status;
	private String type;
	
	public Criteria() {
		this(1, 8);		//기본값 1페이지, 8개
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.skip = (pageNum-1) *amount;
	}
	
	public void setPageNum(int pageNum) {
		this.skip = (pageNum-1)*this.amount;
		this.pageNum = pageNum;
	}
	
	public void setAmount(int amount) {
		this.skip = (this.pageNum-1)*amount;
		this.amount = amount;
	}
	
}
