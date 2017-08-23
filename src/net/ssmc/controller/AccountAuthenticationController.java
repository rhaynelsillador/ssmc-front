package net.ssmc.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.ssmc.enums.Access;
import net.ssmc.enums.Module;
import net.ssmc.interceptor.AppicationAudit;

@Controller
public class AccountAuthenticationController {
	
	@Autowired
	private HttpServletRequest httpServletRequest;
	
	@AppicationAudit(access = Access.ALL, module = Module.ALL)
	@RequestMapping(path="/AccountAuthenticationForm", method = {RequestMethod.GET, RequestMethod.POST})
	public String accountAuthenticationForm(ModelMap map, @RequestParam Map<String, String> request){
		return "backend/AccountAuthentication";
	}
	
	@RequestMapping(path="/AccountLogout", method = {RequestMethod.GET, RequestMethod.POST})
	public String accountLogout(ModelMap map, @RequestParam Map<String, String> request){
		HttpSession session = httpServletRequest.getSession();
		session.invalidate();
		return "backend/AccountAuthentication";
	}
	
	
}
