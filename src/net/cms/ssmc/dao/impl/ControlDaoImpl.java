package net.cms.ssmc.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import net.cms.ssmc.dao.ControlDao;
import net.cms.ssmc.model.Control;
import net.cms.ssmc.model.ControlMapper;
import net.ssmc.enums.Module;

public class ControlDaoImpl implements ControlDao {

	private static final String INSERT 			= "INSERT INTO CONTROL (module, moduleid) VALUES (?, ?)";
	private static final String INSERTAPPROVED	= "INSERT INTO USERAPPROVE (userid, controlid) VALUES (?, ?)";
	private static final String FINDONE			= "SELECT * FROM CONTROL WHERE id = ?";
	private static final String FINDONEBYMODULE	= "SELECT * FROM CONTROL WHERE module = ? AND moduleid = ?";
	private static final String DELETEBYID 		= "DELETE FROM USERAPPROVE WHERE controlid= ? ";
	private static final String COUNTAPPROVED 	= "SELECT COUNT(id) FROM USERAPPROVE WHERE controlid= ? ";
	private static final String HASAPPROVED 	= "SELECT COUNT(C.id) FROM USERAPPROVE AS UP INNER JOIN CONTROL AS C ON C.id=UP.controlid WHERE module= ? AND moduleid = ? LIMIT 1";
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public void create(Control control) {
		jdbcTemplate.update(INSERT, new Object[] {
			control.getModule().ordinal(),
			control.getModuleId()
		});
	}
	@Override
	public void createApproved( int userId, int controlId) {
		jdbcTemplate.update(INSERTAPPROVED, new Object[] {
			userId,
			controlId
		});
	}

	@Override
	public Control retrieveByModule(Control control) throws Exception{
		System.out.println(control.getModuleId()+" " + control.getModule().ordinal());
		return jdbcTemplate.queryForObject(FINDONEBYMODULE, new Object[]{control.getModule().ordinal(), control.getModuleId()}, new ControlMapper());
	}
	
	@Override
	public Control retrieve(Control control) {
		return jdbcTemplate.queryForObject(FINDONE, new BeanPropertyRowMapper<Control>(Control.class));
	}

	@Override
	public void deleteApproved(int controlId) {
		jdbcTemplate.update(DELETEBYID, new Object[] {controlId});
	}

	@Override
	public void deleteControl(int module, int moduleId) {
		jdbcTemplate.update(DELETEBYID, new Object[] {module, moduleId});
	}

	@Override
	public int countApproved(int controlId) {
		return jdbcTemplate.queryForObject(COUNTAPPROVED, Integer.class);
	}

	@Override
	public int hasApproved(Module module , int controlId) {
		return jdbcTemplate.queryForObject(HASAPPROVED, new Object[]{module.ordinal(), controlId}, Integer.class);
	}

}
