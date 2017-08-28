package net.cms.ssmc.dao;

import java.util.List;
import java.util.Map;

import net.cms.ssmc.model.Header;
import net.ssmc.enums.App;
import net.ssmc.enums.Page;

public interface HeaderDao {

	List<Header> retrieve(Page page);
	Header retrieve(App app, Page page);
	
	
}
