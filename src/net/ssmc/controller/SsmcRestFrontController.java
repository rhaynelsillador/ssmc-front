package net.ssmc.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import net.cms.ssmc.model.Faq;
import net.cms.ssmc.model.Header;
import net.cms.ssmc.services.AboutUsServices;
import net.cms.ssmc.services.CorporateServices;
import net.cms.ssmc.services.FaqServices;
import net.cms.ssmc.services.HeaderServices;
import net.cms.ssmc.services.ImageServices;
import net.cms.ssmc.services.ServiceServices;
import net.ssmc.model.City;
import net.ssmc.model.Clinic;
import net.ssmc.model.form.Form;
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
	@Autowired
	private ImageServices imageServices;
	@Autowired
	private FaqServices faqServices;
	
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
	
//	@RequestMapping(path="/CorporateServices", method = {RequestMethod.POST, RequestMethod.GET}, produces={"application/json"})
//	public Map<String, Object> corporateServices(){
//		return corporateServices.getCorporateServices(httpServletRequest);
//	}
	
	@RequestMapping(path="/AboutUsHeaderInfo", method = {RequestMethod.POST, RequestMethod.GET}, produces={"application/json"})
	public Header aboutUsHeaderInfo(){
		return aboutUsServices.getAboutUsHeader();
	}
	
	@RequestMapping(path="/ServiceHeaderInfo", method = {RequestMethod.POST, RequestMethod.GET}, produces={"application/json"})
	public Header serviceHeaderInfo(){
		return serviceServices.getServicesHeader();
	}

	/*@RequestMapping(path="/ServicesList", method = {RequestMethod.POST, RequestMethod.GET}, produces={"application/json"})
	public List<Service> servicesList(){
		return serviceServices.getServices(App.BUSINESS, Page.Service);
	}*/
	
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
	
	
	
	
//	with parameters
	
	@RequestMapping(path="/AboutUsInformation", method = {RequestMethod.POST, RequestMethod.GET}, produces={"application/json"})
	public Map<String, Object> aboutUsInfo(@RequestParam Map<String, String> request){
		return aboutUsServices.getBusinessAboutUs(request);
	}
	
	@RequestMapping(path="/HeadersInformation", method = {RequestMethod.POST, RequestMethod.GET}, produces={"application/json"})
	public Map<String, Object> headersInfo(@RequestBody Form form){
		return headerServices.getHeaderInformation(form);
	}
	@RequestMapping(path="/ServicesInformation", method = {RequestMethod.POST, RequestMethod.GET}, produces={"application/json"})
	public Map<String, Object> servicesInformation(@RequestBody Form form){
		return serviceServices.getServices(form);
	}
	
	@RequestMapping(path="/FaqInformation", method = {RequestMethod.POST, RequestMethod.GET}, produces={"application/json"})
	public List<Faq> faqInformation(@RequestBody Form form){
		return faqServices.getAllFaq(form.getApp());
	}
	
	@RequestMapping(path="/SystemImages", method = {RequestMethod.POST, RequestMethod.GET}, produces={"application/json"})
	public Map<String, Object> imageServices(@RequestBody Form form){
		return imageServices.getImages(form);
	}
	
	@RequestMapping(path="/ClinicsAndHospitalList", method = {RequestMethod.POST, RequestMethod.GET}, produces={"application/json"})
	public Map<String, List<Clinic>> clinicsAndHospitalList(){
		return clinicServices.getClinicsAndHospitalList();
	}
}
