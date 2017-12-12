package net.cms.ssmc.dao;

import java.util.List;
import java.util.Map;

import net.cms.ssmc.model.Header;
import net.cms.ssmc.model.Service;
import net.ssmc.enums.App;
import net.ssmc.enums.Module;
import net.ssmc.enums.Page;
import net.ssmc.model.Image;

public interface ServiceDao {

	List<Service> retrieveAll(App app);
	List<Service> retrieveAllWithImages(App app, int num, int limit, Module module, int page);

	
}
