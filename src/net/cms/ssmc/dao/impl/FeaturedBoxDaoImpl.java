package net.cms.ssmc.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import net.cms.ssmc.dao.FeaturedBoxDao;
import net.cms.ssmc.model.FeaturedBox;
import net.ssmc.enums.Page;

public class FeaturedBoxDaoImpl implements FeaturedBoxDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final String SQL 		= "SELECT * FROM featuredbox WHERE page = ?";
	
	@Override
	public List<FeaturedBox> findAll(Page page) {
		return jdbcTemplate.query(SQL, new Object[]{page.toString()}, new BeanPropertyRowMapper<FeaturedBox>(FeaturedBox.class));
	}

}
