package net.ssmc.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.cms.ssmc.services.CorporateServices;
import net.cms.ssmc.services.HeaderServices;
import net.ssmc.enums.Access;
import net.ssmc.enums.Module;
import net.ssmc.interceptor.AppicationAudit;

@Controller
public class SsmcFrontController {
	
	@Autowired
	private HttpServletRequest httpServletRequest;
	@Autowired
	private CorporateServices corporateServices;
	
	@RequestMapping(path="/", method = RequestMethod.GET)
	public String dashboard(ModelMap map){
		return "pages/index";
	}
	
	@AppicationAudit(module = Module.ALL, access = Access.ALL)
	@RequestMapping(path="/Corporate", method = RequestMethod.GET, produces="text/html")
	public String updateAccounts(ModelMap map){
		return "pages/corporate";
	}
	
	@AppicationAudit(module = Module.ALL, access = Access.ALL)
	@RequestMapping(path="/Medical", method = RequestMethod.GET, produces="text/html")
	public String accounts(ModelMap map){
		return "pages/medical";
	}
	
	
}
