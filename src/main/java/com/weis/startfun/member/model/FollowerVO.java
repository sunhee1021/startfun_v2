package com.weis.startfun.member.model;

import lombok.Data;

/*    
	설 명 : follower VO    
	작성일 : 2021.06.05
	작성자 : 정수빈 
*/
@Data
public class FollowerVO {

	private int follower_no; //팔로워번호
	private String from_user; //from email
	private String to_user; //to email
	
	private MemberVO member; //join member
}
