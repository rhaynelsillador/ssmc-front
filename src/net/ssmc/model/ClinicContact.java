package net.ssmc.model;

import java.sql.Timestamp;

import net.ssmc.enums.ContactType;
import net.ssmc.exception.EmptyStringException;
import net.ssmc.exception.NullObjectException;

public class ClinicContact {

	private int id;
	private String info;
	private ContactType type;
	private Timestamp dateAdded;
	private Timestamp dateUpdated;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) throws EmptyStringException{
		if(info == null || info.isEmpty()){
			throw new EmptyStringException("Contact info is required");
		}
		this.info = info;
	}
	public ContactType getType() {
		return type;
	}
	public void setType(ContactType type) throws NullObjectException{
		if(type == null){
			throw new NullObjectException("Contact type is null.");
		}
		this.type = type;
	}
	public Timestamp getDateAdded() {
		return dateAdded;
	}
	public void setDateAdded(Timestamp dateAdded) {
		this.dateAdded = dateAdded;
	}
	public Timestamp getDateUpdated() {
		return dateUpdated;
	}
	public void setDateUpdated(Timestamp dateUpdated) {
		this.dateUpdated = dateUpdated;
	}
	@Override
	public String toString() {
		return "ClinicContact [id=" + id + ", info=" + info + ", type=" + type + ", dateAdded=" + dateAdded
				+ ", dateUpdated=" + dateUpdated + "]";
	}
}
