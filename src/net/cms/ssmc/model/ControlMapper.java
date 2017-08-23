package net.cms.ssmc.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import net.ssmc.enums.Module;

public class ControlMapper implements RowMapper<Control>{

	@Override
	public Control mapRow(ResultSet rs, int arg1) throws SQLException {
		Control control = new Control();
		control.setId(rs.getInt("id"));
		control.setModule(Module.values()[rs.getInt("module")]);
		control.setModuleId(rs.getInt("moduleid"));
		return control;
	}

}
