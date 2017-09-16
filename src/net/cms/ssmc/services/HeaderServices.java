package net.cms.ssmc.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import net.cms.ssmc.dao.HeaderDao;
import net.cms.ssmc.dao.ImageDao;
import net.cms.ssmc.model.Header;
import net.ssmc.enums.App;
import net.ssmc.enums.Module;
import net.ssmc.enums.Page;
import net.ssmc.model.form.Form;

public class HeaderServices {

	@Autowired
	private HeaderDao headerDao;
	@Autowired
	private ImageDao imageDao;
	
	public HeaderServices(){
		
	}
	
	public Map<String, Object> getMainHeadersInfo(HttpServletRequest httpServletRequest){
		List<Header> headers = headerDao.retrieve(Page.Main);
		Map<String, Object> response = new HashMap<>();
		response.put("info", headers);
		return response;
	}
	
	public Map<String, Object> getMainHeadersImages(HttpServletRequest httpServletRequest){
		Map<String, Object> response = new HashMap<>();
		response.put("images", imageDao.retrieveImage(Page.Main, Module.HEADER));		
		return response;
	}
	
	public Header getCorporateHeader(){
		try {
			return headerDao.retrieve(App.BUSINESS, Page.Corporate);
		} catch (Exception e) {
		}return new Header();
	}
	public Header getMedicalHeader(){
		try {
			return headerDao.retrieve(App.CLINIC, Page.Medical);
		} catch (Exception e) {
		}
		return new Header();
	}
	
	public Header getServicesHeader(){
		try {
			return headerDao.retrieve(App.BUSINESS, Page.Service);
		} catch (Exception e) {
		}
		return new Header();
	}
	
	public Header getClinicHeader(){
		try {
			return headerDao.retrieve(App.BUSINESS, Page.HospitalAndClinic);
		} catch (Exception e) {
		}
		return new Header();
	}
	
	public Map<String, Object> getHeaderInformation(Form form){
		Map<String, Object> response = new HashMap<>();
//		App app = null;
//		Page page = null;
//		try {
//			app = App.valueOf(request.get("app"));
//		} catch (Exception e) {
//			response.put("error", "Invalid app");
//		}
//		try {
//			page = Page.valueOf(request.get("page"));
//		} catch (Exception e) {
//			response.put("error", "Invalid page");
//		}
		if(form.getApp() == null){
			response.put("error", "Invalid app");
		}else if(form.getPage() == null){
			response.put("error", "Invalid page");
		}else{
			try {
				response.put("data", headerDao.retrieve(form.getApp(), form.getPage()));
			} catch (Exception e) {
				response.put("error", "No data retrieve");
			}
		}
		
		return response;
	}
}
