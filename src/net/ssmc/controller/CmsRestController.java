package net.ssmc.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import net.cms.ssmc.model.AboutUs;
import net.cms.ssmc.model.Control;
import net.cms.ssmc.model.Faq;
import net.cms.ssmc.model.Header;
import net.cms.ssmc.model.Service;
import net.cms.ssmc.services.AboutUsServices;
import net.cms.ssmc.services.ControlServices;
import net.cms.ssmc.services.FaqServices;
import net.cms.ssmc.services.HeaderServices;
import net.cms.ssmc.services.ServiceServices;
import net.ssmc.enums.Access;
import net.ssmc.enums.Module;
import net.ssmc.interceptor.AppicationAudit;
import net.ssmc.model.User;

@RestController
public class CmsRestController {
	
	@Autowired
	private HttpServletRequest httpServletRequest;
	@Autowired
	private FaqServices faqServices;
	@Autowired
	private AboutUsServices aboutUsServices;
	@Autowired
	private ControlServices controlServices;
	@Autowired
	private HeaderServices headerServices;
	@Autowired
	private ServiceServices serviceServices;
	
	@AppicationAudit(module = Module.FAQ, access = Access.RETRIEVE)
	@RequestMapping(path="/FaqList", method = {RequestMethod.GET, RequestMethod.POST, RequestMethod.OPTIONS}, produces="application/json")
	public @ResponseBody Map<String, Object> accountList(@RequestParam Map<String, String> request) {
		try {
			HttpSession session = httpServletRequest.getSession(true);
			return faqServices.retrieveAllFaq(session, request);
		} catch (Exception e) {
			Map<String, Object> data = new HashMap<>();
			data.put("rows", null);
			return data;
		}	
	}
	
	@AppicationAudit(module = Module.FAQ, access = Access.RETRIEVE)
	@RequestMapping(path="/AddUpdateFaq", method = {RequestMethod.GET, RequestMethod.POST}, produces="application/json")
	public @ResponseBody Map<String, Object> addUpdateUser(@RequestBody Faq faq) {
		HttpSession session = httpServletRequest.getSession(true);
		Map<String, Object> map = faqServices.createUpdateFaq(session, faq);
		System.out.println(map);
		return map;
	}
	
	@AppicationAudit(module = Module.FAQ, access = Access.UPDATE)
	@RequestMapping(path="/ChangeStatusFaq", method = {RequestMethod.GET, RequestMethod.POST}, produces="application/json")
	public @ResponseBody Map<String, Object> changeStatusFaq(@RequestBody Faq faq) {
		HttpSession session = httpServletRequest.getSession(true);
		Map<String, Object> map = faqServices.changeStatusFaq(session, faq);
		return map;
	}
	
	@AppicationAudit(module = Module.FAQ, access = Access.UPDATE)
	@RequestMapping(path="/DeleteFaq", method = {RequestMethod.GET, RequestMethod.POST}, produces="application/json")
	public @ResponseBody Map<String, Object> deleteFaq(@RequestBody Faq faq) {
		HttpSession session = httpServletRequest.getSession(true);
		Map<String, Object> map = faqServices.deleteFaq(session, faq);	
		return map;
	}
	
	@AppicationAudit(module = Module.ABOUTUS, access = Access.RETRIEVE)
	@RequestMapping(path="/AboutUsList", method = {RequestMethod.GET, RequestMethod.POST}, produces="application/json")
	public @ResponseBody Map<String, Object> aboutUsList(@RequestParam Map<String, String> request){
		return aboutUsServices.getAllAboutUs(request);
	}
	
	@AppicationAudit(module = Module.ABOUTUS, access = Access.UPDATE)
	@RequestMapping(path="/AboutUsUpdate", method = {RequestMethod.GET, RequestMethod.POST}, produces="application/json")
	public @ResponseBody Map<String, Object> aboutUsUpdate(@RequestBody AboutUs aboutUs){
		HttpSession session = httpServletRequest.getSession(true);
		return aboutUsServices.addUpdateAboutUs(session, aboutUs);
	}
	
	@AppicationAudit(module = Module.ABOUTUS, access = Access.DELETE)
	@RequestMapping(path="/AboutUsDelete", method = {RequestMethod.GET, RequestMethod.POST}, produces="application/json")
	public @ResponseBody Map<String, Object> aboutUsDelete(@RequestBody AboutUs aboutUs){
		HttpSession session = httpServletRequest.getSession(true);
		return aboutUsServices.deleteAboutUs(session, aboutUs);
	}
	
	@AppicationAudit(module = Module.ALL, access = Access.ALL)
	@RequestMapping(path="/approved", method = {RequestMethod.GET, RequestMethod.POST})
	public boolean approved(@RequestBody Control control){
		HttpSession session = httpServletRequest.getSession(true);
		return controlServices.approve(session, control);
	}
	
	@AppicationAudit(module = Module.HEADER, access = Access.RETRIEVE)
	@RequestMapping(path="/HeaderList", method = {RequestMethod.GET, RequestMethod.POST}, produces="application/json")
	public @ResponseBody Map<String, Object> headerList(@RequestParam Map<String, String> request){
		return headerServices.getAllHeaders(request);
	}
	
	@AppicationAudit(module = Module.HEADER, access = Access.UPDATE)
	@RequestMapping(path="/HeaderAddUpdate", method = {RequestMethod.GET, RequestMethod.POST}, produces="application/json")
	public @ResponseBody Map<String, Object> headerAddUpdate(@RequestBody Header header){
		HttpSession session = httpServletRequest.getSession(true);
		return headerServices.createUpdateHeader(session, header);
	}
	
	@AppicationAudit(module = Module.SERVICE, access = Access.RETRIEVE)
	@RequestMapping(path="/ServicesList", method = {RequestMethod.GET, RequestMethod.POST}, produces="application/json")
	public @ResponseBody Map<String, Object> servicesList(@RequestParam Map<String, String> request){
		return serviceServices.getAllServices(request);
	}
	
	@AppicationAudit(module = Module.SERVICE, access = Access.UPDATE)
	@RequestMapping(path="/ServicesAddUpdate", method = {RequestMethod.GET, RequestMethod.POST}, produces="application/json")
	public @ResponseBody Map<String, Object> servicesAddUpdate(@RequestBody Service service){
		HttpSession session = httpServletRequest.getSession(true);
		return serviceServices.createUpdateService(session, service);
	}
}
