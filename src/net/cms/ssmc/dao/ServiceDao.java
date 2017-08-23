package net.cms.ssmc.dao;

import java.util.List;
import java.util.Map;

import net.cms.ssmc.model.Header;
import net.cms.ssmc.model.Service;
import net.ssmc.enums.App;

public interface ServiceDao {

	long count();
	int create(Service service);
	void update(Service service, int id);
	List<Service> retrieveAll(Map<String, String> request);
	Service retrieve(int id);
	Service retrieveActiveService(App app);
	void delete(int id);
	
}
