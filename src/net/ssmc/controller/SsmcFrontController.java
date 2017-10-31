package net.ssmc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.ssmc.enums.Access;
import net.ssmc.enums.Module;
import net.ssmc.interceptor.AppicationAudit;

@Controller
public class SsmcFrontController {
	
	@RequestMapping(path={"/", "Welcome"}, method = RequestMethod.GET)
	public String dashboard(ModelMap map){
		return "pages/LandingPage";
	}
	
	@RequestMapping(path="/SsmcHealthHospitals", method = RequestMethod.GET, produces="text/html")
	public String updateAccounts(ModelMap map){
		return "pages/SsmcHealthHospitals";
	}
	
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
	
	@RequestMapping(path="/ContactUs", method = RequestMethod.GET, produces="text/html")
	public String contactUs(ModelMap map){
		return "pages/contact";
	}
	
	@RequestMapping(path="/Faq", method = RequestMethod.GET, produces="text/html")
	public String faq(ModelMap map){
		return "pages/faq";
	}
	
	@RequestMapping(path="/Registration", method = RequestMethod.GET, produces="text/html")
	public String registration(ModelMap map){
		return "pages/Registration";
	}
	
	@RequestMapping(path="/IndustrialMedicine", method = RequestMethod.GET, produces="text/html")
	public String industrial(ModelMap map){
		return "pages/industrial";
	}
	@RequestMapping(path="/News", method = RequestMethod.GET, produces="text/html")
	public String news(ModelMap map){
		return "pages/news";
	}
	
	@AppicationAudit(module = Module.LOGINREQUIRED, access = Access.RETRIEVE)
	@RequestMapping(path="/UserProfile", method = RequestMethod.GET, produces="text/html")
	public String userProfile(ModelMap map){
		return "pages/UserProfile";
	}
}
