package net.cms.ssmc.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import net.cms.ssmc.model.Header;
import net.cms.ssmc.model.Service;

public class CorporateServices {

	@Autowired
	private HeaderServices headerServices;
	@Autowired
	private ServiceServices serviceServices;
	
	public Header getCorporateHeader(HttpServletRequest httpServletRequest){
		return headerServices.getCorporateHeader();
		
	}
	
	public Map<String, Object> getCorporateServices(HttpServletRequest httpServletRequest){
		List<Service> services = serviceServices.getServices();
		Map<String, Object> response = new HashMap<>();
		int count = 1;
		for (Service service : services) {
			httpServletRequest.setAttribute("service"+count, service);
			response.put(""+count, service);
			count++;
		}
		return response;
		
	}
	
}
