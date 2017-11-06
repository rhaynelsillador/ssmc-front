package net.cms.ssmc.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import net.cms.ssmc.dao.NewsAndUpdateDao;
import net.cms.ssmc.model.NewsAndUpdate;

public class NewsAndUpdateDaoImpl implements NewsAndUpdateDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private static final String SQLFINDPREVIOUSONE = "SELECT * FROM news_and_update WHERE ID < ? AND STATUS = 1 ORDER BY id DESC LIMIT 1";
	private static final String SQLFINDNEXTONE = "SELECT * FROM news_and_update WHERE ID > ? AND STATUS = 1 ORDER BY id ASC LIMIT 1";
	private static final String SQLFINDONE = "SELECT * FROM news_and_update WHERE ID=? AND STATUS = 1 LIMIT 1";
	private static final String FINDONE = "SELECT * FROM news_and_update WHERE STATUS = 1 ORDER BY id DESC LIMIT 1";
	private static final String FINDALL = "SELECT * FROM news_and_update WHERE STATUS = 1 ORDER BY id DESC LIMIT 15";
	
	@Override
	public NewsAndUpdate findOne() throws Exception {
		return jdbcTemplate.queryForObject(FINDONE, new BeanPropertyRowMapper<NewsAndUpdate>(NewsAndUpdate.class));
	}
	@Override
	public NewsAndUpdate findOne(long id) throws Exception {
		return jdbcTemplate.queryForObject(SQLFINDONE, new Object[]{id}, new BeanPropertyRowMapper<NewsAndUpdate>(NewsAndUpdate.class));
	}

	@Override
	public NewsAndUpdate findNextOne(long id) throws Exception {
		return jdbcTemplate.queryForObject(SQLFINDNEXTONE, new Object[]{id}, new BeanPropertyRowMapper<NewsAndUpdate>(NewsAndUpdate.class));
	}

	@Override
	public NewsAndUpdate findPreviousOne(long id) throws Exception {
		return jdbcTemplate.queryForObject(SQLFINDPREVIOUSONE, new Object[]{id}, new BeanPropertyRowMapper<NewsAndUpdate>(NewsAndUpdate.class));
	}

	@Override
	public List<NewsAndUpdate> findAll() {
		return jdbcTemplate.query(FINDALL, new BeanPropertyRowMapper<NewsAndUpdate>(NewsAndUpdate.class));
	}
}
