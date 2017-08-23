package net.ssmc.dao;

import java.util.List;
import java.util.Map;

import net.ssmc.model.Clinic;

public interface ClinicDao {

	long count();
	void create(Clinic clinic) throws Exception;
	Clinic retrieve(long id);
	List<Clinic> retrieveAll(Map<String, String> request);
	void update(Clinic clinic);
	
	
}
