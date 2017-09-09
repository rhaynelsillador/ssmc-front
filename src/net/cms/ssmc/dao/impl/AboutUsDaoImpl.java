package net.cms.ssmc.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import net.cms.ssmc.dao.AboutUsDao;
import net.cms.ssmc.model.AboutUs;
import net.ssmc.enums.App;
import net.ssmc.enums.Module;

public class AboutUsDaoImpl implements AboutUsDao {

	private static final String QUERY		= "SELECT A.*, I.image FROM ABOUTUS AS A INNER JOIN IMAGES AS I ON A.id = I.serviceid WHERE A.type = ? AND I.type = ?";
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public List<AboutUs> retrieve(App app) {
		return jdbcTemplate.query(QUERY, new Object[]{app.toString(), Module.ABOUTUS.toString()}, new BeanPropertyRowMapper<AboutUs>(AboutUs.class));
	}
}
