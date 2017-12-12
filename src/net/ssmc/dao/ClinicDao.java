package net.ssmc.dao;

import java.util.List;

import net.ssmc.enums.Page;
import net.ssmc.model.Clinic;

public interface ClinicDao {
	
	List<Clinic> retrieveAll(Page page);
	
	
}
