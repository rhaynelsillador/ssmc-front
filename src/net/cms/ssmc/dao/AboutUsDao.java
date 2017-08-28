package net.cms.ssmc.dao;

import java.util.List;
import java.util.Map;

import net.cms.ssmc.model.AboutUs;
import net.ssmc.enums.App;

public interface AboutUsDao {

	AboutUs retrieve(App app);
	
	
}
