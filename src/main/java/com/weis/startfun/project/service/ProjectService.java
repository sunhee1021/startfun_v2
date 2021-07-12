package com.weis.startfun.project.service;

import java.io.FileOutputStream;
import java.security.Principal;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.weis.startfun.project.model.InvestVO;
import com.weis.startfun.project.model.ProjectCategoryVO;
import com.weis.startfun.project.model.ProjectDAO;
import com.weis.startfun.project.model.ProjectVO;
import com.weis.startfun.project.model.RewardVO;
import com.weis.startfun.project.model.SupportVO;
import com.weis.startfun.utils.Criteria;


/*    
설 명 : projectService   
작성일 : 2021.06.07
작성자 : 조하선
*/
@Service
public class ProjectService {

	@Autowired
	private SqlSession sqlsession;

	//후원형 프로젝트 등록
	@Transactional(rollbackFor=Exception.class) 
	public String supportProjectReg(ProjectVO project, SupportVO support, RewardVO reward, HttpServletRequest request,
			Principal principal) throws Exception {

		ProjectDAO projectdao = sqlsession.getMapper(ProjectDAO.class);
		
		//파일업로드 처리
		fileUpload(project, request);

		//project insert
		//email - principal
		project.setProject_email(principal.getName());
		
		//'' -> null 처리해주기
		if(project.getProject_title().equals("")) {		//제목
			//현재 시간 구하기
			SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date = dateformat.format(System.currentTimeMillis());
			project.setProject_title(date+" 임시저장된 프로젝트");
		}
		if(project.getProject_video().equals("")) {		//동영상
			project.setProject_video(null);
		}
		if(project.getProject_content().equals("")) {	//상세
			project.setProject_content(null);
		}
		if(project.getProject_start().equals("")) {		//시작일
			project.setProject_start(null);
		}
		if(project.getProject_end().equals("")) {		//마감일
			project.setProject_end(null);
		}
		
		projectdao.insertProject(project); //project insert 후, pk 값 받아오기
		

		//support insert
		support.setProject_no(project.getProject_no());
		projectdao.insertSupport(support);

		//reward insert
		for (int i = 0; i < reward.getRewardVOList().size(); i++) {		//리워드 갯수만큼 반복
			reward.getRewardVOList().get(i).setProject_no(project.getProject_no()); 	//리워드에 프로젝트 번호 넣기
			//'' -> null 처리해주기 reward_compose, due_date
			if(reward.getRewardVOList().get(i).getReward_compose().equals("")) {
				reward.getRewardVOList().get(i).setReward_compose(null);
			}
			if(reward.getRewardVOList().get(i).getDue_date().equals("")) {
				reward.getRewardVOList().get(i).setDue_date(null);
			}
			projectdao.insertReward(reward.getRewardVOList().get(i));	//리워드 등록하기
		}

		//TODO : 마이페이지 > 프로젝트 이동
		return "redirect:../mypage/openproject.do";
	}

