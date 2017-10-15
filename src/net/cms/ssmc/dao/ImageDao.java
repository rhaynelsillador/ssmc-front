package net.cms.ssmc.dao;

import java.util.List;

import net.cms.ssmc.model.Advertisement;
import net.ssmc.enums.App;
import net.ssmc.enums.Module;
import net.ssmc.enums.Page;
import net.ssmc.model.Image;

public interface ImageDao {

	List<Image> retrieveImage(App app, Page page, Module module);
	List<Image> retrieveImage(Page page, Module module);
	List<Advertisement> retrieveImage(Module module);
	
}
