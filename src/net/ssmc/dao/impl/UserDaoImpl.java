package net.ssmc.dao.impl;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import net.ssmc.dao.UserDao;
import net.ssmc.dao.mapper.UserMapper;
import net.ssmc.model.User;
import net.ssmc.utils.AES;
import net.ssmc.utils.Settings;

public class UserDaoImpl implements UserDao{

	private String sql = "SELECT * FROM USER ";
	private static final String SQLCOUNT = "SELECT COUNT(id) FROM USER ";
	private static final String SQLCOUNTAPPROVER = "SELECT COUNT(id) FROM USER WHERE approver = true";
	private static final String UPDATE = "UPDATE USER SET firstname =?, lastname = ?, mobile = ?, phone=?, email=?, birthday=? WHERE id=?";
	private static final String CREATE = "INSERT INTO USER (username, password, firstname, lastname, mobile, phone, email, birthday, datelastlogin, roleid,datecreated) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
	private static final String UPDATEAPPROVER = "UPDATE USER SET approver =? WHERE id=?";
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public long count() {
        return jdbcTemplate.queryForObject(SQLCOUNT, Long.class);
	}
	
	@Override
	public User retrieve(int id) {
		final String SQL = this.sql+" INNER JOIN role ON role.id=user.roleid WHERE USER.id = ? ";
		return jdbcTemplate.queryForObject(SQL, new Object[]{id}, new UserMapper());
	}

	@Override
	public User retrieve(String username) {
		return null;
	}

	@Override
	public User login(String username, String password) throws Exception{
		final String SQL = this.sql+" INNER JOIN role ON role.id=user.roleid WHERE username = ? and password = ? ";
		return jdbcTemplate.queryForObject(SQL, new Object[]{username, password}, new UserMapper());
	}

	@Override
	public void create(User user) {
		Timestamp today = new Timestamp(System.currentTimeMillis());
		jdbcTemplate.update(CREATE, new Object[] {
				user.getUsername(),
				AES.encrypt(Settings.DEFAULTPASSWPRD),
				user.getFirstName(),
				user.getLastName(),
				user.getMobile(),
				user.getPhone(),
				user.getEmail(),
				user.getBirthday(),
				today,
				1,
				today
		});
	}

	@Override
	public List<User> retrieveAll(Map<String, String> request) {
		int start = Integer.parseInt(request.get("current"));
		int end = Integer.parseInt(request.get("rowCount"));
		final String SQL = this.sql +" as U INNER JOIN role as R on R.id=U.roleid LIMIT "+((start-1)*end)+", "+(end);
		System.out.println(SQL);
		return jdbcTemplate.query(SQL, new UserMapper());
	}

	@Override
	public void update(User user) {
		jdbcTemplate.update(UPDATE, new Object[] {
				user.getFirstName(),
				user.getLastName(),
				user.getMobile(),
				user.getPhone(),
				user.getEmail(),
				user.getBirthday(),
				user.getId()
		});
	}

	@Override
	public int countApprover() {
		return jdbcTemplate.queryForObject(SQLCOUNTAPPROVER, Integer.class);
	}

	@Override
	public void updateApprover(User user) {
		jdbcTemplate.update(UPDATEAPPROVER, new Object[] {
			user.isApprover(),
			user.getId()
		});
	}

	
}
