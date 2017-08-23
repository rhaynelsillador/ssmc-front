package net.cms.ssmc.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import net.cms.ssmc.dao.HeaderDao;
import net.cms.ssmc.dao.ServiceDao;
import net.cms.ssmc.model.AboutUs;
import net.cms.ssmc.model.Faq;
import net.cms.ssmc.model.Header;
import net.cms.ssmc.model.Service;
import net.ssmc.enums.App;
import net.ssmc.enums.Module;
import net.ssmc.enums.Status;
import net.ssmc.enums.TransactionType;
import net.ssmc.model.Helper;

public class ServiceServices {

	@Autowired
	private ServiceDao serviceDao;
	@Autowired
	private ControlServices controlServices;
	
	public Map<String, Object> getAllServices(Map<String, String> request){
		Map<String, Object> data = new HashMap<>();
		List<Service> Services = serviceDao.retrieveAll(request);
		data.put("rows", Services);
		data.put("current", request.get("current"));
		data.put("rowCount", request.get("rowCount"));
		data.put("total", serviceDao.count());
		return data;
	} 
	
	public Service getService(HttpSession session, int id){
		return serviceDao.retrieve(id);
	}
	
	public Service getActiveService(HttpSession session, int id){
		if(controlServices.hasApproved(session, Module.SERVICE, id)){
			return serviceDao.retrieveActiveService(App.BUSINESS);
		}return null;
	}
	
	public Map<String, Object> createUpdateService(HttpSession session, Service service){
		TransactionType transactionType = (TransactionType) session.getAttribute("TRANSACTION");
		Map<String, Object> response = new HashMap<>();
		response.put(Helper.STATUS, Status.ERROR);
		if(service.getName() == null || service.getName().isEmpty()){
			response.put(Helper.MESSAGE, "Service name is required!");
		}else if(service.getTitle() == null || service.getTitle().isEmpty()){
			response.put(Helper.MESSAGE, "Service title is required!");
		}else if(service.getContent() == null || service.getContent().isEmpty()){
			response.put(Helper.MESSAGE, "Service content is required!");
		}else{
			switch(transactionType){
			case ADD:
				try {
					int id = serviceDao.create(service);
					controlServices.createControl(Module.SERVICE, id);
					response.put(Helper.MESSAGE, "About us successfully added");
					response.put(Helper.STATUS, Status.SUCCESS);
				} catch (Exception e) {
					response.put(Helper.MESSAGE, "About us unsuccessfully added");
					response.put(Helper.STATUS, Status.ERROR);
				}
				break;
			case UPDATE:
				try {
					Service service2 = (Service) session.getAttribute("service");
					
					System.out.println(service2);
					serviceDao.update(service, service2.getId());
					response.put(Helper.MESSAGE, "Service successfully updated");
					response.put(Helper.STATUS, Status.SUCCESS);
				} catch (Exception e) {
					e.printStackTrace();
					response.put(Helper.MESSAGE, "Service unsuccessfully updated");
					response.put(Helper.STATUS, Status.ERROR);
				}
				break;
			default:
				break;
			}
		}
		return response;
	}		
}
