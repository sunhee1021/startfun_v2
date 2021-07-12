package com.weis.startfun.member.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.weis.startfun.member.model.FollowingVO;
import com.weis.startfun.member.service.MyPageService;
import com.weis.startfun.project.model.JoinSupportVO;

@RestController
@RequestMapping("/startfun")
public class MyPageAjaxController {
	
	@Autowired
	private MyPageService mypageService;
	
	//팔로잉리스트
	@RequestMapping(value="following.do")
	public List<FollowingVO> getFollowing(Principal principal) {
		
		List<FollowingVO> followingList = mypageService.getFollowingList(principal.getName());
		
		return followingList;
	}
	
	//팔로잉취소
	@RequestMapping(value="followingcancel.do")
	public ResponseEntity<String> cancelFollowing(int following_no) {
		
		mypageService.cancelFollowing(following_no);
		ResponseEntity<String> entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
	}
	
	
	//참여프로젝트 후원 배송지 수정
	@RequestMapping(value="/modifyship.do")
	public ResponseEntity<String> modifyShipInfo(@RequestBody JoinSupportVO shipInfo) {
		
		mypageService.editShipInfo(shipInfo);
		ResponseEntity<String> entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
	}
	
	//참여프로젝트 후원 배송지 수정 결과
	@RequestMapping(value="/shipinfo.do")
	public Map<String , String> getShipInfo(String support_no) {
		
		Map<String , String> shipInfo = new HashMap<String, String>();
		shipInfo = mypageService.getShipInfo(Integer.parseInt(support_no));
		
		return shipInfo;
	}
	
	//후기작성완료
	@RequestMapping(value = "/writeReviewDone.do", method = RequestMethod.POST)
	public Map<String , Integer> writeReview(int project_no, @RequestParam("scoreArr[]") String[] scoreArr, int support_no, Principal principal) {
	 	System.out.println(project_no +" "+ scoreArr +" "+ support_no);
		
		Map<String , Integer> mapResult = new HashMap<String, Integer>();
		
		int result = mypageService.writeReview(project_no, scoreArr, principal);
		mypageService.changeStatus(support_no);
	
		if (result > 0) {
			mapResult.put("result", result);
		} else {
			mapResult.put("result", result);
		}
		return mapResult;
	}
}
