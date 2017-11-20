package net.cms.ssmc.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;

import net.cms.ssmc.dao.DoctorDao;
import net.cms.ssmc.model.Directory;
import net.cms.ssmc.model.Doctor;

public class DoctorDaoImpl implements DoctorDao{

	private final static String SQLCREATE 	= "INSERT INTO DOCTOR (NAME, DAY, TIME, OTHER, BRANCH, DIRECTORYID) VALUES (?,?,?,?,?,?)";
	private final static String SQLDELETE 	= "DELETE FROM DOCTOR WHERE ID = ?";
	private final static String FINDALL 	= "SELECT DC.*, DIR.NAME AS directory FROM DOCTOR AS DC INNER JOIN DIRECTORY AS DIR ON DC.DIRECTORYID=DIR.ID";
	private final static String SQLCOUNT 	= "SELECT COUNT(ID) FROM DOCTOR";
	private final static String FINDONE 	= "SELECT * FROM DOCTOR WHERE ID = ?";
	private final static String UPDATE	 	= "UPDATE DOCTOR SET NAME=?, DAY=?, TIME=?, OTHER=?, BRANCH=? ,DIRECTORYID=? WHERE ID=?";
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public Object count(Map<String, String> request) {
		return jdbcTemplate.queryForObject(SQLCOUNT, new Object[]{}, Long.class);
	}
	
	@Override
	public long create(Doctor doctor) {
		GeneratedKeyHolder holder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
		    @Override
		    public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
		        PreparedStatement statement = con.prepareStatement(SQLCREATE, Statement.RETURN_GENERATED_KEYS);
		        statement.setString(1, doctor.getName());
		        statement.setString(2, doctor.getDay());
		        statement.setString(3, doctor.getTime());
		        statement.setString(4, doctor.getOther());
		        statement.setString(5, doctor.getBranch());
		        statement.setLong(6, doctor.getDirectoryId());
		        return statement;
		    }
		}, holder);
		long primaryKey = holder.getKey().longValue();
		return primaryKey;
	}

	@Override
	public void update(Doctor doctor) {
		jdbcTemplate.update(UPDATE, new Object[]{doctor.getName(), doctor.getDay(), doctor.getTime(), doctor.getOther(), doctor.getBranch(), doctor.getDirectoryId(), doctor.getId()});
	}

	@Override
	public List<Doctor> findAll(Map<String, String> request) {
		int start = Integer.parseInt(request.get("current"));
		int end = Integer.parseInt(request.get("rowCount"));
		return jdbcTemplate.query(FINDALL+" LIMIT "+((start-1)*end)+", "+(end), new BeanPropertyRowMapper<Doctor>(Doctor.class));
	}

	@Override
	public Doctor findOne(long id) {
		return jdbcTemplate.queryForObject(FINDONE, new Object[]{id}, new BeanPropertyRowMapper<Doctor>(Doctor.class));
	}

	@Override
	public void delete(long id) {
		jdbcTemplate.update(SQLDELETE, new Object[]{id});
	}

	

}
