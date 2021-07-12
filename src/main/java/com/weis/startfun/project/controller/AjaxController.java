package com.weis.startfun.project.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.weis.startfun.member.model.FollowingVO;
import com.weis.startfun.member.model.MemberVO;
import com.weis.startfun.member.model.WishVO;
import com.weis.startfun.project.model.ProjectVO;
import com.weis.startfun.project.model.ReviewVO;
import com.weis.startfun.project.service.JoinSupportService;

/* 
설 명 : RestController 
작성일 : 2021.06.12
작성자 : 이보희 
*/
@RestController
@RequestMapping("/startfun/")
public class AjaxController {

	@Autowired
	private JoinSupportService joinSupportService;
	
	//후기탭(항목별 평균)
	@RequestMapping(value = "supportReview.do", method = RequestMethod.POST)
	public List<ReviewVO> getReviewAvg(@RequestParam("project_no") int project_no) {
		
		List<ReviewVO> reviewList = joinSupportService.getReviewAvg(project_no);
		
		return reviewList;
	}
     
 	//팔로우
 	@RequestMapping(value = "follow.do", method = RequestMethod.POST)
 	public Map<String , String> followProject(int project_no, Principal principal) {
 		
 		Map<String , String> mapResult = new HashMap<String, String>();
    	
 		ProjectVO projectEmail = joinSupportService.searchEmail(project_no);
 		
 		FollowingVO follow = new FollowingVO();
 		follow.setFrom_user(principal.getName());
 		follow.setTo_user(projectEmail.getProject_email());

 		FollowingVO following_no = joinSupportService.searchFollowing_no(follow);
 		
 		if(following_no == null) {
 			joinSupportService.doFollow(follow);
 			mapResult.put("result", "success");
 		}else {
 			joinSupportService.delFollow(following_no);
 			mapResult.put("result", "cancell");
 		}
 		return mapResult;
 	}
 	
 	//관심프로젝트
 	@RequestMapping(value = "wishProject.do", method = RequestMethod.POST)
 	public Map<String , String> wishProject(int project_no, Principal principal) {
 		
 		Map<String , String> mapResult = new HashMap<String, String>();
    	
 		WishVO wishVO = new WishVO();
 		wishVO.setProject_no(project_no);
 		wishVO.setEmail(principal.getName());
 		
 		WishVO wish_no = joinSupportService.searchWish_no(wishVO);

 		if(wish_no == null) {
 			joinSupportService.doWishProject(wishVO);
 			mapResult.put("result", "success");
 		}else {
 			joinSupportService.delWishProject(wish_no);
 			mapResult.put("result", "cancell");
 		}
 		return mapResult;
 	}
 	
 	//로그인 사용자 타입구분(일반/법인)
	@RequestMapping(value = "memberType.do", method = RequestMethod.POST)
	public String getReviewAvg(@RequestParam("member_email") String member_email) {
		
		MemberVO memberVO = joinSupportService.searchMember_Type(member_email);
		String type = memberVO.getMember_type();
		
		return type;
	}
}
