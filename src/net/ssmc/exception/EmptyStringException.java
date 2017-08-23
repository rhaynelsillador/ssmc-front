package net.ssmc.exception;

public class EmptyStringException extends NullPointerException {

	

	/**
	 * 
	 */
	private String message;
	
	
	private static final long serialVersionUID = 1L;
	
	public EmptyStringException(String message) {
		this.message=message;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	
}
