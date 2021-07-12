package com.weis.startfun.project.controller;

import java.io.File;
import java.net.URLEncoder;
import java.security.Principal;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.weis.startfun.admin.model.ReportVO;
import com.weis.startfun.member.model.FollowingVO;
import com.weis.startfun.member.model.WishVO;
import com.weis.startfun.project.model.JoinSupportVO;
import com.weis.startfun.project.model.ProjectVO;
import com.weis.startfun.project.model.RewardVO;
import com.weis.startfun.project.model.SupportVO;
import com.weis.startfun.project.service.JoinSupportService;
import com.weis.startfun.project.service.ProjectService;
import com.weis.startfun.utils.Criteria;
import com.weis.startfun.utils.PageDTO;

/*    
설 명 : JoinSupport Controller
작성일 : 2021.06.08
작성자 : 이보희 
*/
@Controller
@RequestMapping("/startfun/")
public class JoinSupportController {

	@Autowired
	private JoinSupportService joinSupportService;
	
	//후원형 프로젝트 리스트
	@RequestMapping("supportList.do") 
	public String getsupportList(String listSort, Criteria cri, Model model) throws ClassNotFoundException, SQLException {
		
		cri.setStartNum((cri.getPageNum()-1)*cri.getAmount());	//시작번호 정해주기
		
		List<ProjectVO> List = joinSupportService.getSupportList(cri); //리스트
		int projectCount = joinSupportService.getProjectCount(cri); //총 프로젝트 수
		
		model.addAttribute("List", List);
		model.addAttribute("type", "후원");
		model.addAttribute("pageMaker", new PageDTO(cri, projectCount));
		
		return "project/projectList";
	}
	
	
	
	
	//후원형 프로젝트 상세페이지
	@RequestMapping("supportDetail.do")
	public String supportDetail(int project_no, Model model, Principal principal) {
		//상세상단내용
		ProjectVO supportDetailTop = joinSupportService.getSupportDetailTop(project_no);
		//옵션
		List<RewardVO> optionList = joinSupportService.getSupportOption(project_no);
		//게시판내용
		SupportVO guide = joinSupportService.searchGuide(project_no);

		//팔로우여부
		ProjectVO projectEmail = joinSupportService.searchEmail(project_no); 
		FollowingVO follow = new FollowingVO();
		follow.setTo_user(projectEmail.getProject_email());
		
		if(principal != null) {
			follow.setFrom_user(principal.getName());
		}else {
			follow.setFrom_user("any");
		}
 		FollowingVO following = joinSupportService.searchFollowing_no(follow);
 		
 		//관심설정여부
 		WishVO wishVO = new WishVO(); 
 		wishVO.setProject_no(project_no);
 		
		if(principal != null) {
			wishVO.setEmail(principal.getName());
		}else {
			wishVO.setEmail("any");
		}
 		WishVO wish = joinSupportService.searchWish_no(wishVO);
		
 		//신고프로젝트 여부
 		ReportVO report = new ReportVO(); 
 		report.setProject_no(project_no);
 		
 		if(principal != null) {
 			report.setReport_email(principal.getName());
		}else {
			report.setReport_email("any");
		}
 		ReportVO report_no = joinSupportService.checkReport(report);
 		
		model.addAttribute("supportDetailTop", supportDetailTop);
		model.addAttribute("optionList", optionList);
		model.addAttribute("guide", guide);
 		model.addAttribute("following", following); 
 		model.addAttribute("wish", wish); 
 		model.addAttribute("report_no", report_no); 

		return "project/supportDetail";
	}

	//신고하기
	@RequestMapping(value = "supportReport.do", method = RequestMethod.POST)
	public String supportReport(ReportVO reportVO, Principal principal) {
		String url = null;

		try {
			url = joinSupportService.supportReport(reportVO, principal);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return url;
	}

	//후원하기 이동
	@RequestMapping(value = "joinSupport.do", method = RequestMethod.GET)
	public String joinSupport(int project_no, Model model, Principal principal) {
		
			ProjectVO supportDetailTop = joinSupportService.getSupportDetailTop(project_no);
			List<RewardVO> optionList = joinSupportService.getSupportOption(project_no);

			model.addAttribute("supportDetailTop", supportDetailTop);
			model.addAttribute("optionList", optionList);
		
		return "project/joinSupport";
	}

	//후원하기 다음단계(옵션선택)
	@RequestMapping(value = "joinSupportOption.do", method = RequestMethod.POST)
	public String joinSupportOption(RewardVO rewardVO, JoinSupportVO joinSupportVO, Model model) {

		RewardVO reward = joinSupportService.joinSupportOption(rewardVO);
		model.addAttribute("reward", reward);
		
		return "project/joinSupportNext";
	}
	
	//후원하기 처리
	@RequestMapping(value = "joinSupport.do", method = RequestMethod.POST)
	public String joinSupport(JoinSupportVO joinSupportVO, Principal principal) {

		String url = null;

		try {
			url = joinSupportService.joinSupport(joinSupportVO, principal);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return url;
	}
	
	//후원하기 완료
	@RequestMapping("completeSupportJoin.do") 
	public String completeJoin(Model model) {
				
		model.addAttribute("type", "support");
		
		return "project/completeJoin";
	}
	
	//프로젝트 관련 파일 다운로드(관리자)
	@RequestMapping(value="downloadFile.do")
	public void downloadBond(String project_file, HttpServletResponse response, HttpServletRequest request) throws Exception {
		
		//물리적 경로 얻기
	    String savepath = "upload";
		String downloadpath = request.getSession().getServletContext().getRealPath(savepath);
	    String FilePath = downloadpath + "\\" + project_file;
	    System.out.println(FilePath);
	    byte[] fileByte = FileUtils.readFileToByteArray(new File(FilePath));
	    
        response.setContentType("application/octet-stream");
        response.setContentLength(fileByte.length);
        response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(project_file, "UTF-8")+"\";");
        response.setHeader("Content-Transfer-Encoding", "binary");
        response.getOutputStream().write(fileByte);
          
        response.getOutputStream().flush();
        response.getOutputStream().close();
	}

}
