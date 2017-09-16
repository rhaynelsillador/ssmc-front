package net.cms.ssmc.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import net.cms.ssmc.dao.ServiceDao;
import net.cms.ssmc.model.Service;
import net.ssmc.enums.App;
import net.ssmc.enums.Module;
import net.ssmc.enums.Page;
import net.ssmc.model.Image;

public class ServiceDaoImpl implements ServiceDao {

	private final String SQL 				= "SELECT * FROM SERVICE WHERE type = ?";
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public List<Service> retrieveAll(App app) {
		return jdbcTemplate.query(SQL, new Object[]{app.toString()}, new BeanPropertyRowMapper<Service>(Service.class));
	}
	
	@Override
	public List<Service> retrieveAllWithImages(App app, int num, int limit, Module module) {
		String SQLWITHIMAGES = "SELECT S.*, I.image as image FROM SERVICE AS S LEFT JOIN IMAGES AS I ON S.id = I.serviceid WHERE S.type = ? AND I.type=? and S.num = ? AND I.status = ?";
		if(limit > 0){
			SQLWITHIMAGES += " LIMIT "+limit;
		}
		return jdbcTemplate.query(SQLWITHIMAGES, new Object[]{app.toString(), module.toString(), num, true}, new BeanPropertyRowMapper<Service>(Service.class));
	}	

}
