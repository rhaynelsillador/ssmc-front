package net.ssmc.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import net.ssmc.dao.ClinicDao;
import net.ssmc.dao.mapper.ClinicMapper;
import net.ssmc.enums.Page;
import net.ssmc.model.Clinic;

public class ClinicDaoImpl implements ClinicDao{

	private static final String FINDALL		= "SELECT CI.*, I.image as logo FROM CLINIC AS CI LEFT JOIN IMAGES I ON I.serviceid=CI.id WHERE I.type = ? AND page = ?";
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Override
	public List<Clinic> retrieveAll(Page page) {
		return jdbcTemplate.query(FINDALL, new Object[]{"CLINIC", page.toString()}, new ClinicMapper());
	}
}
