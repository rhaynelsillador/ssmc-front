package net.cms.ssmc.dao;

import java.util.List;
import java.util.Map;

import net.cms.ssmc.model.Faq;
import net.ssmc.enums.App;

public interface FaqDao {
	
	List<Faq> retrieve(App app);

}
