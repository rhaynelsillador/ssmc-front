package net.cms.ssmc.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import net.cms.ssmc.dao.FaqDao;
import net.cms.ssmc.model.Faq;
import net.ssmc.enums.App;

public class FaqServices {

	@Autowired
	private FaqDao faqDao;
	
	public List<Faq> getAllFaq(App app){
		return faqDao.retrieve(app);
	}

}
