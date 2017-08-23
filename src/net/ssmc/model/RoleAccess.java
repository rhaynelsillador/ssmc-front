package net.ssmc.model;

import java.util.List;

import net.ssmc.enums.Module;

public class RoleAccess {

	private String name;
	private Module module;
	private List<Role> roles;
	
	public RoleAccess(Module module, List<Role> roles) {
		this.module=module;
		this.roles=roles;
	}
	
	public Module getModule() {
		return module;
	}
	public void setModule(Module module) {
		this.module = module;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
	
}
