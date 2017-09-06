package net.cms.ssmc.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import net.cms.ssmc.dao.AboutUsDao;
import net.cms.ssmc.dao.HeaderDao;
import net.cms.ssmc.model.AboutUs;
import net.cms.ssmc.model.Header;
import net.ssmc.enums.App;
import net.ssmc.enums.Module;
import net.ssmc.enums.Page;
import net.ssmc.enums.Status;
import net.ssmc.enums.TransactionType;
import net.ssmc.model.ContactUs;
import net.ssmc.model.Helper;

public class AboutUsServices {

	@Autowired
	private AboutUsDao aboutUsDao;
	@Autowired
	private HeaderDao headerDao;
	
	public List<AboutUs> getBusinessAboutUs(){
		return aboutUsDao.retrieve(App.BUSINESS);
	}
	
	public List<AboutUs> getClinicAboutUs(){
		return aboutUsDao.retrieve(App.CLINIC);
	}
	
	public Header getAboutUsHeader(){
		return headerDao.retrieve(App.BUSINESS, Page.About);
	}
	
}
