package net.ssmc.services;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import net.ssmc.dao.RoleAccessDao;
import net.ssmc.dao.UserRoleAccessDao;
import net.ssmc.enums.Access;
import net.ssmc.enums.Module;
import net.ssmc.enums.Status;
import net.ssmc.model.Helper;
import net.ssmc.model.Role;
import net.ssmc.model.RoleAccess;
import net.ssmc.model.User;

public class RoleServices {
	
	@Autowired
	private RoleAccessDao roleAccessDao;
	@Autowired
	private UserRoleAccessDao userRoleAccessDao;
	
	public List<Role> getRole(Map<String, String> request){
		return roleAccessDao.roles(request);
	}
	
	public Map<String, Object> retrieveRoles(Map<String, String> request){
		Map<String, Object> data = new HashMap<>();
		data.put("rows", getRole(request));
		data.put("current", request.get("current"));
		data.put("rowCount", request.get("rowCount"));
		data.put("total", roleAccessDao.count());
		return data;
	}
	
	public List<RoleAccess> roles(HttpSession session){
		String roleName = session.getAttribute("ROLENAME").toString();
		int roleId = Integer.parseInt(session.getAttribute("ROLEID").toString());
		List<Role> roleAcces = roleAccessDao.retrieveByRole(roleId, roleName);
		return roleAccess(roleAcces, roleName, roleId);
	}
	
	public  Map<String, Object> saveRoleUpdates(HttpSession session, List<Role> roles){
		int roleId = Integer.parseInt(session.getAttribute("ROLEID").toString());
		String roleName = session.getAttribute("ROLENAME").toString();
		Map<String, Object> response = new HashMap<>();
		try {
			roleAccessDao.deleteByRoleId(roleId);
			roleAccessDao.create(roles);
			response.put(Helper.STATUS, Status.SUCCESS);
			response.put(Helper.MESSAGE, roleName + " successfully updated");
		} catch (Exception e) {
			response.put(Helper.STATUS, Status.ERROR);
			response.put(Helper.MESSAGE, roleName + " unsuccessfully updated");
		}
		return response;
	}

	public List<RoleAccess> userRolesAdd(Role role){
		List<Role> roleAcces = roleAccessDao.retrieveByRole(role.getId(), role.getName());
		return roleAccess(roleAcces, role.getName(), role.getId());
	}
	
	public List<RoleAccess> userRolesUpdate(HttpSession session){
		User user = (User) session.getAttribute("user");
		List<Role> roleAcces = userRoleAccessDao.retrieve(user.getId(), user.getRoleName());
		return roleAccess(roleAcces, user.getRoleName(), user.getRoleId());
	}
	
	private List<RoleAccess> roleAccess(List<Role> roleAcces, String roleName, int roleId){
		List<RoleAccess> roleAccesses = new ArrayList<RoleAccess>();
		List<Module> modules = Arrays.asList(Module.values());
		for (Module module : modules) {
			if(module != Module.ALL){
				List<Access> access = Arrays.asList(Access.values());
				List<Role> roles = new ArrayList<Role>();
				for (Access access2 : access) {
					if(access2 != Access.ALL){
						Role role = new Role();
						role.setAccess(access2);
						role.setModule(module);
						role.setName(roleName);
						role.setId(roleId);
						role.setStatus(roleAcces.contains(role));
						roles.add(role);
					}
				}
				roleAccesses.add(new RoleAccess(module, roles));
			}
		}
		return roleAccesses;
	}
}
