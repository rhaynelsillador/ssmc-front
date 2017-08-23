package net.ssmc.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import net.ssmc.dao.ClinicContactDao;
import net.ssmc.dao.mapper.ClinicContactMapper;
import net.ssmc.model.ClinicContact;

public class ClinicContactDaoImpl implements ClinicContactDao {

	private static String SELECT 				= "SELECT * FROM CLINICCONTACT ";
	private static final  String SELECTBYID		= SELECT + " WHERE id = ?";
	private static final  String SELECTBYCLINIC	= SELECT + " WHERE clinicid = ?";
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public ClinicContact retrieve(long id) {
		return jdbcTemplate.queryForObject(SELECTBYID, new Object[]{id}, new ClinicContactMapper());
	}

	@Override
	public List<ClinicContact> retrieveByClinic(long clinicId) {
		return jdbcTemplate.query(SELECTBYCLINIC, new Object[]{clinicId}, new ClinicContactMapper());
	}

}
