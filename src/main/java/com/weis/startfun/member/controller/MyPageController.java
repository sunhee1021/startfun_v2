package com.weis.startfun.member.controller;

import java.io.File;
import java.net.URLEncoder;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.weis.startfun.member.model.FollowerVO;
import com.weis.startfun.member.model.FollowingVO;
import com.weis.startfun.member.model.MemberVO;
import com.weis.startfun.member.model.WishVO;
import com.weis.startfun.member.service.MyPageService;
import com.weis.startfun.project.model.JoinInvestVO;
import com.weis.startfun.project.model.JoinSupportVO;
import com.weis.startfun.project.model.ProjectVO;
import com.weis.startfun.utils.Criteria;
import com.weis.startfun.utils.PageDTO;

/*    
	설 명 : MyPage Controller 
	작성일 : 2021.06.05
	작성자 : 정수빈 
*/
@Controller
@RequestMapping("/startfun/mypage/")
public class MyPageController {
	
	@Autowired
	private MyPageService mypageService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	//마이페이지 계정정보
	@RequestMapping(value="account.do", method=RequestMethod.GET)
	public ModelAndView editMember(ModelAndView mv, Principal principal) {
		
		System.out.println(principal.getName());
		
		MemberVO member = mypageService.editMember(principal.getName());
		mv.addObject("member", member);
		mv.setViewName("mypage/updateMember");
		
		return mv;
	}
	
	//마이페이지 계정정보 수정
	@RequestMapping(value="account.do", method=RequestMethod.POST)
	public String editMember(MemberVO member, HttpServletRequest request) {
		
		member.setMember_password(bCryptPasswordEncoder.encode(member.getMember_password()));
		System.out.println(member.getMember_password());
		
		String url = mypageService.editMember(member, request);
		
		return url;
	}
	
	//마이페이지 계정정보 탈퇴
	@RequestMapping(value="withdraw.do")
	public String withdrawMember(Principal principal, HttpSession sessoin) {
		System.out.println(principal.getName());
		String url = mypageService.withdrawMember(principal.getName(), sessoin);
		return url;
	}
	
	//관심프로젝트 리스트
	@RequestMapping(value="wish.do")
	public ModelAndView getWishList(ModelAndView mv, Principal principal) {
		
		List<WishVO> wishList = mypageService.getWishList(principal.getName());
		mv.addObject("list", wishList);
		mv.setViewName("mypage/wish");
		
		return mv;
	}
	
	//팔로잉리스트
	@RequestMapping(value="following.do")
	public ModelAndView getFollowing(ModelAndView mv, Principal principal) {
		
		List<FollowingVO> followingList = mypageService.getFollowingList(principal.getName());
		mv.addObject("list", followingList);
		mv.setViewName("mypage/following");
		
		return mv;
	}
	
	//팔로워리스트
	@RequestMapping(value="follower.do")
	public ModelAndView getFollower(ModelAndView mv, Principal principal) {
		
		List<FollowerVO> followerList = mypageService.getFollowerList(principal.getName());
		mv.addObject("list", followerList);
		mv.setViewName("mypage/follower");
		
		return mv;
	}
	
	//개설프로젝트리스트
	@RequestMapping(value="openproject.do")
	public ModelAndView getOpenProjectList(ModelAndView mv, Principal principal) {
		
		List<ProjectVO> openProjectList = mypageService.getOpenProjectList(principal.getName());
		mv.addObject("list", openProjectList);
		mv.setViewName("mypage/openproject");
		
		return mv;
	}
	
	//개설프로젝트 삭제
	@RequestMapping(value="projectdelete.do")
	public String deleteProject(int no) {
		
		String url = mypageService.deleteProject(no);
		return url;
	}
	
	//후원프로젝트 정산요청
	@RequestMapping(value="requestcal.do")
	public String requestCalculation(String no) {
		
		String url = mypageService.requestCalculation(no);
		return url;
	}
	
	//후원스폰서 리스트
	@RequestMapping(value="sponsor/supportlist.do")
	public ModelAndView getSupportSponsorList(ModelAndView mv, int no, Criteria cri) {
		
		cri.setStartNum((cri.getPageNum()-1)*cri.getAmount());	//시작번호 정해주기
		cri.setAmount(10); //10개씩
		
		List<JoinSupportVO> supportSponsorList = mypageService.getSupportSponsorList(no, cri);
		int sponsorCount = mypageService.getSupportSponsorCount(no);
		
		mv.addObject("list", supportSponsorList);
		mv.addObject("pageMaker", new PageDTO(cri, sponsorCount));
		mv.setViewName("mypage/sponsor/supportlist");
		
		return mv;
	}
	
