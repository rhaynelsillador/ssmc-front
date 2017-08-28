package net.cms.ssmc.dao;

import java.util.List;
import java.util.Map;

import net.cms.ssmc.model.Header;
import net.cms.ssmc.model.Service;
import net.ssmc.enums.App;
import net.ssmc.enums.Page;
import net.ssmc.model.Image;

public interface ServiceDao {

	List<Service> retrieveAll(App app);
//	Service retrieveActiveService(App app);
	
	List<Image> retrieveAllImages(App app);

	
}
