package com.weis.startfun.utils;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {

	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private Criteria cri;
	
	public PageDTO(Criteria cri, int total) { //생성자로 Criteria와 전체 데이터 수(total)을 파라미터로 지정
		this.cri = cri;
		this.total = total;
		
		//페이징의 끝 번호 계산 (페이지 번호가 10개씩 보인다고 가정했을 때)
		//Math.ceil() -> 소수점을 올림으로 처리
		//ex ) 3페이지 : Math.ceil(0.3) * 10 = 10
		//ex ) 11페이지 : Math.ceil(1.1) * 10 = 20 
		// <이전 1 2 3 4 5 6 7 8 9 10 다음>
		this.endPage = (int)(Math.ceil(cri.getPageNum() / 10.0)) * 10;
		
		//페이징의 시작 번호 계산
		//화면에 10개씩 보여준다면 시작번호(startPage) 무조건 끝 번호 - 9
		this.startPage = this.endPage - 9;
		
		//total을 통한 endPage의 재계산
		//끝 번호 (totalPage)는 전체 데이터 수(total)에 의해 영향을 받음.
		//10개씩 보여주고, 전체 데이터 수가 80개 => 끝 번호 8
		//만일 끝 번호(endPage)와 한 페이지당 출력되는 데이터 수(amount)의 곱이
		//전체 데이터 수(total)보다 크면? 끝 번호는 다시 total을 이용하여 다시 계산
		int realEnd = (int)(Math.ceil((total * 1.0) / cri.getAmount()));
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		//이전계산 시작 번호(startPage)가 1보다 큰 경우 존재
		this.prev = this.startPage > 1;
		
		//다음계산 realEnd가 끝 번호(endPage)보다 큰 경우 존재
		this.next = this.endPage < realEnd;
		
		System.out.println("realEnd: "+realEnd);
		System.out.println("endPage: "+endPage);
	}
	
}
