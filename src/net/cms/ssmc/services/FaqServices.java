package net.cms.ssmc.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import net.cms.ssmc.dao.FaqDao;
import net.cms.ssmc.model.Faq;
import net.ssmc.enums.App;

public class FaqServices {

	@Autowired
	private FaqDao faqDao;
	
	List<Faq> getBusinessFaq(){
		return faqDao.retrieve(App.BUSINESS);
	}
	List<Faq> getClinicFaq(){
		return faqDao.retrieve(App.CLINIC);
	}
}
