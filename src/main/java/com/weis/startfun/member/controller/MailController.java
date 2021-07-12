package com.weis.startfun.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Random;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.weis.startfun.utils.Mail;


@Controller
@RequestMapping("/startfun/joinus/")
public class MailController {

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

	// 개인 이메일 인증 페이지
	@RequestMapping(value = "emailAuth.do", method = RequestMethod.GET)
	public String emailAuth() {

		return "joinus/emailAuth_View";
	}

	@RequestMapping(value = "Auth.do", method = RequestMethod.POST)
	public ModelAndView sendEmail(HttpServletRequest request, String member_email, HttpServletResponse response) throws IOException {
		
		System.out.println("email= " + member_email);

		Random ran = new Random();
		int dice = ran.nextInt(4589362) + 49311;
		
		Mail mail = new Mail();
		mail.setMailFrom("weis62021@gmail.com");
		mail.setMailTo(member_email);
		mail.setMailSubject("[StartFun] 이메일 계정을 인증해주세요");
		mail.setTemplateName("emailtemplate.vm");

		try {
			MimeMessage message = mailSender.createMimeMessage();
			message.setSubject(mail.getMailSubject());
			message.setFrom(new InternetAddress(mail.getMailFrom()));
			Template template = velocityEngine.getTemplate(mail.getTemplateName(), "UTF-8");
			message.addRecipient(RecipientType.TO, new InternetAddress(mail.getMailTo()));

			VelocityContext velocitycontext = new VelocityContext();
			velocitycontext.put("dice", dice);
			velocitycontext.put("email", member_email);
			StringWriter stringWriter = new StringWriter();
			template.merge(velocitycontext, stringWriter);
			message.setText(stringWriter.toString(), "UTF-8", "html");
			mailSender.send(message);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		ModelAndView mv = new ModelAndView(); // ModelAndView로 보낼 페이지를 지정하고, 보낼 값을 지정한다.
		mv.setViewName("/joinus/emailAuthCheck_View"); // 뷰의이름
		mv.addObject("dice", dice);
		System.out.println(dice);
		System.out.println("mv : " + mv);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out_email = response.getWriter();
		out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
		out_email.flush();

		return mv;

	}

	@RequestMapping(value = "authCheck.do{dice}", method = RequestMethod.POST)
	public ModelAndView authCheck(String emailAuthCheck, String member_email, @PathVariable String dice, HttpServletResponse response)
			throws IOException {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("joinus/register");
		mv.addObject("emailAuthCheck", emailAuthCheck);
		
		System.out.println(member_email);

		if (emailAuthCheck.equals(dice)) {
			mv.setViewName("joinus/register");
			mv.addObject("emailAuthCheck", emailAuthCheck);

			System.out.println("email=" + emailAuthCheck);
			System.out.println("dice=" + dice);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response.getWriter();
			out_equals.println("<script>alert('인증번호가 일치하였습니다. 회원가입창으로 이동합니다.');</script>");
			out_equals.flush();

			return mv;
		} else if (emailAuthCheck != dice) {
			ModelAndView mv2 = new ModelAndView();
			mv2.setViewName("joinus/emailAuth_View");

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response.getWriter();
			out_equals.println("<script>alert('인증번호가 일치하지 않습니다.');</script>");
			out_equals.flush();

			return mv2;
		}

		return mv;

	}

	// 법인 이메일 인증 페이지
	@RequestMapping(value = "companyEmailAuth.do", method = RequestMethod.GET)
	public String companyEmailAuth() {

		return "joinus/companyEmailAuth_View";
	}

	@RequestMapping(value = "companyAuth.do", method = RequestMethod.POST)
	public ModelAndView companySendEmail(HttpServletRequest request, String member_email, HttpServletResponse response)
			throws IOException {
		System.out.println("email= " + member_email);
		Random ran = new Random();
		int dice = ran.nextInt(4589362) + 49311;
		Mail mail = new Mail();
		mail.setMailFrom("weis62021@gmail.com");
		mail.setMailTo(member_email);
		mail.setMailSubject("[StartFun] 이메일 계정을 인증해주세요");
		mail.setTemplateName("emailtemplate.vm");

		try {
			MimeMessage message = mailSender.createMimeMessage();
			message.setSubject(mail.getMailSubject());
			message.setFrom(new InternetAddress(mail.getMailFrom()));
			Template template = velocityEngine.getTemplate(mail.getTemplateName(), "UTF-8");
			message.addRecipient(RecipientType.TO, new InternetAddress(mail.getMailTo()));

			VelocityContext velocitycontext = new VelocityContext();
			velocitycontext.put("dice", dice);
			velocitycontext.put("email", member_email);
			StringWriter stringWriter = new StringWriter();
			template.merge(velocitycontext, stringWriter);
			message.setText(stringWriter.toString(), "UTF-8", "html");
			mailSender.send(message);

		} catch (Exception e) {
			// TODO: handle exception
		}

		ModelAndView mv = new ModelAndView(); // ModelAndView로 보낼 페이지를 지정하고, 보낼 값을 지정한다.
		mv.setViewName("/joinus/companyEmailAuthCheck_View"); // 뷰의이름
		mv.addObject("dice", dice);

		System.out.println("mv : " + mv);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out_email = response.getWriter();
		out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
		out_email.flush();

		return mv;

	}

	@RequestMapping(value = "companyAuthCheck.do{dice}", method = RequestMethod.POST)
	public ModelAndView companyAuthCheck(String emailAuthCheck, String member_email, @PathVariable String dice, HttpServletResponse response)
			throws IOException {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("joinus/companyRegister");
		mv.addObject("emailAuthCheck", emailAuthCheck);

		if (emailAuthCheck.equals(dice)) {
			mv.setViewName("joinus/companyRegister");
			mv.addObject("emailAuthCheck", emailAuthCheck);

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response.getWriter();
			out_equals.println("<script>alert('인증번호가 일치하였습니다. 회원가입창으로 이동합니다.');</script>");
			out_equals.flush();

			return mv;
		} else if (emailAuthCheck != dice) {
			ModelAndView mv2 = new ModelAndView();
			mv2.setViewName("joinus/companyEmailAuth_View");

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response.getWriter();
			out_equals.println("<script>alert('인증번호가 일치하지 않습니다.');</script>");
			out_equals.flush();

			return mv2;
		}

		return mv;

	}

}
