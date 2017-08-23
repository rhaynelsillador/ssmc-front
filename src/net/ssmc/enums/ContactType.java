package net.ssmc.enums;

public enum ContactType {
	
	M("Mobile"),
	E("Email"),
	P("Phone");
	
	
	private String name;
	
	private ContactType(String name) {
		this.name=name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	

}
