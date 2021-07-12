package com.weis.startfun.utils;
  
import java.util.Date;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
  
/*    
설 명 : Log
작성일 : 2021.06.22
작성자 : 이보희
*/ 

@Component
@Aspect public class LogAspect {
	  
	  private static final Logger logger = LoggerFactory.getLogger(LogAspect.class);
	  
	  //포인트컷
	  @Pointcut("execution(* com.weis.startfun.project.service.*.*(..))") 
	  private void pointcut() {
	  
	  }
	  	
	  //타겟메서드 호출전 실행
	  @Before("pointcut()") 
	  public void startLog(JoinPoint jp){ 
		  logger.info("핵심업무 코드정보 : "+jp.getSignature()); 
	   }

	  
	  //타겟메서드 전/후로 실행
	  @Around("pointcut()") 
	  public Object timeLog(ProceedingJoinPoint pjp) throws Throwable {
	  
		  //현재시간
		  Date date = new Date(); //date.getTime(); 
		  //실행전
		  long start = System.currentTimeMillis();
		  //실행중
		  Object result = pjp.proceed();
		  //실행후
		  long end = System.currentTimeMillis();
		 
		  //로그
		  logger.info("===========================================================");
		  logger.info("METHOD : " + pjp.getSignature().getName());
		  logger.info("START  : " + date.toString());
		  logger.info("END    : " + date.toString());
		  logger.info("RUN    : " + (end-start)+"ms");
		  logger.info("===========================================================");
		  
		  return result;
	  }

		//예외발생시 실행
		@AfterThrowing(pointcut="pointcut()", throwing="ex")
		public void exceptionMethods(Exception ex) throws Throwable {
			logger.info("Exception : " + ex);
		}
		
}
 