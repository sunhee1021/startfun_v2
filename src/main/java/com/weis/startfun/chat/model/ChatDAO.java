package com.weis.startfun.chat.model;

import java.util.List;
import java.util.Map;

public interface ChatDAO {
	
	// 방 번호로 채팅방 선택 - 방 번호
	public ChatRoomVO selectChatRoom(int room_id);
	
	// 채팅 메세지 DB 저장
	public int insertMessage(ChatMessageVO chatMessage);
	
	// 메세지 내용 리스트
	public List<ChatMessageVO> messageList(int room_id);
	
	// 채팅 방 생성
	public int createChat(ChatRoomVO room);
	
	// DB에 채팅 방 있는지 확인 - 유저이메일 & 마스터이메일
	public ChatRoomVO searchChatRoom(ChatRoomVO room);
	
	// 채팅 방 리스트 출력 
	public List<ChatRoomVO> chatRoomList(Map<String, String> map);
	
	// 채팅 읽지 않은 메세지 수 출력
	public int selectUnReadCount(ChatMessageVO message);
	
	// 읽은 메세지 숫자 0으로 바꾸기
	public int updateCount(ChatMessageVO message);
	
	// 확인하지 않은 새로운 채팅방
	public List<ChatRoomVO> selectUnReadRoomCount(String master_email);
}
