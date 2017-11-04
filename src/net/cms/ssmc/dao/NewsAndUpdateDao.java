package net.cms.ssmc.dao;

import java.util.List;

import net.cms.ssmc.model.NewsAndUpdate;

public interface NewsAndUpdateDao {

	NewsAndUpdate findOne() throws Exception;
	NewsAndUpdate findOne(long id) throws Exception;
	NewsAndUpdate findNextOne(long id) throws Exception;
	NewsAndUpdate findPreviousOne(long id) throws Exception;
	List<NewsAndUpdate> findAll();
}
