package net.cms.ssmc.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import net.cms.ssmc.dao.HeaderDao;
import net.cms.ssmc.dao.ServiceDao;
import net.cms.ssmc.model.Header;
import net.cms.ssmc.model.Service;
import net.ssmc.enums.App;
import net.ssmc.enums.Module;
import net.ssmc.enums.Page;

public class ServiceServices {

	@Autowired
	private ServiceDao serviceDao;
	@Autowired
	private ControlServices controlServices;
	@Autowired
	private HeaderServices headerServices;

	public Header getServicesHeader(){
		return headerServices.getServicesHeader();
	}

	public Map<String, Object> getServices(Map<String, String> request){
		Map<String, Object> response = new HashMap<>();
		App app = null;
		try {
			app = App.valueOf(request.get("app"));
		} catch (Exception e) {
			response.put("error", "Invalid App");
			return response;
		}
		response.put("data", serviceDao.retrieveAllWithImages(app, Module.SERVICE));
		return response;
	}
	
	public List<Service> getServices(App app, Page page){
		List<Service> services = serviceDao.retrieveAllWithImages(app, Module.SERVICE);
		return services;
	}
	
	public Service getActiveService(HttpSession session, int id){
		if(controlServices.hasApproved(session, Module.SERVICE, id)){
//			return serviceDao.retrieveActiveService(App.BUSINESS);
		}return null;
	}	
}
