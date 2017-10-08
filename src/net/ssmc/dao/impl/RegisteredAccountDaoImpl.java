package net.ssmc.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;

import net.ssmc.dao.RegisteredAccountDao;
import net.ssmc.model.RegisteredAccount;
import net.ssmc.utils.AES;

public class RegisteredAccountDaoImpl implements RegisteredAccountDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
		
	private static final String FINDONEBYEMAIL = "SELECT * FROM registered_account WHERE EMAIL=? LIMIT 1";
	private static final String FINDONEBYEMAILANPASS = "SELECT * FROM registered_account WHERE EMAIL=? AND PASSWORD = ? LIMIT 1";
	private static final String INSERT = "INSERT INTO registered_account (email, password, number, datecreated, status) VALUES (?,?,?,?,?)";
	private static final String FINDONE = "SELECT * FROM registered_account WHERE ID=?";
	private static final String UPDATELASTLOGIN = "UPDATE registered_account SET datelastlogin = ? WHERE ID=?";
	
	@Override
	public long create(RegisteredAccount account) throws Exception{
		System.out.println(account.getNumber() + " :: " + account.getNumber());
		GeneratedKeyHolder holder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
		    @Override
		    public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
		        PreparedStatement statement = con.prepareStatement(INSERT, Statement.RETURN_GENERATED_KEYS);
		        statement.setString(1, account.getEmail());
		        statement.setString(2, AES.encrypt(account.getPassword()));
		        statement.setLong(3, account.getNumber());
		        statement.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
		        statement.setBoolean(5, account.isStatus());
		        return statement;
		    }
		}, holder);
		long primaryKey = holder.getKey().longValue();
		return primaryKey;
	}

	@Override
	public RegisteredAccount findOne(long id)  throws Exception{
		return jdbcTemplate.queryForObject(FINDONE, new Object[]{id}, new BeanPropertyRowMapper<RegisteredAccount>(RegisteredAccount.class));
	}

	@Override
	public RegisteredAccount findOne(String email)  throws Exception{
		return jdbcTemplate.queryForObject(FINDONEBYEMAIL, new Object[]{email}, new BeanPropertyRowMapper<RegisteredAccount>(RegisteredAccount.class));
	}

	@Override
	public RegisteredAccount findOne(String email, String password) throws Exception{
		return jdbcTemplate.queryForObject(FINDONEBYEMAILANPASS, new Object[]{email, password}, new BeanPropertyRowMapper<RegisteredAccount>(RegisteredAccount.class));
	}

	@Override
	public void update(long id) throws Exception {
		jdbcTemplate.update(UPDATELASTLOGIN, new Object[]{System.currentTimeMillis(), id});
	}

}
