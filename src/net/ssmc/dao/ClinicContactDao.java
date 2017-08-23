package net.ssmc.dao;

import java.util.List;

import net.ssmc.model.ClinicContact;

public interface ClinicContactDao {

	ClinicContact retrieve(long id);
	List<ClinicContact> retrieveByClinic(long clinicId);
	
	
}
