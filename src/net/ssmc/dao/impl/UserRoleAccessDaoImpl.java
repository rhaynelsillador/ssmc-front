package net.ssmc.dao.impl;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;

import net.ssmc.dao.UserRoleAccessDao;
import net.ssmc.dao.mapper.RoleMapper;
import net.ssmc.model.Role;

public class UserRoleAccessDaoImpl implements UserRoleAccessDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private static final String SELECTBYUSERID = "SELECT *, ? as name FROM userroleaccess WHERE userid=?";
	private static final String DELETEROLES = "DELETE FROM userroleaccess WHERE userid=?";
	private static final String INSERT = "INSERT INTO userroleaccess (userid, module, access) VALUES (?,?,?)";
	
	@Override
	public List<Role> retrieve(long userId, String roleName) {
		return jdbcTemplate.query(SELECTBYUSERID, new Object[]{roleName, userId}, new RoleMapper());
	}
	
	@Override
	public void deleteByUserId(int id) {
		System.out.println("DELETING...");
		jdbcTemplate.update(DELETEROLES, new Object[]{id});
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
				
				System.out.println(role);
			}
			@Override
			public int getBatchSize() {
				return roles.size();
			}
		  });
	}
}
