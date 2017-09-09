package net.ssmc.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import net.cms.ssmc.model.AboutUs;
import net.cms.ssmc.model.Header;
import net.cms.ssmc.model.Service;
import net.cms.ssmc.services.AboutUsServices;
import net.cms.ssmc.services.CorporateServices;
import net.cms.ssmc.services.HeaderServices;
import net.cms.ssmc.services.ServiceServices;
import net.ssmc.enums.App;
import net.ssmc.enums.Page;
import net.ssmc.model.City;
import net.ssmc.model.Clinic;
import net.ssmc.services.CityServices;
import net.ssmc.services.ClinicServices;

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
	@Autowired
	private ServiceServices serviceServices;
	@Autowired
	private ClinicServices clinicServices;
	@Autowired
	private CityServices cityServices;
	
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
	
	@RequestMapping(path="/ServiceHeaderInfo", method = {RequestMethod.POST, RequestMethod.GET}, produces={"application/json"})
	public Header serviceHeaderInfo(){
		return serviceServices.getServicesHeader();
	}

	@RequestMapping(path="/ServicesList", method = {RequestMethod.POST, RequestMethod.GET}, produces={"application/json"})
	public List<Service> servicesList(){
		return serviceServices.getServices(App.BUSINESS, Page.Service);
	}
	
	@RequestMapping(path="/ClinicsHeaderInfo", method = {RequestMethod.POST, RequestMethod.GET}, produces={"application/json"})
	public Header clinicsHeaderInfo(){
		return clinicServices.getClinicHeader();
	}
	
	@RequestMapping(path="/ClinicsAndHospitals", method = {RequestMethod.POST, RequestMethod.GET}, produces={"application/json"})
	public Map<String, List<Clinic>> clinicsAndHospitals(){
		return clinicServices.getClinicsAndHospitals();
	}
	
	@RequestMapping(path="/Cities", method = {RequestMethod.POST, RequestMethod.GET}, produces={"application/json"})
	public List<City> cities(){
		return cityServices.getAllCities();
	}
}
