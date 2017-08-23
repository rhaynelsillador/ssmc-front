package net.ssmc.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import net.ssmc.dao.ContactUsDao;
import net.ssmc.enums.Status;
import net.ssmc.model.ContactUs;
import net.ssmc.model.Helper;

public class ContactUsServices {
	
	@Autowired
	private ContactUsDao contactUsDao;
	
	public Map<String, Object> getAllMessages(HttpSession session, Map<String, String> request){
		Map<String, Object> data = new HashMap<>();
		List<ContactUs> contactUs = contactUsDao.retrieveAll(request);
		data.put("rows", contactUs);
		data.put("current", request.get("current"));
		data.put("rowCount", request.get("rowCount"));
		data.put("total", contactUsDao.count());
		return data;
	}

	public Map<String, Object> deleteFaq(HttpSession session, ContactUs contactUs) {
		Map<String, Object> response = new HashMap<>();
		try {
			contactUsDao.delete(contactUs.getId());
			response.put(Helper.MESSAGE, "Message successfully deleted");
			response.put(Helper.STATUS, Status.SUCCESS);
		} catch (Exception e) {
			response.put(Helper.MESSAGE, "Message unsuccessfully deleted");
			response.put(Helper.STATUS, Status.SUCCESS);
		}
		return response;
	} 
}
