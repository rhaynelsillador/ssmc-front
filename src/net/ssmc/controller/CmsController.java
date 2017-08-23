package net.ssmc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.cms.ssmc.model.AboutUs;
import net.cms.ssmc.model.Header;
import net.cms.ssmc.model.Service;
import net.cms.ssmc.services.AboutUsServices;
import net.cms.ssmc.services.FaqServices;
import net.cms.ssmc.services.HeaderServices;
import net.cms.ssmc.services.ServiceServices;
import net.ssmc.enums.Access;
import net.ssmc.enums.App;
import net.ssmc.enums.Module;
import net.ssmc.enums.TransactionType;
import net.ssmc.interceptor.AppicationAudit;

@Controller
public class CmsController {
	
	@Autowired
	private HttpServletRequest httpServletRequest;
	@Autowired
	private FaqServices faqServices;
	@Autowired
	private AboutUsServices aboutUsServices;
	@Autowired
	private HeaderServices headerServices;
	@Autowired
	private ServiceServices serviceServices;
	
	@AppicationAudit(module = Module.FAQ, access = Access.RETRIEVE)
	@RequestMapping(path="/Faq", method = RequestMethod.GET)
	public String faq(ModelMap map){
		return "backend/Faq";
	}

	@AppicationAudit(module = Module.FAQ, access = Access.UPDATE)
	@RequestMapping(path="/FaqUpdate", method = RequestMethod.GET)
	public String faqUpdate(ModelMap map, @RequestParam int id){
		HttpSession session = httpServletRequest.getSession(true);
		session.setAttribute("TRANSACTION", TransactionType.UPDATE);
		session.setAttribute("FAQID", id);
		map.addAttribute("faq", faqServices.getFaq(id));
		return "backend/FaqUpdate";
	}
	
	@AppicationAudit(module = Module.FAQ, access = Access.CREATE)
	@RequestMapping(path="/FaqCreate", method = RequestMethod.GET)
	public String faqCreate(ModelMap map){
		HttpSession session = httpServletRequest.getSession(true);
		session.setAttribute("TRANSACTION", TransactionType.ADD);
		session.removeAttribute("FAQID");
		return "backend/FaqUpdate";
	}
	
	@AppicationAudit(module = Module.ABOUTUS, access = Access.RETRIEVE)
	@RequestMapping(path="/AboutUs", method = RequestMethod.GET)
	public String aboutUs(ModelMap map){
		return "backend/AboutUs";
	}
	
	@AppicationAudit(module = Module.ABOUTUS, access = Access.UPDATE)
	@RequestMapping(path="/AboutUsAdd", method = RequestMethod.GET)
	public String aboutUsAdd(ModelMap map){
		HttpSession session = httpServletRequest.getSession(true);
		session.setAttribute("TRANSACTION", TransactionType.ADD);
		session.removeAttribute("aboutUs");
		map.addAttribute("type", App.values());
		return "backend/AboutUsUpdate";
	}
	
	@AppicationAudit(module = Module.ABOUTUS, access = Access.UPDATE)
	@RequestMapping(path="/AboutUsUpdate", method = RequestMethod.GET)
	public String aboutUsUpdate(ModelMap map, @RequestParam int id){
		HttpSession session = httpServletRequest.getSession(true);
		session.setAttribute("TRANSACTION", TransactionType.UPDATE);
		AboutUs aboutUs = aboutUsServices.getAboutUs(session, id);
		session.setAttribute("aboutUs", aboutUs);
		map.addAttribute("type", App.values());
		return "backend/AboutUsUpdate";
	}
	
	@AppicationAudit(module = Module.HEADER, access = Access.RETRIEVE)
	@RequestMapping(path="/Header", method = RequestMethod.GET)
	public String header(ModelMap map){
		return "backend/Header";
	}
	
	@AppicationAudit(module = Module.HEADER, access = Access.UPDATE)
	@RequestMapping(path="/HeaderUpdate", method = RequestMethod.GET)
	public String headerUpdate(ModelMap map, @RequestParam int id){
		HttpSession session = httpServletRequest.getSession(true);
		session.setAttribute("TRANSACTION", TransactionType.UPDATE);
		Header header = headerServices.getHeader(session, id);
		session.setAttribute("header", header);
		return "backend/HeaderUpdate";
	}
	
	@AppicationAudit(module = Module.HEADER, access = Access.CREATE)
	@RequestMapping(path="/HeaderAdd", method = RequestMethod.GET)
	public String headerAdd(ModelMap map){
		HttpSession session = httpServletRequest.getSession(true);
		session.setAttribute("TRANSACTION", TransactionType.ADD);
		session.removeAttribute("header");
		return "backend/HeaderUpdate";
	}
	
	@AppicationAudit(module = Module.HEADER, access = Access.RETRIEVE)
	@RequestMapping(path="/Services", method = RequestMethod.GET)
	public String services(ModelMap map){
		return "backend/Service";
	}
	
	@AppicationAudit(module = Module.SERVICE, access = Access.UPDATE)
	@RequestMapping(path="/ServicesUpdate", method = RequestMethod.GET)
	public String servicesUpdate(ModelMap map, @RequestParam int id){
		HttpSession session = httpServletRequest.getSession(true);
		session.setAttribute("TRANSACTION", TransactionType.UPDATE);
		Service service = serviceServices.getService(session, id);
		System.out.println(service);
		session.setAttribute("service", service);
		return "backend/ServiceUpdate";
	}
	
	@AppicationAudit(module = Module.SERVICE, access = Access.CREATE)
	@RequestMapping(path="/ServicesAdd", method = RequestMethod.GET)
	public String servicesAdd(ModelMap map){
		HttpSession session = httpServletRequest.getSession(true);
		session.setAttribute("TRANSACTION", TransactionType.ADD);
		session.removeAttribute("service");
		return "backend/ServiceUpdate";
	}
}
