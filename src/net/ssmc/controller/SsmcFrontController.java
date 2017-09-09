package net.ssmc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SsmcFrontController {
	
	@RequestMapping(path="/", method = RequestMethod.GET)
	public String dashboard(ModelMap map){
		return "pages/index";
	}
	
//	@AppicationAudit(module = Module.ALL, access = Access.ALL)
	@RequestMapping(path="/Corporate", method = RequestMethod.GET, produces="text/html")
	public String updateAccounts(ModelMap map){
		return "pages/corporate";
	}
	
//	@AppicationAudit(module = Module.ALL, access = Access.ALL)
	@RequestMapping(path="/Medical", method = RequestMethod.GET, produces="text/html")
	public String medical(ModelMap map){
		return "pages/medical";
	}
	
//	@AppicationAudit(module = Module.ALL, access = Access.ALL)
	@RequestMapping(path="/About", method = RequestMethod.GET, produces="text/html")
	public String about(ModelMap map){
		return "pages/about";
	}
	
	@RequestMapping(path="/Services", method = RequestMethod.GET, produces="text/html")
	public String services(ModelMap map){
		return "pages/services";
	}
	
	@RequestMapping(path="/Branches", method = RequestMethod.GET, produces="text/html")
	public String branches(ModelMap map){
		return "pages/branches";
	}
	
	
}
