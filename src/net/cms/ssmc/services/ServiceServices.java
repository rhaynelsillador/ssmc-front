package net.cms.ssmc.services;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import net.cms.ssmc.dao.HeaderDao;
import net.cms.ssmc.dao.ImageDao;
import net.cms.ssmc.dao.ServiceDao;
import net.cms.ssmc.model.AboutUs;
import net.cms.ssmc.model.Faq;
import net.cms.ssmc.model.Header;
import net.cms.ssmc.model.Service;
import net.ssmc.enums.App;
import net.ssmc.enums.Module;
import net.ssmc.enums.Page;
import net.ssmc.enums.Status;
import net.ssmc.enums.TransactionType;
import net.ssmc.model.Helper;
import net.ssmc.model.Image;

public class ServiceServices {

	@Autowired
	private ServiceDao serviceDao;
	@Autowired
	private ControlServices controlServices;
	@Autowired
	private ImageDao imageDao;

	
	public List<Service> getServices(){
		List<Service> services = serviceDao.retrieveAll(App.BUSINESS);
		List<Image> images = imageDao.retrieveImage(Page.Corporate, Module.SERVICE);
		List<Service> tmp = new ArrayList<>();
		for (Service service : services) {
			for (Image image : images) {
				if(service.getId() == image.getServiceId()){
					List<Image> images2 = service.getImages();
					if(images2 == null)
						images2 = new ArrayList<>();
					images2.add(image);
					service.setImages(images2);
				}
			}
			tmp.add(service);
		}
		return tmp;
	}
	
	public Service getActiveService(HttpSession session, int id){
		if(controlServices.hasApproved(session, Module.SERVICE, id)){
//			return serviceDao.retrieveActiveService(App.BUSINESS);
		}return null;
	}	
}
