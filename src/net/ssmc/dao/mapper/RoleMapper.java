package net.ssmc.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import net.ssmc.enums.Access;
import net.ssmc.enums.Module;
import net.ssmc.model.Role;

public class RoleMapper implements RowMapper<Role> {

	@Override
	public Role mapRow(ResultSet rs, int arg1) throws SQLException {
		Role role = new Role();
		role.setId(rs.getInt("id"));
		role.setName(rs.getString("name"));
		try {
			role.setModule(Module.values()[rs.getInt("module")]);
			role.setAccess(Access.values()[rs.getInt("access")]);
		} catch (Exception e) {
		}
		
		return role;
	}

}