	//후원형 프로젝트 수정
	@Transactional(rollbackFor=Exception.class) 
	public String supportProjectEdit(ProjectVO project, SupportVO support, RewardVO reward, HttpServletRequest request,
			Principal principal) throws Exception {
		
		System.out.println("리워드 : "+reward.toString());

		ProjectDAO projectdao = sqlsession.getMapper(ProjectDAO.class);
		//파일업로드 처리
		if(!project.getFiles().isEmpty()) {
			fileUpload(project, request);
		}
		
		//project update
		projectdao.updateProject(project);
		
		//support update
		projectdao.updateSupport(support);
		
		//reward update
		//변경 전 리워드 번호 가져와서 비교해주기
		List<RewardVO> rewardList = projectdao.selectReward(project.getProject_no());	
		
		//리워드 번호만 저장
		List<Integer> reward_no = new ArrayList<Integer>();	//변경전 리워드 (2, 3, 4, 5)
		for(int i = 0; i < rewardList.size(); i++) {
			reward_no.add(rewardList.get(i).getReward_no());
		}
		
		//없는 리워드 번호만 남기기
		//가져온 리워드 (2, 4) -> 2번 4번 reward_no 배열에서 지우기
		Iterator<Integer> rewardIterator = reward_no.iterator();
		while(rewardIterator.hasNext()) {
			Integer rewardNext = rewardIterator.next();
			for(int i=0; i < reward.getRewardVOList().size(); i++) {
				//reward_no가 없다? 사용자가 수정단계에서 리워드 추가를 통해 새로 만든 리워드값. -> insert 해준다
				if(reward.getRewardVOList().get(i).getReward_no()!= null && reward.getRewardVOList().get(i).getReward_no().equals(rewardNext))  {
					rewardIterator.remove();
				}
			}
		}
		
		//남은 번호 del (3, 5) -> 새로 가져온 값에 없다 = 사용자가 해당 리워드를 삭제했다.
		for(int i = 0; i < reward_no.size(); i++) {
			projectdao.deleteReward(reward_no.get(i));
		}
		
		for(int i = 0; i < reward.getRewardVOList().size(); i++) {
			if(reward.getRewardVOList().get(i).getReward_no() != null) { 
				//update
				projectdao.updateReward(reward.getRewardVOList().get(i));	//기존에 있던 리워드 - 수정만 필요
			} else {	
				//insert
				reward.getRewardVOList().get(i).setProject_no(project.getProject_no());
				projectdao.insertReward(reward.getRewardVOList().get(i));	//새로 추가된 리워드 - 등록 필요
			}
		}
		
		//TODO : 마이페이지 > 개설프로젝트 이동
		return "redirect:../mypage/openproject.do";
	}
	
	//투자형 프로젝트 등록
	@Transactional(rollbackFor=Exception.class) 
	public String investProjectReg(ProjectVO project, InvestVO invest, HttpServletRequest request,
			Principal principal) throws Exception {
		
		ProjectDAO projectdao = sqlsession.getMapper(ProjectDAO.class);
		
		//파일업로드 처리
		fileUpload(project, request);
		
		//'' -> null 처리해주기
		if(project.getProject_title().equals("")) {		//제목
			//현재 시간 구하기
			SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date = dateformat.format(System.currentTimeMillis());
			project.setProject_title(date+"에 임시저장된 프로젝트입니다.");
		}
		if(project.getProject_video().equals("")) {		//동영상
			project.setProject_video(null);
		}
		if(project.getProject_content().equals("")) {	//상세
			project.setProject_content(null);
		}
		if(project.getProject_start().equals("")) {		//시작일
			project.setProject_start(null);
		}
		if(project.getProject_end().equals("")) {		//마감일
			project.setProject_end(null);
		}
		if(invest.getInterest_rate().equals("")) {		//표면이자율
			invest.setInterest_rate(null);
		}
		if(invest.getDeposit_date().equals("")) {		//입고일
			invest.setDeposit_date(null);
		}
		
		//project insert
		project.setProject_email(principal.getName());
		projectdao.insertProject(project);
		
		//invest insert
		invest.setProject_no(project.getProject_no());
		projectdao.insertInvest(invest);
		
		return "redirect:../mypage/openproject.do";
	}
	
	//투자형 프로젝트 수정
	@Transactional(rollbackFor=Exception.class) 
	public String investProjectEdit(ProjectVO project, InvestVO invest, HttpServletRequest request,
			Principal principal) throws Exception {
		
		ProjectDAO projectdao = sqlsession.getMapper(ProjectDAO.class);
		
		//파일업로드 처리
		fileUpload(project, request);
		
		//project update
		projectdao.updateProject(project);
		
		//invest update
		projectdao.updateInvest(invest);
		
		return "redirect:../mypage/openproject.do";
	}
	
