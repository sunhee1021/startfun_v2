package com.weis.startfun.member.model;

import lombok.Data;

@Data
public class MemberAuthVO {

	public int authority_code; // 권한
	public String email; // 이메일
}
