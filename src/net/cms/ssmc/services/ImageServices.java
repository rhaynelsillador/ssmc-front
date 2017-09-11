package net.cms.ssmc.services;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import net.cms.ssmc.dao.ImageDao;
import net.ssmc.enums.App;
import net.ssmc.enums.Module;
import net.ssmc.enums.Page;

public class ImageServices {

	@Autowired
	private ImageDao imageDao;
	
	
	public Map<String, Object> getImages(Map<String, String> request){
		Map<String, Object> response = new HashMap<>();
		App app = null;
		Page page = null;
		Module module = null;
		try {
			app = App.valueOf(request.get("app"));
		} catch (Exception e) {
			response.put("error", "Invalid App");
			return response;
		}
		try {
			page = Page.valueOf(request.get("page"));
		} catch (Exception e) {
			response.put("error", "Invalid Page");
			return response;
		}
		try {
			module = Module.valueOf(request.get("module"));
		} catch (Exception e) {
			response.put("error", "Invalid Module");
			return response;
		}
		response.put("data", imageDao.retrieveImage(app, page, module));
		return response;
	}
	
}
