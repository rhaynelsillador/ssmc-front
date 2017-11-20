package net.cms.ssmc.dao;

import java.util.List;

import net.cms.ssmc.model.Doctor;

public interface DoctorDao {

	List<Doctor> findAll();
	List<Doctor> findAll(long directoryId, String name);
	
}
