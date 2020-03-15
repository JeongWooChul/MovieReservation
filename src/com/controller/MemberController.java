package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.model.MemberDto;
import com.service.MemberService;

@Controller
public class MemberController {
	private static Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired	// -> 의존성	Dependency Injection(DI) I
	MemberService memberService;
	
	@RequestMapping(value = "login.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String login() {
		return "login";
	}
	
	@RequestMapping(value = "loginAf.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String loginAf(Model model, MemberDto dto, HttpServletRequest req) {
	//	logger.info("MemberController loginAf " + new Date());
		logger.info(dto.toString());
		
		// service -> id, pwd		
		MemberDto login = memberService.login(dto);		
		if(login != null && login.getId().equals("") == false) {
		//	logger.info("login success! " + new Date());
			// login success
			req.getSession().setAttribute("login", login);
			req.getSession().setMaxInactiveInterval(60 * 60 * 365);
			
			model.addAttribute("message", "loginT");
		//	return "redirect:/bbslist.do";
			return "MessageAlert";
		} else {
			model.addAttribute("message", "loginF");
			return "MessageAlert";
			
		}		
	}

	@RequestMapping(value = "logout.do", method={RequestMethod.GET,	RequestMethod.POST})
	public String logout(Model model, HttpSession session) {
		session.invalidate();
	//	model.addAttribute("message", "regiT");
	//	return "MessageAlert";
		return "login";
	}
	
	@RequestMapping(value = "regi.do", method = {RequestMethod.GET,	RequestMethod.POST})
	public String regi() {
		return "regi";
	}
	
	@RequestMapping(value = "regiAf.do", method = {RequestMethod.GET,	RequestMethod.POST})
	public String regiAf(Model model, MemberDto dto) {		
		boolean b = memberService.addMember(dto);
		if(b) {
			model.addAttribute("message", "regiT");
			return "MessageAlert";
		} else {
			model.addAttribute("message", "regiF");
			return "MessageAlert";
		}
	}
		
}
