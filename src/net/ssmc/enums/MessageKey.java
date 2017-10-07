package net.ssmc.enums;

public enum MessageKey {
	
	STATUS("status"),
	MESSAGE("message"),
	CODE("code");
	
	
	
	private String name;
	
	private MessageKey(String name) {
		this.name=name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
