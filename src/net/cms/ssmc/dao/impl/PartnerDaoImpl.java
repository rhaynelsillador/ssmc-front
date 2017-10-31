package net.cms.ssmc.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import net.cms.ssmc.dao.PartnerDao;
import net.cms.ssmc.model.Partner;

public class PartnerDaoImpl implements PartnerDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final String SQL = "SELECT * FROM partner";
	
	@Override
	public List<Partner> retrievePartners() {
		return jdbcTemplate.query(SQL, new BeanPropertyRowMapper<Partner>(Partner.class));
	}
}
