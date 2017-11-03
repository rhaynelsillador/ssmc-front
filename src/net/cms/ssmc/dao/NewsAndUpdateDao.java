package net.cms.ssmc.dao;

import net.cms.ssmc.model.NewsAndUpdate;

public interface NewsAndUpdateDao {

	NewsAndUpdate findOne() throws Exception;
	NewsAndUpdate findOne(long id) throws Exception;
	NewsAndUpdate findNextOne(long id) throws Exception;
	NewsAndUpdate findPreviousOne(long id) throws Exception;
	
}
