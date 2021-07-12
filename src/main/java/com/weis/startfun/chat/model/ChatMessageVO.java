package com.weis.startfun.chat.model;

import lombok.Data;

/*
 * 본격적인 메시지 VO
 * 방번호와 메세지번호 PK
 * 
 * sessionCount는 현재 1:1 채팅방에 들어와있는 유저 수이다.
 * sessionCount가 2이면 unReadCount는 0으로 DB에 집어넣을 수 있겠다
 * [ => 2명이 들어와있으니 읽지않은 메세지는 없다. ]
 * sessionCount가 1이면 unReadCount는 1이 되는 것이다. 
 */
@Data
public class ChatMessageVO {
	
	private int room_id;		// 방 번호
	private String message_id;	// 메세지 번호
	private String message;		// 메세지 내용
	private String name;		// 보낸이 이름
	private String email;		// 보낸이 이메일
	private int unread_count;	// 안 읽은 메세지 수
	private int session_count;	// 현재 세션 수
	private String regtime;		// 보낸시간
	
}
