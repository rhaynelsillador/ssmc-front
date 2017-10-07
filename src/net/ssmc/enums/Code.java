package net.ssmc.enums;

public enum Code {

	OKAY("Okay", 1000),
	SUCCESS("Success", 1001),
	
	PENDING("Pending", 2000),

	ERROR("Error", 4000),
	INVALIDEMAIL("Invalid Email", 4001),
	INVALIDNUMBER("Invalid Number", 4002),
	INVALIDPASSWORD("Invalid Password", 4003),
	PASSWORDNOTSAME("Password not same.", 4004);
	
	
	private String name;
	private int code;
	
	private Code(String name, int code) {
		this.name=name;
		this.code=code;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}
	
	
}
