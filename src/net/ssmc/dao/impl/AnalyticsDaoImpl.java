package net.ssmc.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;

import net.ssmc.dao.AnalyticsDao;
import net.ssmc.model.Analytics;

public class AnalyticsDaoImpl implements AnalyticsDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final String INSERT = "INSERT INTO analytics (country, ip, date, url, city, latitude, longhitude) VALUES (?,?,?,?,?,?,?)";
	
	@Override
	public long create(Analytics analytics) throws Exception {
		GeneratedKeyHolder holder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
		    @Override
		    public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
		        PreparedStatement statement = con.prepareStatement(INSERT, Statement.RETURN_GENERATED_KEYS);
		        statement.setString(1, analytics.getCountry());
		        statement.setString(2, analytics.getIp());
		        statement.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
		        statement.setString(4, analytics.getUrl());
		        statement.setString(5, analytics.getCity());
		        statement.setDouble(6, analytics.getLatitude());
		        statement.setDouble(7, analytics.getLonghitude());
		        return statement;
		    }
		}, holder);

		long primaryKey = holder.getKey().longValue();
		return primaryKey;
	}

}
