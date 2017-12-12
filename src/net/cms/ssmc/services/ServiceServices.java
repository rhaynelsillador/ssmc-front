package net.cms.ssmc.services;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import net.cms.ssmc.dao.ServiceDao;
import net.cms.ssmc.model.Header;
import net.cms.ssmc.model.Service;
import net.ssmc.enums.Module;
import net.ssmc.model.form.Form;

public class ServiceServices {

	@Autowired
	private ServiceDao serviceDao;
	@Autowired
	private HeaderServices headerServices;

	public Header getServicesHeader(){
		return headerServices.getServicesHeader();
	}

	public Map<String, Object> getServices(Form form){
		Map<String, Object> response = new HashMap<>();
		if(form.getApp() == null){
			response.put("error", "Invalid App");
			return response;
		}
		System.err.println(form);
		response.put("data", serviceDao.retrieveAllWithImages(form.getApp(), form.getNum(),form.getLimit(), Module.SERVICE, form.getPageNum()));
		return response;
	}

	public Map<String, Object> featuredBoxServices() {
		
		return null;
	}
	
}
