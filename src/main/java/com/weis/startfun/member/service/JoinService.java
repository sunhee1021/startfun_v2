package com.weis.startfun.member.service;

import java.io.StringWriter;
import java.sql.SQLException;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.apache.ibatis.session.SqlSession;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.weis.startfun.member.model.MemberDAO;
import com.weis.startfun.member.model.MemberVO;
import com.weis.startfun.utils.Mail;
import com.weis.startfun.utils.TempKey;


@Service
public class JoinService {

	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private VelocityEngine velocityEngine;

	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}
	public void setVelocityEngine(VelocityEngine velocityEngine) {
		this.velocityEngine = velocityEngine;
	}
	
	@Autowired
	private SqlSession sqlsession;
	
	// 개인회원가입
	public int insertMember(MemberVO member) throws ClassNotFoundException, SQLException{
		int result = 0;
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		result = dao.insert_member(member);
		return result;
	}
	
	// 개인 회원가입 권한 주기
		public int insert_member_auth(MemberVO member) throws ClassNotFoundException, SQLException{
			int result = 0;
			MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
			result = dao.insert_member_auth(member);
			return result;
		}
	
	// 법인회원가입
	public int companyInsertMember(MemberVO member) throws ClassNotFoundException, SQLException{
		int result = 0;
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		result = dao.company_insert_member(member);
		return result;
	}
	
	// 법인 회원가입 권한주기
		public int insert_company_auth(MemberVO member) throws ClassNotFoundException, SQLException{
			int result = 0;
			MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
			result = dao.insert_company_auth(member);
			return result;
		}
	
	// 개인회원 중복체크
	public int idCheck(String member_email){
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		int result = dao.idCheck(member_email);
		return result;
	}
	
	// 법인회원 중복체크
	public int companyIdCheck(String company_email){
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		int result = dao.companyIdCheck(company_email);
		return result;
	}

	//아이디찾기 가입정보확인
	public int searchUserInfo(String member_name, String member_phone) {
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		int result = dao.searchUserInfo(member_name, member_phone);
		return result;
	}
	
	//아이디찾기
	public MemberVO searchId(MemberVO membervo) {
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		MemberVO member = dao.searchId(membervo);
		return member;
	}
	
	// 비밀번호 찾기
	public int forgotPassword(String member_email) {
		
		String key = new TempKey().getKey(50, false); //인증키 생성
		
		MemberVO member = new MemberVO();
		member.setMember_email(member_email);
		member.setMember_emailkey(key);
		
		int result = 0;
		
		try {
			MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
			result = dao.updateAuthKey(member);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		Mail mail = new Mail();
		mail.setMailFrom("wifi0728@gmail.com");
		mail.setMailTo(member_email);
		mail.setMailSubject("[StartFun] 비밀번호 초기화 메일입니다");
		mail.setTemplateName("forgotPasswordTemplate.vm");

		try {
			MimeMessage message = mailSender.createMimeMessage();
			message.setSubject(mail.getMailSubject());
			message.setFrom(new InternetAddress(mail.getMailFrom()));
			Template template = velocityEngine.getTemplate(mail.getTemplateName(), "UTF-8");
			message.addRecipient(RecipientType.TO, new InternetAddress(mail.getMailTo()));

			VelocityContext velocitycontext = new VelocityContext();
			velocitycontext.put("member_email", member_email);
			velocitycontext.put("key", key);
			StringWriter stringWriter = new StringWriter();
			template.merge(velocitycontext, stringWriter);
			message.setText(stringWriter.toString(), "UTF-8", "html");
			mailSender.send(message);

		} catch (Exception e) {
			e.getStackTrace();
		}
		
		
		return result;
	}
	
	//이메일 확인
	public String confirmPassword(String member_email, String member_emailkey) {
		
		MemberVO member = new MemberVO();
		String url = "";
		
		try {
			MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
			member = dao.confirmAuthKey(member_email);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		if(member.getMember_emailkey().equals(member_emailkey)) {
			url = "login/passwordChange";
		}else {
			url = "redirect:/startfun/index.do";
		}
		
		return url;
	}
	
	public String updatePassword(String member_email, String member_password) {
		
		MemberVO member = new MemberVO();
		member.setMember_email(member_email);
		member.setMember_password(member_password);
		
		int result = 0;

		try {
			MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
			result = dao.updatePassword(member);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		if(result > 0) {
			member.setMember_emailkey("change");
			try {
				MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
				result = dao.updateAuthKey(member);
				
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		}
		
		return "redirect:/startfun/login.do";
	}
	
}
