package net.ssmc.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import net.ssmc.dao.ClinicDao;
import net.ssmc.dao.mapper.ClinicMapper;
import net.ssmc.model.Clinic;

public class ClinicDaoImpl implements ClinicDao{

	private final String SQL 						= "SELECT * FROM CLINIC ";
	private static final String SQLCOUNT 	= "SELECT COUNT(id) FROM CLINIC ";
	private static final String INSERT 		= "INSERT INTO CLINIC (name, dateadded, dateupdated, description, address1, address2, city, map, type=?) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String UPDATE 		= "UPDATE CLINIC SET name=?, dateupdated=?, description=?, address1=?, address2=?, city=?, logo=?, map=?, type=? WHERE id=?";
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public long count() {
		return jdbcTemplate.queryForObject(SQLCOUNT, Long.class);
	}
	
	@Override
	public void create(Clinic clinic) throws Exception {
		jdbcTemplate.update(INSERT, new Object[] {
				clinic.getName(),
				clinic.getDateAdded(),
				clinic.getDateUpdated(),
				clinic.getDescription(),
				clinic.getAddress1(),
				clinic.getAddress2(),
				clinic.getCity(),
				clinic.getMap(),
				clinic.getType()
		});
	}

	@Override
	public List<Clinic> retrieveAll(Map<String, String> request) {
		int start = Integer.parseInt(request.get("current"));
		int end = Integer.parseInt(request.get("rowCount"));
		String SQL = "";
		if(!request.get("searchPhrase").toString().isEmpty()){
			SQL = this.SQL +" WHERE name LIKE '%"+ request.get("searchPhrase").toString() +"%' LIMIT "+((start-1)*end)+", "+(end);
		}else{
			SQL = this.SQL + " LIMIT "+((start-1)*end)+", "+(end);
		}
		return jdbcTemplate.query(SQL, new ClinicMapper());
	}

	@Override
	public Clinic retrieve(long id) {
		final String SQL = this.SQL + " WHERE id = ?";
		return jdbcTemplate.queryForObject(SQL, new Object[]{id}, new ClinicMapper());
	}

	@Override
	public void update(Clinic clinic) {

		System.out.println(clinic);
		jdbcTemplate.update(UPDATE, new Object[] {
				clinic.getName(),
				clinic.getDateUpdated(),
				clinic.getDescription(),
				clinic.getAddress1(),
				clinic.getAddress2(),
				(clinic.getCity() != null) ? clinic.getCity().getName() : clinic.getCity(),
				clinic.getLogo(),
				clinic.getMap(),
				clinic.getType(),
				clinic.getId()
		});
	}

	
}