	//후원스폰서 상태변경
	@RequestMapping(value="sponsorstatus.do")
	public String changeRewardStatus(String[] support_no, String reward_status, int project_no) {
		
		System.out.println(support_no);
		String url = mypageService.changeRewardStatus(support_no, reward_status, project_no);
		
		return url;
	}
	
	//후원스폰서
	@RequestMapping(value="sponsor/support.do")
	public ModelAndView getSupportSponsor(ModelAndView mv, int no) {
		
		JoinSupportVO supportSponsor = mypageService.getSupportSponsor(no);
		mv.addObject("support", supportSponsor);
		mv.setViewName("mypage/sponsor/support");
		
		return mv;
	}
	
	//투자스폰서 리스트
	@RequestMapping(value="sponsor/investlist.do")
	public ModelAndView getInvestSponsorList(ModelAndView mv, int no, Criteria cri) {
		
		cri.setStartNum((cri.getPageNum()-1)*cri.getAmount());	//시작번호 정해주기
		
		List<JoinInvestVO> investSponsorList = mypageService.getInvestSponsorList(no, cri);
		int sponsorCount = mypageService.getInvestSponsorCount(no);
		
		mv.addObject("list", investSponsorList);
		mv.addObject("pageMaker", new PageDTO(cri, sponsorCount));
		mv.setViewName("mypage/sponsor/investlist");
		
		return mv;
	}
	
	//투자스폰서
	@RequestMapping(value="sponsor/invest.do")
	public ModelAndView getInvestSponsor(ModelAndView mv, int no) {
		
		JoinInvestVO investSponsor = mypageService.getInvestSponsor(no);
		mv.addObject("invest", investSponsor);
		mv.setViewName("mypage/sponsor/invest");
		
		return mv;
	}
	
	//투자스폰서 채권증서 업로드
	@RequestMapping(value="sponsor/uploadbond.do", method=RequestMethod.POST)
	public String uploadInvestBond(JoinInvestVO joinInvest , HttpServletRequest request) {
		
		System.out.println(joinInvest);
		String url = mypageService.uploadInvestBond(joinInvest, request);
		
		return url;
	}
	
	//참여프로젝트 후원리스트
	@RequestMapping(value="join/supportlist.do")
	public ModelAndView getJoinSupportList(ModelAndView mv, Principal principal) {
		
		List<JoinSupportVO> joinSupportList = mypageService.getJoinSupportList(principal.getName());
		mv.addObject("list", joinSupportList);
		mv.setViewName("mypage/join/supportlist");
		
		return mv;
	}
	
	//참여프로젝트 후원 상세 - 후원 참여 상세
	@RequestMapping(value="join/support.do")
	public ModelAndView getJoinSupport(ModelAndView mv, int no) {
		
		JoinSupportVO joinSupport = mypageService.getJoinSupport(no);
		mv.addObject("support", joinSupport);
		mv.setViewName("mypage/join/support");
		
		return mv;
	}
	
	//참여프로젝트 후원 취소
	@RequestMapping(value="join/supportcancel.do")
	public String cancelJoinSupport(int no) {
		
		String url = mypageService.cancelJoinSupport(no);
		
		return url;
	}
	
	//참여프로젝트 투자리스트
	@RequestMapping(value="join/investlist.do")
	public ModelAndView getJoinInvestList(ModelAndView mv, Principal principal) {
		
		List<JoinInvestVO> joinInvestList = mypageService.getJoinInvestList(principal.getName());
		mv.addObject("list", joinInvestList);
		mv.setViewName("mypage/join/investlist");
		
		return mv;
	}
	
	//참여프로젝트 투자 상세
	@RequestMapping(value="join/invest.do")
	public ModelAndView getJoinInvest(ModelAndView mv, int no) {
		
		JoinInvestVO joinInvest = mypageService.getJoinInvest(no);
		mv.addObject("invest", joinInvest);
		mv.setViewName("mypage/join/invest");
		
		return mv;
	}
	
	//참여프로젝트 투자 취소
	@RequestMapping(value="join/investcancel.do")
	public String cancelJoinInvest(int no) {
		
		String url = mypageService.cancelJoinInvest(no);
		
		return url;
	}
	
