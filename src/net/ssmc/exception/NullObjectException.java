package net.ssmc.exception;

public class NullObjectException extends NullPointerException {

	

	/**
	 * 
	 */
	private String message;
	
	
	private static final long serialVersionUID = 1L;
	
	public NullObjectException(String message) {
		this.message=message;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	
}