	//파일업로드
	public void fileUpload(ProjectVO project, HttpServletRequest request) throws Exception {
		
		//넘어온 파일 확인
		//System.out.println(project.getFiles().toString());
		
		//project 객체 확인
		//System.out.println(project.toString());
		
		List<CommonsMultipartFile> files = project.getFiles();
		List<String> filenames = new ArrayList<String>(); //파일명관리
		
		//System.out.println("파일사이즈: "+files.size());
		
		if(files != null && files.size() > 0) {
			for (CommonsMultipartFile multifile : files) {
				
				String filename = multifile.getOriginalFilename();
				String path = request.getServletContext().getRealPath("/upload");
				
				System.out.println("filename:"+filename);
				
				if(!filename.equals("")) {
					
					//파일이름변경
					UUID uuid = UUID.randomUUID();
					filename = uuid + "_" + multifile.getOriginalFilename();
					
					System.out.println("filename:"+filename);
					
					//저장경로
					String fpath = path + "\\" + filename;
					
					FileOutputStream fs = new FileOutputStream(fpath);
					fs.write(multifile.getBytes());
					fs.close();
					
				}
				
				filenames.add(filename); 
				
				/*
				if(!filename.equals("")) {
					
					//파일이름변경
					UUID uuid = UUID.randomUUID();
					filename = uuid + "_" + multifile.getOriginalFilename();
					
					System.out.println("filename:"+filename);
					
					//저장경로
					String fpath = path + "\\" + filename;
					
					FileOutputStream fs = new FileOutputStream(fpath);
					fs.write(multifile.getBytes());
					fs.close();
					filenames.add(filename); 
				}
				*/
			}
		}
		
		if(!filenames.get(0).equals("")) {
			project.setProject_thumbnail(filenames.get(0)); //프로젝트 이미지
		}
		
		//get(1) 은 뭔지 모르겠음.. 왜 들어오지? 해결못함 ......
		
		if(!filenames.get(2).equals("")) {
			project.setProject_file(filenames.get(2)); //프로젝트 파일
		}
		
	}
	
	//project 가져오기
	public ProjectVO getProject(String project_no) {
		
		ProjectDAO projectdao = sqlsession.getMapper(ProjectDAO.class);
		ProjectVO project = null;
		
		try {
			project = projectdao.selectProject(Integer.parseInt(project_no));
			project.setFiles(null);
		} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return project;
	}

	//support 가져오기
	public SupportVO getSupport(String project_no) {
		
		ProjectDAO projectdao = sqlsession.getMapper(ProjectDAO.class);
		SupportVO support = null;
		
		try {
			support = projectdao.selectSupport(Integer.parseInt(project_no));
		} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return support;
	}

	//reward 가져오기
	public List<RewardVO> getReward(String project_no) {
		
		ProjectDAO projectdao = sqlsession.getMapper(ProjectDAO.class);
		List<RewardVO> rewardList = null;
		
		try {
			rewardList = projectdao.selectReward(Integer.parseInt(project_no));
		} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rewardList;
	}

	//invest 가져오기
	public InvestVO getInvest(String project_no) {
		
		ProjectDAO projectdao = sqlsession.getMapper(ProjectDAO.class);
		InvestVO invest = null;
		
		try {
			invest = projectdao.selectInvest(Integer.parseInt(project_no));
		} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return invest;
	}
	
	//projectCategory 가져오기
	public List<ProjectCategoryVO> getProjectCategory(){

		ProjectDAO projectdao = sqlsession.getMapper(ProjectDAO.class);
		List<ProjectCategoryVO> category = null;
		try {
			category = projectdao.selectProjectCategory();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		return category;
	}
	
	//프로젝트 검색 리스트 가져오기
	public List<ProjectVO> getProjectSearcList(Criteria cri){
		
		List<ProjectVO> projectList = null;
		
		ProjectDAO projectdao = sqlsession.getMapper(ProjectDAO.class);
		try {
			projectList = projectdao.getProjectByTitle(cri);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		System.out.println(projectList);
		
		return projectList;
	}
	
	//프로젝트 총 개수 구하기
	public int getProjectTotalCount(Criteria cri) throws ClassNotFoundException, SQLException {
		
		ProjectDAO projectdao = sqlsession.getMapper(ProjectDAO.class);
		
		return projectdao.getProjectTotalCount(cri);
	}

}
