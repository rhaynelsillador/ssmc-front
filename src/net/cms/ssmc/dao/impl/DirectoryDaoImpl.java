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

import net.cms.ssmc.dao.DirectoryDao;
import net.cms.ssmc.model.Directory;

public class DirectoryDaoImpl implements DirectoryDao {

	private final static String SQLCREATE 	= "INSERT INTO DIRECTORY (name, status) VALUES (?,?)";
	private final static String SQLCOUNT 	= "SELECT COUNT(ID) FROM DIRECTORY";
	private final static String SQLDELETE 	= "DELETE FROM DIRECTORY WHERE ID = ?";
	private final static String FINDALL 	= "SELECT * FROM DIRECTORY";
	private final static String FINDONE 	= "SELECT * FROM DIRECTORY WHERE ID = ?";
	private final static String UPDATE	 	= "UPDATE DIRECTORY SET NAME=?, status=? WHERE ID = ?";
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public long count(Map<String, String> request) {
		return jdbcTemplate.queryForObject(SQLCOUNT, new Object[]{}, Long.class);
	}
	
	@Override
	public long create(Directory directory) {
		GeneratedKeyHolder holder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
		    @Override
		    public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
		        PreparedStatement statement = con.prepareStatement(SQLCREATE, Statement.RETURN_GENERATED_KEYS);
		        statement.setString(1, directory.getName());
		        statement.setBoolean(2, directory.isStatus());
		        return statement;
		    }
		}, holder);
		long primaryKey = holder.getKey().longValue();
		return primaryKey;
	}

	@Override
	public void delete(long id) {
		jdbcTemplate.update(SQLDELETE, new Object[]{id});
	}

	@Override
	public List<Directory> findAll() {
		return jdbcTemplate.query(FINDALL, new BeanPropertyRowMapper<Directory>(Directory.class));
	}
	
	@Override
	public List<Directory> findAll(Map<String, String> request) {
		int start = Integer.parseInt(request.get("current"));
		int end = Integer.parseInt(request.get("rowCount"));
		return jdbcTemplate.query(FINDALL+" LIMIT "+((start-1)*end)+", "+(end), new BeanPropertyRowMapper<Directory>(Directory.class));
	}

	@Override
	public Directory findOne(long id) {
		return jdbcTemplate.queryForObject(FINDONE, new Object[]{id}, new BeanPropertyRowMapper<Directory>(Directory.class));
	}

	@Override
	public void update(Directory directory) {
		jdbcTemplate.update(UPDATE, new Object[]{directory.getName(), directory.isStatus(), directory.getId()});
	}

	

}
