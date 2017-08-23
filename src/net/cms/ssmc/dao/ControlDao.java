package net.cms.ssmc.dao;

import net.cms.ssmc.model.Control;
import net.ssmc.enums.Module;

public interface ControlDao {
	
	void create(Control control);
	void createApproved(int userId, int controlId);
	Control retrieve(Control control);
	void deleteApproved(int controlId);
	void deleteControl(int module, int moduleId);
	int countApproved(int controlId);
	int hasApproved(Module module , int controlId);
	Control retrieveByModule(Control control) throws Exception;

}
