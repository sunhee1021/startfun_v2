package com.weis.startfun.member.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.weis.startfun.member.model.FollowerVO;
import com.weis.startfun.member.model.FollowingVO;
import com.weis.startfun.member.model.MemberVO;
import com.weis.startfun.member.service.MyPageService;
import com.weis.startfun.member.service.ProfileService;
import com.weis.startfun.project.model.ProjectVO;
import com.weis.startfun.project.service.JoinSupportService;
import com.weis.startfun.project.service.ProjectService;

@Controller
@RequestMapping("/startfun/profile/*")
public class ProfileController {

	@Autowired
	private ProfileService profileservice;
	
	//프로필 페이지(main 출력)
	@RequestMapping(value="profile.do")
	public String getMember(String member_email, Model model, Principal principal) {
		MemberVO member = profileservice.getMainIR(member_email);
		List<ProjectVO> projectlist = profileservice.getProjects(member_email);
		int followerCt = profileservice.followerCount(member_email);
		int followingCt = profileservice.followingrCount(member_email);
		
		//팔로우여부
		FollowingVO follow = new FollowingVO();
		follow.setTo_user(member_email);
		
		if(principal != null) {
			follow.setFrom_user(principal.getName());
		}else {
			follow.setFrom_user("any");
		}
		FollowingVO following = profileservice.searchFollowing_no(follow);
		
		model.addAttribute("member",member);
		model.addAttribute("projectlist",projectlist);
		model.addAttribute("followerCt",followerCt);
		model.addAttribute("followingCt",followingCt);
		model.addAttribute("following",following);
		
		//System.out.println("개설 프로젝트: "+list);
		return "profile/profile";
	}
	
	//프로필 소개 값(ajax)
	@RequestMapping(value = "memberIR.do", method = RequestMethod.GET)
	@ResponseBody
	public MemberVO memberIR(@RequestParam String member_email) {
		return profileservice.getMainIR(member_email);
	}
	
	//프로필 개설 프로젝트(ajax)
	@RequestMapping(value = "projectList.do", method = RequestMethod.GET)
	@ResponseBody
	public List<ProjectVO> projectList(@RequestParam String project_email){
		return profileservice.getProjects(project_email);
	}
	
	//프로필 팔로우
	@RequestMapping(value = "addFollow.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> follow(String member_email, Principal principal) {
		Map<String, String> result = new HashMap<String, String>();
		FollowingVO follow = new FollowingVO();
		
		follow.setFrom_user(principal.getName());
		follow.setTo_user(member_email);
		
		FollowingVO following_no = profileservice.searchFollowing_no(follow);
		
		if(following_no == null) {
			profileservice.doFollow(follow);
			result.put("result", "success");
		}else {
			profileservice.delFollow(following_no);
			result.put("result", "cancel");
		}
		return result;
	}
}
