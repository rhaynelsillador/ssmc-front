package net.cms.ssmc.services;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import net.cms.ssmc.dao.ImageDao;
import net.ssmc.enums.App;
import net.ssmc.enums.Module;
import net.ssmc.enums.Page;
import net.ssmc.model.form.Form;

public class ImageServices {

	@Autowired
	private ImageDao imageDao;
	
	
	public Map<String, Object> getImages(Form form){
		System.out.println(form);
		Map<String, Object> response = new HashMap<>();
//		try {
//			app = App.valueOf(request.get("app"));
//		} catch (Exception e) {
//			response.put("error", "Invalid App");
//			return response;
//		}
//		try {
//			page = Page.valueOf(request.get("page"));
//		} catch (Exception e) {
//			response.put("error", "Invalid Page");
//			return response;
//		}
//		try {
//			module = Module.valueOf(request.get("module"));
//		} catch (Exception e) {
//			response.put("error", "Invalid Module");
//			return response;
//		}
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
	
}
