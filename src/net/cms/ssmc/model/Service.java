package net.cms.ssmc.model;

import java.sql.Timestamp;
import java.util.List;

import net.ssmc.enums.App;
import net.ssmc.model.Image;

public class Service {

	private int id;
	private String name;
	private String title;
	private String content;
	private boolean status;
	private App type;
	private Timestamp dateAdded;
	private Timestamp dateUpdated;
	private List<Image> images;
	
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
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public App getType() {
		return type;
	}
	public void setType(App type) {
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public List<Image> getImages() {
		return images;
	}
	public void setImages(List<Image> images) {
		this.images = images;
	}
	@Override
	public String toString() {
		return "Service [id=" + id + ", name=" + name + ", title=" + title + ", content=" + content + ", status="
				+ status + ", type=" + type + ", dateAdded=" + dateAdded + ", dateUpdated=" + dateUpdated + ", images="
				+ images + "]";
	}	
	
}
