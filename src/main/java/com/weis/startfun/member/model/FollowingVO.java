package com.weis.startfun.member.model;

import lombok.Data;

/*    
	설 명 : following VO    
	작성일 : 2021.06.05
	작성자 : 정수빈 
*/
@Data
public class FollowingVO {

	private int following_no; //팔로잉번호
	private String from_user; //from email
	private String to_user; //to email
	
	private MemberVO member; //join member
}
