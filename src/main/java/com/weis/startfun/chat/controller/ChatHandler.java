package com.weis.startfun.chat.controller;

import java.util.ArrayList;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.catalina.tribes.MembershipService;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.weis.startfun.chat.model.ChatMessageVO;
import com.weis.startfun.chat.model.ChatRoomVO;
import com.weis.startfun.chat.service.ChatService;

@Controller
public class ChatHandler extends TextWebSocketHandler implements InitializingBean {

	@Autowired
	ChatService chatservice;
	
	private final ObjectMapper objectMapper = new ObjectMapper();
	
	// session, 회원 이메일
	private Map<WebSocketSession, String> memberSessionList = new ConcurrentHashMap<WebSocketSession, String>();
	
	// 채팅방 목록 <방 번호, ArrayList<session> >이 들어간다. 해당 방번호에 접속해있는 세션(회원)
	private Map<Integer, ArrayList<WebSocketSession>> RoomList = new ConcurrentHashMap<Integer, ArrayList<WebSocketSession>>();
	
	// session, 방 번호가 들어간다. 해당 세션(회원)이 가지고 있는 방번호
	private Map<WebSocketSession, Integer> sessionList = new ConcurrentHashMap<WebSocketSession, Integer>();
	
	private static int i;
	
	// websocket 연결 성공 시
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		i++;
	}

	// websocket 연결 종료 시
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		i--;
		// sessionList에 session이 있다면
		if(sessionList.get(session) != null) {
			// 해당 session의 방 번호를 가져와서, 방을 찾고, 그 방의 ArrayList<session>에서 해당 session을 지운다.
			RoomList.get(sessionList.get(session)).remove(session);
			sessionList.remove(session);
		}
		
		// memberSessionList에 session이 있다면
		if(memberSessionList.get(session) != null) {
			memberSessionList.remove(session);
		}
	}
	
	// websocket 메세지 수신 및 송신
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		// HandshakeInterceptor 에서 저장했던 회원 이메일
		Map<String, Object> map = session.getAttributes();
		String userEmail = (String) map.get("userEmail");
		
		// 헤더에 저장 될 세션 - 알림용
		if(message.getPayload().equals("alarm")) {
			memberSessionList.put(session, userEmail);
		} 
		
		// 채팅 시
		else {
		
		// 전달받은 메세지
		String msg = message.getPayload();
		
		// Json객체 -> Java객체
		// 출력값 : [room_id=123, messageId=null, message=asd, name=홍길동, email=user01@gmail.com, unread_count=0]
		ChatMessageVO chatMessage = objectMapper.readValue(msg, ChatMessageVO.class);
		
		// 받은 메세지에 담긴 room_id로 해당 채팅방을 찾아온다.
		ChatRoomVO chatRoom = chatservice.selectChatRoom(chatMessage.getRoom_id());
		
		// 채팅 세션 목록에 채팅방이 존재하지 않고, 처음 들어왔고(입장 시 message="ENTER_CHAT"로 보냄), DB에서의 채팅방이 있을 때
		// 채팅 세션 목록에 채팅방 생성
		if(RoomList.get(chatRoom.getRoom_id()) == null && chatMessage.getMessage().equals("ENTER-CHAT") && chatRoom != null) {
			
			// 채팅방에 들어갈 session들
			// Map<String, ArrayList<WebSocketSession>> RoomList
			ArrayList<WebSocketSession> sessionTwo = new ArrayList<>();
			// session 추가
			sessionTwo.add(session);
			// RoomList에 추가
			RoomList.put(chatRoom.getRoom_id(), sessionTwo);
			
			// sessionList에 추가
			// Map<WebSocketSession, String> sessionList
			sessionList.put(session, chatRoom.getRoom_id());
			
		}
		
		// 채팅방이 존재하고, 처음 들어왔고, DB에서의 채팅방이 있을 때
		else if(RoomList.get(chatRoom.getRoom_id()) != null && chatMessage.getMessage().equals("ENTER-CHAT") && chatRoom != null) {
			
			// RoomList에서 해당 방번호를 가진 방이 있는지 확인하고 해당 방번호에 session(회원)을 add 시킨다.
			RoomList.get(chatRoom.getRoom_id()).add(session);
			
			// sessionList에 추가
			sessionList.put(session, chatRoom.getRoom_id());
			
		}
		
		// 채팅방이 존재하고, 채팅 메세지를 입력했고, DB에서의 채팅방이 있을 때
		else if(RoomList.get(chatRoom.getRoom_id()) != null && !chatMessage.getMessage().equals("ENTER-CHAT") && chatRoom != null) {
			
			// 메세지에 이름, 이메일, 내용을 담는다.
			TextMessage textMessage = new TextMessage(chatRoom.getMaster_email() + "," +chatMessage.getName() + "," + chatMessage.getEmail() + "," + chatMessage.getMessage()+ ","+chatMessage.getRoom_id());
			
			// 현재 session 수
			int sessionCount = 0;
			
			// 해당 채팅방의 session에 뿌려준다.
			for(WebSocketSession sess : RoomList.get(chatRoom.getRoom_id())) {
				sess.sendMessage(textMessage);
				sessionCount++;
			}
			
			/*
			알림 보내기
			알림을 받는 사람(receiver) 지정하기
			1. user가 보낸경우 - master
			2. master가 답장한 경우 - user
			*/
			String receiver;
			
			if (chatRoom.getUser_email().equals(chatMessage.getEmail())) {
				receiver = chatRoom.getMaster_email();
			} 
			else {
				receiver = chatRoom.getUser_email();
			}
			
			/*
			// value값만 알고있는 상태 -> value값으로 key값을 찾기
			Set<Map.Entry<WebSocketSession, String>> entries = memberSessionList.entrySet();
			for (Map.Entry<WebSocketSession, String> entry : entries) {
				if(entry.getValue()==receiver) {
					entry.getKey().sendMessage(new TextMessage("알림"));
				}
			}
			*/
			
			for ( WebSocketSession sess : memberSessionList.keySet() ) {
				if(memberSessionList.get(sess).equals(receiver)) {
					sess.sendMessage(textMessage);
				}
			}
			
			// 동적쿼리에서 사용할 sessionCount 저장
			// sessionCount == 2 일 때는 unread_count = 0,
			// sessionCount == 1 일 때는 unread_count = 1
			chatMessage.setSession_count(sessionCount);
			
			// DB에 저장한다.
			int a = chatservice.insertMessage(chatMessage);
		}
		}
	}

	@Override
	public void afterPropertiesSet() throws Exception {}
	

}
