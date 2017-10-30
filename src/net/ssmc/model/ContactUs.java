package net.ssmc.model;

import java.sql.Timestamp;

public class ContactUs {

	private int id;
	private String email;
	private String message;
	private Timestamp dateAdded;
	private String subject;
	private String name;
	private long userId;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Timestamp getDateAdded() {
		return dateAdded;
	}
	public void setDateAdded(Timestamp dateAdded) {
		this.dateAdded = dateAdded;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "ContactUs [id=" + id + ", email=" + email + ", message=" + message + ", dateAdded=" + dateAdded
				+ ", subject=" + subject + ", name=" + name + ", userId=" + userId + "]";
	}
	
	
}
