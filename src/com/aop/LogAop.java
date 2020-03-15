package com.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;

import com.service.MemberService;

@Aspect
public class LogAop {
	
	@Autowired
	MemberService memberService;
	
	@Around("within(com.controller.*) or within(com.dao.impl.*)")
	public Object loggerAop(ProceedingJoinPoint joinpoint) throws Throwable {
		String signatureStr = joinpoint.getSignature().toShortString();
		try {					
			System.out.println("loggerAOP:" + signatureStr + " 메소드가 실행되었습니다");
			
			Object obj = joinpoint.proceed();	// 기능 실행		
			return obj;
		}finally {}	
	}
}
