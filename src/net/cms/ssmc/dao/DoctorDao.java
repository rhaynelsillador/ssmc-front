package net.cms.ssmc.dao;

import java.util.List;
import java.util.Map;

import net.cms.ssmc.model.Doctor;

public interface DoctorDao {


	Object count(Map<String, String> request);
	long create(Doctor doctor);
	void update(Doctor doctor);
	List<Doctor> findAll(Map<String, String> request);
	Doctor findOne(long id);
	void delete(long id);
	
}
