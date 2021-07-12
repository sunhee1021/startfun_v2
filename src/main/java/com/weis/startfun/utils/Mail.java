package com.weis.startfun.utils;

import lombok.Data;

@Data
public class Mail {
	private String mailFrom;
	private String mailTo;
	private String mailCc;
	private String mailBcc;
	private String mailSubject;
	private String mailContent;
	private String templateName;
	private String contentType;
}	
