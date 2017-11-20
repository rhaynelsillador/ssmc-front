package net.cms.ssmc.dao;

import java.util.List;
import java.util.Map;

import net.cms.ssmc.model.Directory;

public interface DirectoryDao {

	long count(Map<String, String> request);
	long create(Directory directory);
	void delete(long id);
	List<Directory> findAll();
	List<Directory> findAll(Map<String, String> request);
	Directory findOne(long id);
	void update(Directory directory);
	
}
