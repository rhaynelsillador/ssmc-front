package net.cms.ssmc.model;

import java.sql.Timestamp;

import net.ssmc.enums.App;

public class AboutUs {

	private int id;
	private String name;
	private String content;
	private Timestamp dateAdded;
	private Timestamp dateUpdated;
	private App type;
	private int sorter;
	private String image;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getDateAdded() {
		return dateAdded;
	}
	public void setDateAdded(Timestamp dateAdded) {
		this.dateAdded = dateAdded;
	}
	public Timestamp getDareUpdated() {
		return dateUpdated;
	}
	public void setDateUpdated(Timestamp dateUpdated) {
		this.dateUpdated = dateUpdated;
	}
	public App getType() {
		return type;
	}
	public void setType(App type) {
		this.type = type;
	}
	public Timestamp getDateUpdated() {
		return dateUpdated;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getSorter() {
		return sorter;
	}
	public void setSorter(int sorter) {
		this.sorter = sorter;
	}
	@Override
	public String toString() {
		return "AboutUs [id=" + id + ", name=" + name + ", content=" + content + ", dateAdded=" + dateAdded
				+ ", dateUpdated=" + dateUpdated + ", type=" + type + ", image=" + image + "]";
	}
	
}
