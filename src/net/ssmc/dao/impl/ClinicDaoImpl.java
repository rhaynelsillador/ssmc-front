package net.ssmc.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import net.ssmc.dao.ClinicDao;
import net.ssmc.dao.mapper.ClinicMapper;
import net.ssmc.model.Clinic;

public class ClinicDaoImpl implements ClinicDao{

	private static final String FINDALL		= "SELECT CI.*, CY.name as cityname, CY.citykey as citykey, I.image as logo FROM CLINIC AS CI INNER JOIN CITY AS CY ON CI.cityid=CY.id LEFT JOIN IMAGES I ON I.serviceid=CI.id WHERE I.type = 'CLINIC'";
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Override
	public List<Clinic> retrieveAll() {
		return jdbcTemplate.query(FINDALL, new ClinicMapper());
	}

	
}
