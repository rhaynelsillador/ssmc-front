package net.cms.ssmc.model;

public class Doctor {
	
	private long id;
	private String name;
	private String day;
	private String time;
	private String other;
	private String branch;
	private long directoryId;
	private String directory;
	
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
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getOther() {
		return other;
	}
	public void setOther(String other) {
		this.other = other;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	
	public long getDirectoryId() {
		return directoryId;
	}
	public void setDirectoryId(long directoryId) {
		this.directoryId = directoryId;
	}
	public String getDirectory() {
		return directory;
	}
	public void setDirectory(String directory) {
		this.directory = directory;
	}
	@Override
	public String toString() {
		return "Doctor [id=" + id + ", name=" + name + ", day=" + day + ", time=" + time + ", other=" + other
				+ ", branch=" + branch + ", directoryId=" + directoryId + ", directory=" + directory + "]";
	}
	
}
