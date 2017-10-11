package net.ssmc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.ssmc.enums.Access;
import net.ssmc.enums.Module;
import net.ssmc.interceptor.AppicationAudit;

@Controller
public class SsmcMedicalFrontController {
	
	@AppicationAudit(module = Module.ALL, access = Access.ALL)
	@RequestMapping(path="/SsmcHealthClinics", method = RequestMethod.GET, produces="text/html")
	public String medical(ModelMap map){
		return "pages/medical/SsmcHealthCLinics";
	}
	
	@AppicationAudit(module = Module.ALL, access = Access.ALL)
	@RequestMapping(path="/Medical-About", method = RequestMethod.GET, produces="text/html")
	public String medicalAbout(ModelMap map){
		return "pages/medical/about";
	}
	
	@AppicationAudit(module = Module.ALL, access = Access.ALL)
	@RequestMapping(path="/Medical-Services", method = RequestMethod.GET, produces="text/html")
	public String medicalServices(ModelMap map){
		return "pages/medical/services";
	}
	
	@AppicationAudit(module = Module.ALL, access = Access.ALL)
	@RequestMapping(path="/Medical-Branches", method = RequestMethod.GET, produces="text/html")
	public String medicalRegistration(ModelMap map){
		return "pages/medical/branches";
	}
	

	@AppicationAudit(module = Module.ALL, access = Access.ALL)
	@RequestMapping(path="/Medical-Faq", method = RequestMethod.GET, produces="text/html")
	public String medicalFaq(ModelMap map){
		return "pages/medical/faq";
	}

	@AppicationAudit(module = Module.ALL, access = Access.ALL)
	@RequestMapping(path="/Medical-ContactUs", method = RequestMethod.GET, produces="text/html")
	public String medicalContact(ModelMap map){
		return "pages/medical/contact";
	}
}
