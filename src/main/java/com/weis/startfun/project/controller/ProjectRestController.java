package com.weis.startfun.project.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.util.Collection;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.weis.startfun.chat.model.ChatRoomVO;
import com.weis.startfun.chat.service.ChatService;
import com.weis.startfun.project.model.ProjectCategoryVO;
import com.weis.startfun.project.service.ProjectService;

@RestController
@RequestMapping("/startfun/project/")
public class ProjectRestController {
	
	@Autowired
	private ProjectService service;
	
	@Autowired
	private ChatService chatService;
	
	
	// 카테고리 가져오기
	@RequestMapping(value="projectCategory.do", method = RequestMethod.GET)
	public List<ProjectCategoryVO> getProjectCategory(){
		return service.getProjectCategory();
	}
	
	// 썸머노트 이미지 업로드
	@RequestMapping(value="uploadSummernoteImageFile.do", produces = "application/json; charset=utf8")
	public String uploadSummernoteFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request) {
		JsonObject jsonObject = new JsonObject();
		
		String path = request.getServletContext().getRealPath("/upload"); //경로
		String filename = UUID.randomUUID() + multipartFile.getOriginalFilename();	//파일명
		
		//저장경로
		String fpath = path + "\\" + filename;
		File f = new File(fpath);
		
		if(!f.exists()) {
			f.mkdir();
		}
		
		try {
			multipartFile.transferTo(f);
			jsonObject.addProperty("url", "/upload/"+filename);
		} catch (IllegalStateException | IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		System.out.println("업로드 url"+fpath);
		
		return jsonObject.toString();
	}
	
	// 권한 체크 후 role_company면 문의 요청 알림 수 가져오기
	@RequestMapping(value="alarmCount.do")
	public List<ChatRoomVO> alarmCount(HttpServletRequest request, Principal principal) {
		
		List<ChatRoomVO> roomList = null;
		
		System.out.println("alarmCount");
		
		Collection<? extends GrantedAuthority> auth =  SecurityContextHolder.getContext().getAuthentication().getAuthorities();
		
		System.out.println("auth : "+auth);

		if (auth != null) {
			roomList = chatService.selectUnReadRoomCount(principal.getName());
			System.out.println(roomList);
			return roomList;
		} else {
			return roomList;
		}
	}
}
