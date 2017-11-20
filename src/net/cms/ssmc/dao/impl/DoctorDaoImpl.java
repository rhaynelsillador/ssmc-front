package net.cms.ssmc.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import net.cms.ssmc.dao.DoctorDao;
import net.cms.ssmc.model.Doctor;

public class DoctorDaoImpl implements DoctorDao{

	
	private final static String FINDALL 	= "SELECT DC.*, DIR.NAME AS directory FROM DOCTOR AS DC INNER JOIN DIRECTORY AS DIR ON DC.DIRECTORYID=DIR.ID";
	private final static String FINDALLFILTER 	= "SELECT DC.* FROM DOCTOR AS DC WHERE DC.NAME LIKE ? AND DIRECTORYID=?";
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public List<Doctor> findAll() {
		return jdbcTemplate.query(FINDALL, new BeanPropertyRowMapper<Doctor>(Doctor.class));
	}

	@Override
	public List<Doctor> findAll(long directoryId, String name) {
		return jdbcTemplate.query(FINDALLFILTER, new Object[]{"%"+name+"%", directoryId}, new BeanPropertyRowMapper<Doctor>(Doctor.class));
	}

	

}
