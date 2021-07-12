package com.weis.startfun.main.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

@Controller
@RequestMapping("/startfun/")
public class LocaleChangeController {
	
	private static final Logger logger = LoggerFactory.getLogger(LocaleChangeController.class);
	
	@Autowired 
	private SessionLocaleResolver localeResolver; 
	
	@Autowired 
	private MessageSource messageSource; //message-context.xml 에 선언되어있는 bean id 값

	@RequestMapping(value="startfun.do", method=RequestMethod.GET)
	public String index(Locale locale, HttpServletRequest request, Model model){
		model.addAttribute("siteCount", messageSource.getMessage("startFUN.title",null, locale));
		return "company/StartfunIR";
	}
	
	@RequestMapping("projectGuide.do")
	public String index() {
		return "company/projectGuide";
	}
}
