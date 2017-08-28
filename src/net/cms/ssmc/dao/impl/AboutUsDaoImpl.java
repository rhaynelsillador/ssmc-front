package net.cms.ssmc.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import net.cms.ssmc.dao.AboutUsDao;
import net.cms.ssmc.model.AboutUs;
import net.ssmc.enums.App;

public class AboutUsDaoImpl implements AboutUsDao {

	private static final String FINDONE		= "SELECT * FROM ABOUTUS WHERE type = ?";
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public AboutUs retrieve(App app) {
		return jdbcTemplate.queryForObject(FINDONE, new Object[]{app.toString()}, new BeanPropertyRowMapper<AboutUs>(AboutUs.class));
	}
}
