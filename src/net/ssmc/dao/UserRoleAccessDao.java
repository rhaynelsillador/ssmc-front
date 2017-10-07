package net.ssmc.dao;

import java.util.List;

import net.ssmc.model.Role;

public interface UserRoleAccessDao {
	
	List<Role> retrieve(long userId, String roleName);
	void deleteByUserId(int id);
	void create(List<Role> roles);
}
