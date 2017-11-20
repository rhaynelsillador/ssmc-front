package net.cms.ssmc.model;

import java.util.List;

public class Directory {

	private long id;
	private String name;
	private boolean status;
	private List<Doctor> doctors;
	
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
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public List<Doctor> getDoctors() {
		return doctors;
	}
	public void setDoctors(List<Doctor> doctors) {
		this.doctors = doctors;
	}
	@Override
	public String toString() {
		return "Directory [id=" + id + ", name=" + name + ", status=" + status + ", doctors=" + doctors + "]";
	}
}
