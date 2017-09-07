package net.cms.ssmc.dao.impl;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import net.cms.ssmc.dao.HeaderDao;
import net.cms.ssmc.model.Header;
import net.ssmc.enums.App;
import net.ssmc.enums.Page;
import net.ssmc.utils.DataTableHelper;

public class HeaderDaoImpl implements HeaderDao {

	private final String SQL 				= "SELECT * FROM HEADER WHERE page = ?";
	private static final String FINDONE		= "SELECT * FROM HEADER WHERE type = ? AND page = ?";
	private static final String FINDACTIVEONE = "SELECT * FROM HEADER WHERE type = ? AND status = ?";
	private static final String SQLCOUNT 	= "SELECT COUNT(id) FROM HEADER ";
	private static final String INSERT 		= "INSERT INTO HEADER (name, title, content, type, dateadded, dateupdated) VALUES (?, ?, ?, ?, ?, ?)";
	private static final String DELETEBYID 	= "DELETE FROM HEADER WHERE id= ? ";
	private static final String UPDATE	 	= "UPDATE HEADER SET name= ?, title = ?, content = ?, type=?, dateupdated = ? WHERE id= ? ";
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public List<Header> retrieve(Page page) {
		return jdbcTemplate.query(SQL, new Object[]{page.toString()}, new BeanPropertyRowMapper<Header>(Header.class));
	}
	
	@Override
	public Header retrieve(App app, Page page) throws Exception{
		return jdbcTemplate.queryForObject(FINDONE, new Object[]{app.toString(), page.toString()}, new BeanPropertyRowMapper<Header>(Header.class));
	}
	
//	@Override
//	public long count() {
//		return jdbcTemplate.queryForObject(SQLCOUNT, Long.class);
//	}
//	
//	@Override
//	public int create(Header header) {
//		return jdbcTemplate.update(INSERT, new Object[] {
//				header.getName(),
//				header.getTitle(),
//				header.getContent(),
//				header.getType().toString(),
//				new Timestamp(System.currentTimeMillis()),
//				new Timestamp(System.currentTimeMillis()),
//			});
//	}
//
//	@Override
//	public void update(Header header, int id) {
//		jdbcTemplate.update(UPDATE, new Object[] {
//				header.getName(),
//				header.getTitle(),
//				header.getContent(),
//				header.getType().toString(),
//				new Timestamp(System.currentTimeMillis()),
//				id
//			});
//	}
//
//	@Override
//	public List<Header> retrieveAll(Map<String, String> request) {
//		int start = Integer.parseInt(request.get("current"));
//		int end = Integer.parseInt(request.get("rowCount"));
//		String SQL = this.SQL + " " + DataTableHelper.sort(request) + " LIMIT "+((start-1)*end)+", "+(end);
//		return jdbcTemplate.query(SQL, new BeanPropertyRowMapper<Header>(Header.class));
//	}
//
//	@Override
//	public Header retrieve(int id) {
//		return jdbcTemplate.queryForObject(FINDONE, new Object[]{id}, new BeanPropertyRowMapper<Header>(Header.class));
//	}
//
//	@Override
//	public Header retrieveActive(App app) {
//		return jdbcTemplate.queryForObject(FINDACTIVEONE, new Object[]{app.toString(), true}, new BeanPropertyRowMapper<Header>(Header.class));
//	}
//
//	@Override
//	public void delete(int id) {
//		jdbcTemplate.update(DELETEBYID, new Object[] {id});
//	}
//
//	

}
