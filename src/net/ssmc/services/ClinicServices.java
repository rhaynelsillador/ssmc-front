package net.ssmc.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import net.cms.ssmc.model.Header;
import net.cms.ssmc.services.HeaderServices;
import net.ssmc.dao.ClinicContactDao;
import net.ssmc.dao.ClinicDao;
import net.ssmc.model.Clinic;

public class ClinicServices {
	
	@Autowired
	private ClinicDao clinicDao;
	@Autowired
	private HeaderServices headerServices;
	
	public Header getClinicHeader(){
		return headerServices.getClinicHeader();
	}
}
