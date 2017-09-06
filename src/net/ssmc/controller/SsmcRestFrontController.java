package net.ssmc.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import net.cms.ssmc.model.AboutUs;
import net.cms.ssmc.model.Header;
import net.cms.ssmc.services.AboutUsServices;
import net.cms.ssmc.services.CorporateServices;
import net.cms.ssmc.services.HeaderServices;

@RestController
public class SsmcRestFrontController {
	
	@Autowired
	private HttpServletRequest httpServletRequest;
	@Autowired
	private HeaderServices headerServices;
	@Autowired
	private CorporateServices corporateServices;
	@Autowired
	private AboutUsServices aboutUsServices;
	
	@RequestMapping(path="/MainHeaderInfo", method = RequestMethod.POST, produces={"application/json"})
	public Map<String, Object> mainHeaderInfo(){
		return headerServices.getMainHeadersInfo(httpServletRequest);
	}
	
	@RequestMapping(path="/MainHeaderImages", method = RequestMethod.POST, produces={"application/json"})
	public Map<String, Object> mainHeaderImages(){
		return headerServices.getMainHeadersImages(httpServletRequest);
	}
	
	@RequestMapping(path="/CorporateHeaderInfo", method = {RequestMethod.POST, RequestMethod.GET}, produces={"application/json"})
	public Header corporateHeaderInfo(){
		return corporateServices.getCorporateHeader(httpServletRequest);
	}
	
	@RequestMapping(path="/CorporateServices", method = {RequestMethod.POST, RequestMethod.GET}, produces={"application/json"})
	public Map<String, Object> corporateServices(){
		return corporateServices.getCorporateServices(httpServletRequest);
	}
	
	@RequestMapping(path="/AboutUsHeaderInfo", method = {RequestMethod.POST, RequestMethod.GET}, produces={"application/json"})
	public Header aboutUsHeaderInfo(){
		return aboutUsServices.getAboutUsHeader();
	}
	
	@RequestMapping(path="/AboutUsInfo", method = {RequestMethod.POST, RequestMethod.GET}, produces={"application/json"})
	public List<AboutUs> aboutUsInfo(){
		return aboutUsServices.getBusinessAboutUs();
	}
}
