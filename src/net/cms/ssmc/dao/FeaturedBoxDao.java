package net.cms.ssmc.dao;

import java.util.List;

import net.cms.ssmc.model.FeaturedBox;
import net.ssmc.enums.Page;

public interface FeaturedBoxDao {

	List<FeaturedBox> findAll(Page page);
	
}
