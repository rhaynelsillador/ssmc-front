package net.cms.ssmc.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import net.cms.ssmc.dao.PartnerDao;
import net.cms.ssmc.model.Partner;

public class PartnerServices {

	@Autowired
	private PartnerDao partnersDao;
	
	public List<Partner> getPartners(){		
		return partnersDao.retrievePartners();
	}	
}
