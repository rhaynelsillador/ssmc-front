package net.ssmc.dao;

import java.util.List;
import java.util.Map;

import net.ssmc.model.ContactUs;

public interface ContactUsDao {
	
	long count();
	void create(ContactUs contactUs);
	List<ContactUs> retrieveAll(Map<String, String> request);
	void delete(int id);
	

}
