package net.ssmc.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import net.ssmc.dao.ClinicDao;
import net.ssmc.dao.mapper.ClinicMapper;
import net.ssmc.model.Clinic;

public class ClinicDaoImpl implements ClinicDao{

	private static final String FINDALL		= "SELECT CI.*, CY.name as cityname, CY.citykey as citykey FROM CLINIC AS CI INNER JOIN CITY AS CY ON CI.cityid=CY.id";
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Override
	public List<Clinic> retrieveAll() {
		return jdbcTemplate.query(FINDALL, new ClinicMapper());
	}

	
}
