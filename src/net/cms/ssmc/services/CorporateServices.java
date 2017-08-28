package net.cms.ssmc.services;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import net.cms.ssmc.model.Service;

public class CorporateServices {

	@Autowired
	private HeaderServices headerServices;
	@Autowired
	private ServiceServices serviceServices;
	
	public void getCorporateContent(HttpServletRequest httpServletRequest){
		httpServletRequest.setAttribute("header", headerServices.getBusinessHeader());
		List<Service> services = serviceServices.getServices();
		int count = 1;
		for (Service service : services) {
			httpServletRequest.setAttribute("service"+count, service);
			count++;
		}
		
	}
	
}
