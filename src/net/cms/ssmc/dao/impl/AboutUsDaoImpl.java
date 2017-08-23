package net.cms.ssmc.dao.impl;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import net.cms.ssmc.dao.AboutUsDao;
import net.cms.ssmc.model.AboutUs;
import net.ssmc.utils.DataTableHelper;

public class AboutUsDaoImpl implements AboutUsDao {

	private final String SQL 				= "SELECT * FROM ABOUTUS ";
	private static final String FINDONE		= "SELECT * FROM ABOUTUS WHERE id = ?";
	private static final String SQLCOUNT 	= "SELECT COUNT(id) FROM ABOUTUS ";
	private static final String INSERT 		= "INSERT INTO ABOUTUS (name, content, dateadded, dateupdated, type) VALUES (?, ?, ?, ?, ?)";
	private static final String DELETEBYID 	= "DELETE FROM ABOUTUS WHERE id= ? ";
	private static final String UPDATE	 	= "UPDATE ABOUTUS SET name= ?, content = ?, type=?, dateupdated = ? WHERE id= ? ";
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public long count() {
		return jdbcTemplate.queryForObject(SQLCOUNT, Long.class);
	}
	
	@Override
	public int create(AboutUs aboutUs) {
		return jdbcTemplate.update(INSERT, new Object[] {
				aboutUs.getName(),
				aboutUs.getContent(),
				new Timestamp(System.currentTimeMillis()),
				new Timestamp(System.currentTimeMillis()),
				aboutUs.getType().toString()
			});
	}

	@Override
	public List<AboutUs> retrieveAll(Map<String, String> request) {
		int start = Integer.parseInt(request.get("current"));
		int end = Integer.parseInt(request.get("rowCount"));
		String SQL = this.SQL + " " + DataTableHelper.sort(request) + " LIMIT "+((start-1)*end)+", "+(end);
		return jdbcTemplate.query(SQL, new BeanPropertyRowMapper<AboutUs>(AboutUs.class));
	}

	@Override
	public AboutUs retrieve(int id) {
		return jdbcTemplate.queryForObject(FINDONE, new Object[]{id}, new BeanPropertyRowMapper<AboutUs>(AboutUs.class));
	}

	@Override
	public void update(AboutUs aboutUs, int id) {
		jdbcTemplate.update(UPDATE, new Object[] {
			aboutUs.getName(),
			aboutUs.getContent(),
			aboutUs.getType().toString(),
			new Timestamp(System.currentTimeMillis()),
			id
		});
	}

	@Override
	public void delete(int id) {
		jdbcTemplate.update(DELETEBYID, new Object[] {id});
	}

}
