package net.cms.ssmc.services;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import net.cms.ssmc.model.Header;

public class CorporateServices {

	@Autowired
	private HeaderServices headerServices;
	@Autowired
	private ServiceServices serviceServices;
	
	public Header getCorporateHeader(HttpServletRequest httpServletRequest){
		return headerServices.getCorporateHeader();
		
	}
	
//	public Map<String, Object> getCorporateServices(HttpServletRequest httpServletRequest){
//		List<Service> services = serviceServices.getServices(App.BUSINESS, Page.Corporate);
//		Map<String, Object> response = new HashMap<>();
//		int count = 1;
//		for (Service service : services) {
//			httpServletRequest.setAttribute("service"+count, service);
//			response.put(""+count, service);
//			count++;
//		}
//		return response;
//		
//	}
	
}
