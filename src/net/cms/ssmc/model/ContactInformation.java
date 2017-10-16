package net.cms.ssmc.model;

import java.sql.Timestamp;

public class ContactInformation {

	private long id;
	private String name;
	private String value;
	private Timestamp timestamp;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public Timestamp getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(Timestamp timestamp) {
		this.timestamp = timestamp;
	}
	@Override
	public String toString() {
		return "ContactInformation [id=" + id + ", name=" + name + ", value=" + value + ", timestamp=" + timestamp
				+ "]";
	}
	
	
}