	//참여프로젝트 투자 채권 다운로드
	@RequestMapping(value="join/downloadbond.do")
	public void downloadBond(String invest_bond, HttpServletResponse response, HttpServletRequest request) throws Exception {
		
		//물리적 경로 얻기
	    String savepath = "upload";
		String downloadpath = request.getSession().getServletContext().getRealPath(savepath);
	    String FilePath = downloadpath + "\\" + invest_bond;
	    System.out.println(FilePath);
	    byte[] fileByte = FileUtils.readFileToByteArray(new File(FilePath));
	    
        response.setContentType("application/octet-stream");
        response.setContentLength(fileByte.length);
        response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(invest_bond, "UTF-8")+"\";");
        response.setHeader("Content-Transfer-Encoding", "binary");
        response.getOutputStream().write(fileByte);
          
        response.getOutputStream().flush();
        response.getOutputStream().close();
	}
	
	//후원
	@RequestMapping(value="sponsor/sponsorexcel.do")
	public void sponsorExcelDown(HttpServletResponse response, int no) throws Exception {
		
		Criteria cri = new Criteria();
		cri.setStartNum(0);
		cri.setAmount(mypageService.getSupportSponsorCount(no));
		
		List<JoinSupportVO> supportSponsorList = mypageService.getSupportSponsorList(no, cri);
		
		//워크북 생성
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("후원프로젝트_스폰서목록");
		Row row = null;
		Cell cell = null;
		int rowNo = 0;

		//폰트지정
		//테이블 헤더용 스타일
		CellStyle headStyle = wb.createCellStyle();
		//가는 경계선
	    headStyle.setBorderTop(BorderStyle.THIN);
	    headStyle.setBorderBottom(BorderStyle.THIN);
	    headStyle.setBorderLeft(BorderStyle.THIN);
	    headStyle.setBorderRight(BorderStyle.THIN);
	    //노랑색 배경
		headStyle.setFillForegroundColor(HSSFColorPredefined.GOLD.getIndex());
		headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	    // 데이터용 경계 스타일 테두리만 지정
	    CellStyle bodyStyle = wb.createCellStyle();
	    bodyStyle.setBorderTop(BorderStyle.THIN);
	    bodyStyle.setBorderBottom(BorderStyle.THIN);
	    bodyStyle.setBorderLeft(BorderStyle.THIN);
	    bodyStyle.setBorderRight(BorderStyle.THIN);

	    // 헤더 생성
	    row = sheet.createRow(rowNo++);
	    cell = row.createCell(0);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("후원번호");
	    cell = row.createCell(1);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("이메일");
	    cell = row.createCell(2);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("금액");
	    cell = row.createCell(3);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("참여일");
	    cell = row.createCell(4);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("결제상태");
	    cell = row.createCell(5);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("리워드상태");
	    cell = row.createCell(6);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("받는사람");
	    cell = row.createCell(7);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("연락처");
	    cell = row.createCell(8);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("주소");
	    cell = row.createCell(9);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("메모");
	    
	    for(JoinSupportVO js : supportSponsorList) {
	        row = sheet.createRow(rowNo++);

	        cell = row.createCell(0);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(js.getSupport_no());

	        cell = row.createCell(1);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(js.getSponsor_email());

	        cell = row.createCell(2);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(js.getTotal());
	        
	        cell = row.createCell(3);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(js.getSupport_dt());
	        
	        cell = row.createCell(4);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(js.getSupport_status());
	        
	        cell = row.createCell(5);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(js.getReward_status());
	        
	        cell = row.createCell(6);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(js.getShip_name());
	        
	        cell = row.createCell(7);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(js.getShip_phone());
	        
	        cell = row.createCell(8);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(js.getShip_address());
	        
	        cell = row.createCell(9);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(js.getShip_memo());
	    }
	    
	    // 컨텐츠 타입과 파일명 지정
	    SimpleDateFormat format = new SimpleDateFormat( "yyMMdd");
	    Calendar time = Calendar.getInstance();
	    String format_time = format.format(time.getTime());
	    
	    int projectNo = supportSponsorList.get(0).getProject_no();
	    String fileName = "[프로젝트"+projectNo+"]스폰서리스트_"+format_time+".xls";
	    fileName = URLEncoder.encode(fileName,"UTF-8");
	    
	    response.setContentType("application/ms-excel; charset=UTF-8"); 
	    response.setCharacterEncoding("UTF-8");
	    response.setHeader("Content-Disposition", "attachment;filename="+fileName);

	    // 엑셀 출력
	    wb.write(response.getOutputStream());
	    wb.close();
	}
	
	//실시간 문의 2021-06-24 조하선 추가
	@RequestMapping(value="liveChatList.do")
	public String liveChatList() { 
		
		
		
		return "mypage/sponsor/chatlist"; 
	}
}
