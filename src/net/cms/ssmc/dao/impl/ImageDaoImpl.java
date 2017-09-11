package net.cms.ssmc.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import net.cms.ssmc.dao.ImageDao;
import net.cms.ssmc.model.Header;
import net.ssmc.enums.App;
import net.ssmc.enums.Module;
import net.ssmc.enums.Page;
import net.ssmc.model.Image;

public class ImageDaoImpl implements ImageDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public List<Image> retrieveImage(App app, Page page, Module module) {
		final String SQL = "SELECT I.id, I.image, I.status, I.serviceid, H.type as type FROM IMAGES AS I INNER JOIN HEADER AS H ON H.id=I.serviceid WHERE H.page = ? AND I.type = ?";
		return jdbcTemplate.query(SQL, new Object[]{page.toString(), module.toString()}, new BeanPropertyRowMapper<Image>(Image.class));
	}
	
	@Override
	public List<Image> retrieveImage(Page page, Module module) {
		final String SQL = "SELECT I.id, I.image, I.status, I.serviceid, H.type as type FROM IMAGES AS I INNER JOIN HEADER AS H ON H.id=I.serviceid WHERE H.page = ? AND I.type = ?";
		return jdbcTemplate.query(SQL, new Object[]{page.toString(), module.toString()}, new BeanPropertyRowMapper<Image>(Image.class));
	}

}
