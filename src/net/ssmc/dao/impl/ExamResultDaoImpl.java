package net.ssmc.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import net.ssmc.dao.ExamResultDao;
import net.ssmc.model.ExamResult;

public class ExamResultDaoImpl implements ExamResultDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	private final String INSERT  = "INSERT INTO examresult (name, description, encodedBy, accountId, status, result, dateExamined, dateEncoded) VALUES (?,?,?,?,?,?,?,?)";
	private final String FINDALL = "SELECT * FROM examresult AS ER WHERE accountid=?";
	private final String DELETE  = "DELETE FROM examresult WHERE id=?";
	
	@Override
	public void create(ExamResult examResult) {
		jdbcTemplate.update(INSERT, new Object[] {
				examResult.getName(),
				examResult.getDescription(),
				examResult.getEncodedBy(),
				examResult.getAccountId(),
				examResult.getStatus().toString(),
				examResult.getResult(),
				examResult.getDateExamined(),
				examResult.getDateEncoded()
			});
	}

	@Override
	public List<ExamResult> findByAccount(long accountId) {
		return jdbcTemplate.query(FINDALL, new Object[]{accountId}, new BeanPropertyRowMapper<ExamResult>(ExamResult.class));
	}

	@Override
	public void delete(long id) {
		jdbcTemplate.update(DELETE, new Object[] {id});
	}

}
