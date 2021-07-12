package com.weis.startfun.chat.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weis.startfun.chat.model.ChatDAO;
import com.weis.startfun.chat.model.ChatMessageVO;
import com.weis.startfun.chat.model.ChatRoomVO;

@Service
public class ChatService {
	
	@Autowired
	private SqlSession sqlsession;

	// 방 번호를 선택하는 메소드
	public ChatRoomVO selectChatRoom(int roomId) {
		
		ChatDAO chatdao = sqlsession.getMapper(ChatDAO.class);
		
		return chatdao.selectChatRoom(roomId);
	}
	
	// 채팅 메세지 DB 저장
	public int insertMessage(ChatMessageVO chatMessage) {
		
		ChatDAO chatdao = sqlsession.getMapper(ChatDAO.class);
		
		return chatdao.insertMessage(chatMessage);
	}
	
	// 메세지 내용 리스트 출력
	public List<ChatMessageVO> messageList(int room_id) {
		
		ChatDAO chatdao = sqlsession.getMapper(ChatDAO.class);
		
		return chatdao.messageList(room_id);
	}
	
	// 채팅 방 DB 저장
	public int createChat(ChatRoomVO room) {
		
		ChatDAO chatdao = sqlsession.getMapper(ChatDAO.class);
		
		return chatdao.createChat(room);
	}
	
	// DB에 채팅 방이 있는지 확인
	public ChatRoomVO searchChatRoom(ChatRoomVO room) {
		
		ChatDAO chatdao = sqlsession.getMapper(ChatDAO.class);
		
		return chatdao.searchChatRoom(room);
	}
	
	// 채팅 방 리스트 출력
	public List<ChatRoomVO> chatRoomList(Map<String, String> map) {
		
		ChatDAO chatdao = sqlsession.getMapper(ChatDAO.class);
		
		return chatdao.chatRoomList(map);
	}
	
	// 채팅 읽지 않은 메세지 수 출력
	public int selectUnReadCount(ChatMessageVO message) {
		
		ChatDAO chatdao = sqlsession.getMapper(ChatDAO.class);
		
		return chatdao.selectUnReadCount(message);
	}
	
	// 읽은 메세지 숫자 0으로 바꾸기
	public int updateCount(ChatMessageVO message) {
		
		ChatDAO chatdao = sqlsession.getMapper(ChatDAO.class);
		
		return chatdao.updateCount(message);
	}
	
	// 확인하지 않은 채팅방
	public List<ChatRoomVO> selectUnReadRoomCount(String master_email) {
		
		ChatDAO chatdao = sqlsession.getMapper(ChatDAO.class);
		
		return chatdao.selectUnReadRoomCount(master_email);
	}
}
