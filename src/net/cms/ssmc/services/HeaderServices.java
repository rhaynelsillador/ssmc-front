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

public class HeaderServices {

	@Autowired
	private HeaderDao headerDao;
	@Autowired
	private ImageDao imageDao;
	
	public HeaderServices(){
		
	}
	
	public Map<String, Object> getMainHeadersInfo(HttpServletRequest httpServletRequest){
		long start = System.currentTimeMillis();
		List<Header> headers = headerDao.retrieve(Page.Main);
		Map<String, Object> response = new HashMap<>();
		response.put("info", headers);
		long end = System.currentTimeMillis();
		
		System.out.println(end - start);
		
		return response;
	}
	
	public Map<String, Object> getMainHeadersImages(HttpServletRequest httpServletRequest){
		long start = System.currentTimeMillis();
		Map<String, Object> response = new HashMap<>();
		response.put("images", imageDao.retrieveImage(Page.Main, Module.HEADER));
		long end = System.currentTimeMillis();
		
		System.out.println(end - start);
		
		return response;
	}
	
	public Header getCorporateHeader(){
		try {
			return headerDao.retrieve(App.BUSINESS, Page.Corporate);
		} catch (Exception e) {
			e.printStackTrace();
		}return new Header();
	}
	public Header getMedicalHeader(){
		try {
			return headerDao.retrieve(App.CLINIC, Page.Medical);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new Header();
	}
	
	public Header getServicesHeader(){
		try {
			return headerDao.retrieve(App.BUSINESS, Page.Service);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new Header();
	}
	
	public Header getClinicHeader(){
		try {
			return headerDao.retrieve(App.BUSINESS, Page.HospitalAndClinic);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new Header();
	}
}
