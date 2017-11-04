package net.cms.ssmc.services;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import net.cms.ssmc.dao.NewsAndUpdateDao;
import net.cms.ssmc.model.NewsAndUpdate;
import net.ssmc.enums.Button;

public class NewsAndUpdatesServices {

	@Autowired
	private NewsAndUpdateDao newsAndUpdateDao;
	
	public NewsAndUpdate getNewsAndUpdate(long id, Button button) throws Exception{
		if(id == 0 && (button == null || button != null)){
			return newsAndUpdateDao.findOne();
		}else if(id > 0 && button == null){
			return newsAndUpdateDao.findOne(id);
		}else if(id > 0 && button.equals(Button.NEXT)){
			return newsAndUpdateDao.findNextOne(id);
		}else if(id > 0 && button.equals(Button.PREVIOUS)){
			return newsAndUpdateDao.findPreviousOne(id);
		}
		return null;
	}
	
	public List<NewsAndUpdate> getPublishedNewsAndUpdats(){
		return newsAndUpdateDao.findAll();
	}
}
