package net.cms.ssmc.dao;

import java.util.List;
import java.util.Map;

import net.cms.ssmc.model.AboutUs;

public interface AboutUsDao {

	int create(AboutUs aboutUs);
	List<AboutUs> retrieveAll(Map<String, String> request);
	AboutUs retrieve(int id);
	void update(AboutUs aboutUs, int id);
	long count();
	void delete(int id);
	
}
