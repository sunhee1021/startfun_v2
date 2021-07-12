package com.weis.startfun.chat.controller;

import java.util.Map;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

public class HandshakeInterceptor extends HttpSessionHandshakeInterceptor {
	
	
	/*
	ChatHandler보다 앞서 실행되는 HttpSessionHandshakeInterceptor 인터셉터를 이용하여 이용자의 HttpSession에 접속하고 세션에 저장된 내용을
	WebSocketHandler로 전달해주면 WebSocketHandler 안에서도 이용자의 ID 등 필요한 이용자 정보를 사용하고 관리할 수 있게 된다.
	*/
	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Map<String, Object> map) throws Exception {
		// Map이 핸들러에게 보내줄 정보를 담는 통이된다.
		
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println("유저 이메일 : "+user.getUsername());
		
		map.put("userEmail", user.getUsername());
		//map.put("userEmail", "hong");
		
		return super.beforeHandshake(request, response, wsHandler, map);
	}
	
}
