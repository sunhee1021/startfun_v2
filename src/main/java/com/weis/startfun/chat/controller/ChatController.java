package com.weis.startfun.chat.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.print.attribute.standard.JobStateReason;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.weis.startfun.chat.model.ChatMessageVO;
import com.weis.startfun.chat.model.ChatRoomVO;
import com.weis.startfun.chat.model.ChatSession;
import com.weis.startfun.chat.service.ChatService;
import com.weis.startfun.member.model.MemberVO;
import com.weis.startfun.member.service.MyPageService;
import com.weis.startfun.member.service.ProfileService;
import com.weis.startfun.project.service.ProjectService;

@Controller
@RequestMapping("/startfun/")
public class ChatController {
	
	@Autowired
	ChatService chatService;
	
	@Autowired
	ProjectService projectService;
	
	@Autowired
	MyPageService mypageService;	// 로그인한 회원 id로 회원정보 가져오기 위함
	
	@Autowired
	private ChatSession chatSession;
	
	// 해당 채팅방의 채팅 메세지 불러오기
	@RequestMapping(value="{room_id}.do")
	public void messageList(@PathVariable String room_id, String user_email, Model model, HttpServletResponse response) throws JsonIOException, IOException {
		
		List<ChatMessageVO> messageList = chatService.messageList(Integer.parseInt(room_id));
		response.setContentType("application/json; charset=utf-8");
		
		// 방에 들어오면서 메세지를 읽음 -> unread_count 1(안읽은상태)에서 0(읽은상태)로 바꿔주기
		ChatMessageVO message = new ChatMessageVO();
		message.setEmail(user_email);
		message.setRoom_id(Integer.parseInt(room_id));
		chatService.updateCount(message);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(messageList, response.getWriter());
	}
	
	// 채팅 방이 없을 때 생성
	@ResponseBody
	@RequestMapping("createChat.do")
	public String createChat(ChatRoomVO room, Principal principal, String user_name, String master_email, String project_no) {
		
		String user_email = principal.getName();
		
		MemberVO user = mypageService.editMember(user_email);
		
		room.setUser_email(user_email);					// 실시간 채팅을 요청한 회원
		room.setUser_name(user.getMember_name());
		room.setUser_pic(user.getMember_profile());
		
		MemberVO master = mypageService.editMember(master_email);
		
		room.setMaster_email(master.getMember_email());	// 실시간 채팅 대상 스타터
		room.setMaster_name(master.getMember_name());
		room.setMaster_pic(master.getMember_profile());
		
		room.setProject_no(Integer.parseInt(project_no));
		
		ChatRoomVO exist = chatService.searchChatRoom(room);
		
		// DB에 방이 없을 때
		if(exist == null) {
			// 방 만들고 방 번호 가져오기
			int result = chatService.createChat(room);
			if(result != 0) {	// 채팅방 생성 - 채팅방 번호 반환
				return Integer.toString(room.getRoom_id());
			} else {			// 채팅방 생성 못함 - 에러
				return "fail";
			}
		}
		// DB에 방이 있을 때
		else {
			return Integer.toString(exist.getRoom_id());	// 방 번호
		}
	}
	
	// 채팅 방 목록 불러오기
	@RequestMapping("chatRoomList.do")
	public void createChat(ChatRoomVO room, ChatMessageVO message, String type, String user_email, HttpServletResponse response ) throws JsonIOException, IOException {
		Map<String,String> map = new HashMap<String,String>();
		map.put("email", user_email);
		map.put("type", type); 	// master or user ( 내 프로젝트 문의 / 내가 보낸 문의 )
		
		List<ChatRoomVO> chatList = chatService.chatRoomList(map);
		
		//읽지 않은 메세지 수 저장
		for(int i = 0; i < chatList.size(); i++) {
			message.setRoom_id(chatList.get(i).getRoom_id());
			message.setEmail(user_email);
			int count = chatService.selectUnReadCount(message);
			chatList.get(i).setUnread_count(count);
		}
		
		response.setContentType("application/json; charset=utf-8");
		
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(chatList, response.getWriter());
		
	}
	
	/*
	 * 로그인 유저 뿌려주는거같은데..
	@RequestMapping("chatSession.do")
	public void chatSession(HttpServletResponse response) {
		
		ArrayList<String> chatSessionList = chatService.
	}*/
}
