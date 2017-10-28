package net.cms.ssmc.services;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import net.cms.ssmc.dao.FeaturedBoxDao;
import net.cms.ssmc.model.FeaturedBox;
import net.ssmc.enums.Page;

public class FeaturedBoxServices {
	
	@Autowired
	private FeaturedBoxDao featuredBoxDao;
	
	public List<FeaturedBox> getFeaturedBoxes(Page page){		
		return featuredBoxDao.findAll(page);
	}
	
	
}
