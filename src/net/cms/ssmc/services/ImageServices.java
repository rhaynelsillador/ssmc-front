package net.cms.ssmc.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import net.cms.ssmc.dao.ImageDao;
import net.cms.ssmc.model.Advertisement;
import net.cms.ssmc.model.NewsAndUpdatesImage;
import net.ssmc.enums.Module;
import net.ssmc.model.form.Form;

public class ImageServices {

	@Autowired
	private ImageDao imageDao;
	
	
	public Map<String, Object> getImages(Form form){
		Map<String, Object> response = new HashMap<>();
		if(form.getApp() == null){
			response.put("error", "Invalid App");
			return response;
		}else if(form.getPage() == null){
			response.put("error", "Invalid Page");
			return response;
		}else if(form.getModule() == null){
			response.put("error", "Invalid Module");
			return response;
		}
		response.put("data", imageDao.retrieveImage(form.getApp(), form.getPage(), form.getModule()));
		return response;
	}
	
	public List<Advertisement> getAllAdvertiseImages(){
		return imageDao.retrieveImage(Module.ADVERTISEMENT);
	}
	
	public List<NewsAndUpdatesImage> imagesByModuleId(long id, Module module){
		return imageDao.retrieveNewsAndUpdatesImage(id, module);
	}
	
	public List<NewsAndUpdatesImage> getNewsAndUpdatesImages(long id){
		return imageDao.retrieveNewsAndUpdatesImage(id, Module.NEWSANDUPDATES);
	}
}
