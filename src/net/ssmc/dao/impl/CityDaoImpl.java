package net.ssmc.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import net.ssmc.dao.CityDao;
import net.ssmc.model.City;

public class CityDaoImpl implements CityDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public long create(City city) {
		return 0;
	}

	@Override
	public List<City> findAll() {
		final String SQL = "SELECT * FROM CITY";
		return jdbcTemplate.query(SQL, new BeanPropertyRowMapper<City>(City.class));
		
	}

}
