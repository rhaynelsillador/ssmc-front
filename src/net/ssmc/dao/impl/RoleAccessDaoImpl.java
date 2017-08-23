package net.ssmc.dao.impl;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;

import net.ssmc.dao.RoleAccessDao;
import net.ssmc.dao.mapper.RoleMapper;
import net.ssmc.model.Role;
import oracle.net.aso.r;

public class RoleAccessDaoImpl implements RoleAccessDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private static final String SELECTROLES = "SELECT * FROM ROLE";
	private static final String SQLCOUNT 	= "SELECT COUNT(id) FROM ROLE ";
	private static final String SELECTBYUSERID = "SELECT *, ? as name FROM roleaccess WHERE roleid=?";
	private static final String DELETEROLES = "DELETE FROM roleaccess WHERE roleid=?";
	private static final String INSERT = "INSERT INTO roleaccess (roleid, module, access) VALUES (?,?,?)";
	
	@Override
	public List<Role> retrieveByRole(int id, String name) {
		return jdbcTemplate.query(SELECTBYUSERID, new Object[]{name, id}, new RoleMapper());
	}
	
	@Override
	public List<Role> roles(Map<String, String> request) {
		return jdbcTemplate.query(SELECTROLES, new RoleMapper());
	}

	@Override
	public long count() {
		return jdbcTemplate.queryForObject(SQLCOUNT, Long.class);
	}

	@Override
	public void deleteByRoleId(int id) {
		jdbcTemplate.update(DELETEROLES, new Object[] {id});
	}

	@Override
	public void create(List<Role> roles) {
		jdbcTemplate.batchUpdate(INSERT, new BatchPreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				Role role = roles.get(i);
				ps.setInt(1, role.getId());
				ps.setInt(2, role.getModule().ordinal());
				ps.setInt(3, role.getAccess().ordinal());
			}
			@Override
			public int getBatchSize() {
				return roles.size();
			}
		  });
	}

}
