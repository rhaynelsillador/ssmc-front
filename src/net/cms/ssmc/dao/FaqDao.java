package net.cms.ssmc.dao;

import java.util.List;
import java.util.Map;

import net.cms.ssmc.model.Faq;

public interface FaqDao {
	
	long count();
	void create(Faq faq);
	Faq retrieve(int id);
	List<Faq> retrieveAll(Map<String, String> request);
	void update(Faq faq);
	void updateStatus(Faq faq);
	void delete(int id);

}
