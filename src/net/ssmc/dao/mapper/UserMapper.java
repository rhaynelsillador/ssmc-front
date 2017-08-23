package net.ssmc.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import net.ssmc.model.User;

public class UserMapper implements RowMapper<User>{

	@Override
	public User mapRow(ResultSet rs, int arg1) throws SQLException {
		User user = new User();
		user.setId(rs.getInt("id"));
		user.setUsername(rs.getString("username"));
		user.setPassword(rs.getString("password"));
		user.setDateLastLogin(rs.getTimestamp("datelastlogin"));
		user.setRoleName(rs.getString("name"));
		user.setRoleId(rs.getInt("roleid"));
		user.setFirstName(rs.getString("firstname"));
		user.setLastName(rs.getString("lastname"));
		user.setMobile(rs.getString("mobile"));
		user.setPhone(rs.getString("phone"));
		user.setBirthday(rs.getDate("birthday"));
		user.setEmail(rs.getString("email"));
		user.setDateCreated(rs.getTimestamp("datecreated"));
		user.setApprover(rs.getBoolean("approver"));
		user.setAddress(rs.getString("address"));
		return user;
	}

}
