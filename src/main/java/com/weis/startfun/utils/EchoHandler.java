package com.weis.startfun.utils;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

/*    
설 명 : EchoHandler 채팅
작성일 : 2021.06.18
작성자 : 조하선
*/
@RequestMapping("/echo")
public class EchoHandler extends TextWebSocketHandler {

	//세션 리스트
	//private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	// (<"bang_id", 방ID>, <"session", 세션>) - (<"bang_id", 방ID>, <"session", 세션>) - (<"bang_id", 방ID>, <"session", 세션>) .. 형태
	private List<Map<String, Object>> sessionList = new ArrayList<Map<String,Object>>();
	
	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	
	@Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		super.handleTextMessage(session, message);
		
		//JSON --> Map으로 변환
		ObjectMapper objectMapper = new ObjectMapper();
		Map<String, String> mapReceive = objectMapper.readValue(message.getPayload(), Map.class);
		System.out.println("message.getPlayload() : "+message.getPayload());
		
		switch (mapReceive.get("cmd")) {
		
		//CLIENT 입장
		case "CMD_ENTER":
			//세션 리스트에 저장
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("bang_id", mapReceive.get("bang_id"));		//방번호
			map.put("session", session);						//세션
			sessionList.add(map);								//세션리스트에 추가
			
			//같은 채팅방에 입장 메시지 전송
			for(int i = 0; i < sessionList.size(); i++) {
				
				if(sessionList.get(i).get("bang_id").equals(mapReceive.get("bang_id"))) {
					Map<String, String> mapToSend = new HashMap<String, String>();
					mapToSend.put("bang_id", (String) sessionList.get(i).get("bang_id"));
					mapToSend.put("cmd", "CMD_ENTER");
					mapToSend.put("msg", session.getId()+"님이 상담을 요청 했습니다.");
					
					String jsonStr = objectMapper.writeValueAsString(mapToSend);
					((WebSocketSession) sessionList.get(i).get("session")).sendMessage(new TextMessage(jsonStr));
				}
			}
			break;

		//CLIENT 메세지
		case "CMD_MSG_SEND":
			//같은 채팅방에 메세지 전송
			for(int i = 0; i < sessionList.size(); i++) {
				if(sessionList.get(i).get("bang_id").equals(mapReceive.get("bang_id"))) {
					Map<String, String> mapToSend = new HashMap<String, String>();
					mapToSend.put("bang_id", (String) sessionList.get(i).get("bang_id"));
					mapToSend.put("cmd", "CMD_MSG_SEND");
					mapToSend.put("msg", session.getId()+" : "+mapReceive.get("msg"));
					
					String jsonStr = objectMapper.writeValueAsString(mapToSend);
					((WebSocketSession) sessionList.get(i).get("session")).sendMessage(new TextMessage(jsonStr));
				}
			}
			break;
		}
	
	}
	
	//클라이언트 연결을 끊었을 때 실행
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    	
    	super.afterConnectionClosed(session, status);
    	
    	ObjectMapper objectMapper = new ObjectMapper();
    	String now_bang_id = "";
    	
    	//사용자 세션을 리스트에서 제거
    	for(int i = 0; i < sessionList.size(); i++) {
    		if(session.equals(sessionList.get(i).get("session"))) {
    			now_bang_id = (String) sessionList.get(i).get("bang_id");
    			sessionList.remove(sessionList.get(i));
    		}
    	}
    	
    	//같은 채팅방에 퇴장 메시지 전송
    	for(int i = 0; i < sessionList.size(); i++) {
    		if(sessionList.get(i).get("bang_id").equals(now_bang_id)) {
    			Map<String, String> mapToSend = new HashMap<String, String>();
    			mapToSend.put("bang_id", (String) sessionList.get(i).get("bang_id"));
    			mapToSend.put("cmd", "CMD_EXIT");
    			mapToSend.put("msg", session.getId()+"님과의 상담이 종료되었습니다.");
    			
    			String jsonStr = objectMapper.writeValueAsString(mapToSend);
    			((WebSocketSession) sessionList.get(i).get("session")).sendMessage(new TextMessage(jsonStr));
    		}
    	}
    }
	
	
	
	/*
	//클라이언트가 연결 되었을 때 실행
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        sessionList.add(session);
        logger.info("{} 연결됨", session.getId()); 
    }

    //클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
        //모든 유저에게 메세지 출력
        for(WebSocketSession sess : sessionList){
            sess.sendMessage(new TextMessage(message.getPayload()));
        }
    }
    
    //클라이언트 연결을 끊었을 때 실행
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        sessionList.remove(session);
        logger.info("{} 연결 끊김.", session.getId());
    }
	 */	
}
