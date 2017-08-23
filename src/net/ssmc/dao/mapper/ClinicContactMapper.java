package net.ssmc.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import net.ssmc.enums.ContactType;
import net.ssmc.exception.EmptyStringException;
import net.ssmc.model.ClinicContact;

public class ClinicContactMapper implements RowMapper<ClinicContact>{

	@Override
	public ClinicContact mapRow(ResultSet rs, int arg1) throws SQLException {
		ClinicContact clinic = new ClinicContact();
		clinic.setId(rs.getInt("id"));
		try {
			clinic.setInfo(rs.getString("info"));
		} catch (EmptyStringException e) {
		}
		clinic.setType(ContactType.valueOf(rs.getString("type")));
		clinic.setDateAdded(rs.getTimestamp("dateadded"));
		clinic.setDateUpdated(rs.getTimestamp("dateupdated"));
		return clinic;
	}

}
