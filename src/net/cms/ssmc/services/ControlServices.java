package net.cms.ssmc.services;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import net.cms.ssmc.dao.ControlDao;
import net.cms.ssmc.model.Control;
import net.ssmc.dao.UserDao;
import net.ssmc.enums.Module;
import net.ssmc.model.User;

public class ControlServices {

	@Autowired
	private ControlDao controlDao;
	@Autowired
	private UserDao userDao;
	
	public void createControl(Module module, int moduleId){
		Control control = new Control();
		control.setModule(module);
		control.setModuleId(moduleId);
		controlDao.create(control);
	}
	
	public boolean isApproved(Control control){
		int approved = controlDao.countApproved(control.getId());
		return userDao.countApprover() == approved ? false : true;
	}
	
	public void createControl(Control control){
		controlDao.create(control);
	}
	
	public void deleteApproved(int controlId){
		controlDao.deleteApproved(controlId);
	}
	
	public void deleteControl(int module, int moduleId){
		controlDao.deleteControl(module, moduleId);
	}
	
	public boolean hasApproved(HttpSession session, Module module, int controlId){
		User user = (User) session.getAttribute("user");
		if(user.isApprover()){
			boolean hasApproved = controlDao.hasApproved(module, controlId) != 0 ? true : false;
			session.setAttribute("hasApproved", hasApproved);
			return hasApproved;
		}
		return false;
	}
	
	public boolean approve(HttpSession session, Control control){
		User user = (User) session.getAttribute("user");
		Control control2;
		try {
			control2 = controlDao.retrieveByModule(control);
			controlDao.createApproved(user.getId(), control2.getId());
		} catch (Exception e) {
			return false;
		}
		
		return true;
	}
}
