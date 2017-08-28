package net.cms.ssmc.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import net.cms.ssmc.dao.FaqDao;
import net.cms.ssmc.model.Faq;
import net.ssmc.dao.mapper.FaqMapper;
import net.ssmc.enums.App;

public class FaqDaoImpl implements FaqDao{

	private final String SQL = "SELECT * FROM faq ";
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	@Override
	public List<Faq> retrieve(App app) {
		return jdbcTemplate.query(SQL, new Object[]{app.toString()}, new FaqMapper());
	}
}
