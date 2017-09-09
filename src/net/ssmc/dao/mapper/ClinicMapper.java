package net.ssmc.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import net.ssmc.exception.EmptyStringException;
import net.ssmc.model.City;
import net.ssmc.model.Clinic;

public class ClinicMapper implements RowMapper<Clinic>{

	@Override
	public Clinic mapRow(ResultSet rs, int arg1) throws SQLException {
		Clinic clinic = new Clinic();
		clinic.setId(rs.getInt("id"));
		try {
			clinic.setName(rs.getString("name"));
		} catch (EmptyStringException e) {
			e.printStackTrace();
		}
		try {
			clinic.setDescription(rs.getString("description"));
		} catch (EmptyStringException e) {
			e.printStackTrace();
		}
		clinic.setDateAdded(rs.getTimestamp("dateadded"));
		clinic.setDateUpdated(rs.getTimestamp("dateupdated"));
		clinic.setLogo(rs.getString("logo"));
		clinic.setAddress1(rs.getString("address1"));
		clinic.setAddress2(rs.getString("address2"));
		clinic.setType(rs.getString("type"));
		try {
			clinic.setCity(new City(rs.getLong("cityid"),
					rs.getString("cityname"),
					rs.getString("citykey")));
		} catch (Exception e) {
		}
		clinic.setEmail(rs.getString("email"));
		clinic.setPhone(rs.getString("phone"));
		clinic.setMobile(rs.getString("mobile"));
		clinic.setMap(rs.getString("map"));
		return clinic;
	}

}
