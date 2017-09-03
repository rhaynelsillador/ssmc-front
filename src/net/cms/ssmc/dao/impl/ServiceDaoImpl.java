package net.cms.ssmc.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import net.cms.ssmc.dao.ServiceDao;
import net.cms.ssmc.model.Service;
import net.ssmc.enums.App;
import net.ssmc.model.Image;

public class ServiceDaoImpl implements ServiceDao {

	private final String SQL 				= "SELECT * FROM SERVICE WHERE type = ? and status = ?";

	private static final String FINDIMAGES	= "SELECT SI.* FROM IMAGES AS SI INNER JOIN SERVICE AS S ON SI.serviceid=S.id WHERE S.type = ?";
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public List<Service> retrieveAll(App app) {
		return jdbcTemplate.query(SQL, new Object[]{app.toString(), true}, new BeanPropertyRowMapper<Service>(Service.class));
	}
	
	@Override
	public List<Image> retrieveAllImages(App app) {
		return jdbcTemplate.query(FINDIMAGES, new Object[]{app.toString()}, new BeanPropertyRowMapper<Image>(Image.class));
	}
	

}
