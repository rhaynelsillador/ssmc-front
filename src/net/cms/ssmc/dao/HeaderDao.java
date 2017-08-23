package net.cms.ssmc.dao;

import java.util.List;
import java.util.Map;

import net.cms.ssmc.model.Header;
import net.ssmc.enums.App;

public interface HeaderDao {

	long count();
	int create(Header header);
	void update(Header header, int id);
	List<Header> retrieveAll(Map<String, String> request);
	Header retrieve(int id);
	Header retrieveActive(App app);
	void delete(int id);
	
}
