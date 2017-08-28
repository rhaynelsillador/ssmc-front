package net.ssmc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.cms.ssmc.dao.HeaderDao;
import net.cms.ssmc.services.CorporateServices;
import net.cms.ssmc.services.HeaderServices;
import net.ssmc.enums.Access;
import net.ssmc.enums.Module;
import net.ssmc.enums.TransactionType;
import net.ssmc.interceptor.AppicationAudit;
import net.ssmc.model.Role;
import net.ssmc.model.User;
import net.ssmc.services.ClinicServices;
import net.ssmc.services.RoleServices;
import net.ssmc.services.UserServices;

@Controller
public class SsmcFrontController {
	
	@Autowired
	private HttpServletRequest httpServletRequest;
	@Autowired
	private CorporateServices corporateServices;
	@Autowired
	private HeaderServices headerServices;
	
	@AppicationAudit(module = Module.ALL, access = Access.ALL)
	@RequestMapping(path="/", method = RequestMethod.GET)
	public String dashboard(ModelMap map){
		headerServices.getHeaders(httpServletRequest);
		return "pages/index";
	}
	
	@AppicationAudit(module = Module.ALL, access = Access.ALL)
	@RequestMapping(path="/Corporate", method = RequestMethod.GET, produces="text/html")
	public String updateAccounts(ModelMap map){
		corporateServices.getCorporateContent(httpServletRequest);
		return "pages/corporate";
	}
	
	@AppicationAudit(module = Module.ALL, access = Access.ALL)
	@RequestMapping(path="/Medical", method = RequestMethod.GET, produces="text/html")
	public String accounts(ModelMap map){
		return "pages/medical";
	}
	
	
}
