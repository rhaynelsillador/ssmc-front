package net.cms.ssmc.dao;

import java.util.List;

import net.cms.ssmc.model.ContactInformation;

public interface ContactInformationDao {
	
	void create(List<ContactInformation> contactInformations) throws Exception;
	List<ContactInformation> findAll();

}
