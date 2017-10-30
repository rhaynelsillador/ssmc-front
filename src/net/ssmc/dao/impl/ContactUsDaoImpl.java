package net.ssmc.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import net.ssmc.dao.ContactUsDao;
import net.ssmc.model.ContactUs;
import net.ssmc.utils.DataTableHelper;

public class ContactUsDaoImpl implements ContactUsDao{
	
	private final String SQL 				= "SELECT * FROM CONTACTUS ";
	private static final String SQLCOUNT 	= "SELECT COUNT(id) FROM CONTACTUS ";
	private static final String INSERT 		= "INSERT INTO CONTACTUS (subject, message, email, dateadded, status, userid) VALUES (?, ?, ?, ?, ?, ?)";
	private static final String DELETEBYID = "DELETE FROM CONTACTUS WHERE id= ? ";
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public long count() {
		return jdbcTemplate.queryForObject(SQLCOUNT, Long.class);
	}

	@Override
	public void create(ContactUs contactUs) {
		jdbcTemplate.update(INSERT, new Object[] {
			contactUs.getSubject(),
			contactUs.getMessage(),
			contactUs.getEmail(),
			contactUs.getDateAdded(),
			"UNREAD",
			contactUs.getUserId()
		});
	}

	@Override
	public List<ContactUs> retrieveAll(Map<String, String> request) {
		int start = Integer.parseInt(request.get("current"));
		int end = Integer.parseInt(request.get("rowCount"));
		String SQL = this.SQL + " " + DataTableHelper.sort(request) + " LIMIT "+((start-1)*end)+", "+(end);
		return jdbcTemplate.query(SQL, new BeanPropertyRowMapper<ContactUs>(ContactUs.class));
	}

	@Override
	public void delete(int id) {
		jdbcTemplate.update(DELETEBYID, new Object[] {id});
	}

	
}
