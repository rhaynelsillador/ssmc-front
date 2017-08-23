package net.ssmc.dao;

import java.util.List;
import java.util.Map;

import net.ssmc.model.Role;

public interface RoleAccessDao {

	long count();
	List<Role> roles(Map<String, String> request);
	List<Role> retrieveByRole(int id, String name);
	void deleteByRoleId(int id);
	void create(List<Role> roles);
}
