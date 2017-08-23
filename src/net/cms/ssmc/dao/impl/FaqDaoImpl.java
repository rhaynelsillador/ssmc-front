package net.cms.ssmc.dao.impl;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import net.cms.ssmc.dao.FaqDao;
import net.cms.ssmc.model.Faq;
import net.ssmc.dao.mapper.FaqMapper;
import net.ssmc.dao.mapper.UserMapper;

public class FaqDaoImpl implements FaqDao{

	private final String SQL = "SELECT * FROM faq ";
	private static final String DELETEBYID = "DELETE FROM faq WHERE id= ? ";
	private static final String SQLCOUNT = "SELECT COUNT(id) FROM faq ";
	private static final String SQLUPDATE = "UPDATE faq SET question=?, answer=?, dateupdated=? WHERE id= ? ";
	private static final String SQLUPDATESTATUS = "UPDATE faq SET status=?, dateupdated=? WHERE id= ? ";
	private static final String SQLCREATE = "INSERT INTO faq (question, answer, dateadded, dateupdated, status) VALUES (?,?,?,?,?)";
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public long count() {
		return jdbcTemplate.queryForObject(SQLCOUNT, Long.class);
	}
	
	@Override
	public void create(Faq faq) {
		jdbcTemplate.update(SQLCREATE, new Object[] {
			faq.getQuestion(),
			faq.getAnswer(),
			new Timestamp(System.currentTimeMillis()),
			new Timestamp(System.currentTimeMillis()),
			true
		});
	}

	@Override
	public Faq retrieve(int id) {
		return jdbcTemplate.queryForObject(SQL+" WHERE id = ?", new Object[]{id}, new FaqMapper());
	}

	@Override
	public List<Faq> retrieveAll(Map<String, String> request) {
		int start = Integer.parseInt(request.get("current"));
		int end = Integer.parseInt(request.get("rowCount"));
		return jdbcTemplate.query(SQL+" LIMIT "+((start-1)*end)+", "+(end), new FaqMapper());
	}

	@Override
	public void update(Faq faq) {
		jdbcTemplate.update(SQLUPDATE, new Object[] {
				faq.getQuestion(),
				faq.getAnswer(),
				new Timestamp(System.currentTimeMillis()),
				faq.getId()
		});
	}

	@Override
	public void updateStatus(Faq faq) {
		jdbcTemplate.update(SQLUPDATESTATUS, new Object[] {
			faq.isStatus() ? false : true,
			new Timestamp(System.currentTimeMillis()),
			faq.getId()
		});
	}

	@Override
	public void delete(int id) {
		jdbcTemplate.update(DELETEBYID, new Object[] {id});
	}

	

}
