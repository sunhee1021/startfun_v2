package com.weis.startfun.chat.model;

import com.weis.startfun.project.model.ProjectVO;

import lombok.Data;


/*
 *  채팅방 VO
 *  방번호와 사용자 - 상대방의 정보가 담겨있다.
 *  roomID로 채팅방을 구분하며,
 *  unReadCount를 통해 읽었는지 파악 할 수 있게 해준다.
 */
@Data
public class ChatRoomVO {

	private int room_id; 	// 방 번호

	private int project_no; 		// 문의 요청 한 프로젝트 번호 
	
	private String user_email;	// 사용자 이메일
	private String user_name;	// 사용자 이름
	private String user_pic;	// 사용자 사진

	private String master_email;// 상대방 이메일
	private String master_name;	// 상대방 이름
	private String master_pic;	// 상대방 사진

	private int unread_count;	// 안 읽은 메시지 수
	
	private String project_title;	// 프로젝트 제목
	private String project_type;	// 프로젝트 타입 ( 후원형 / 투자형 )
	private String last_message;	// 마지막 메시지
	private String regtime;			// 마지막 메시지 작성시간
	private String member_company;	// 회사명 ( 투자형일때는 회사명으로 보여준다 )
	
}
