package net.cms.ssmc.model;

import java.sql.Timestamp;
import java.util.List;

import net.ssmc.enums.Page;
import net.ssmc.model.Image;

public class FeaturedBox {
	
	private long id;
	private String name;
	private String description;
	private int box;
	private Timestamp timestamp;
	private Page page;
	private List<Image> images;
	
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getBox() {
		return box;
	}
	public void setBox(int box) {
		this.box = box;
	}
	public Timestamp getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(Timestamp timestamp) {
		this.timestamp = timestamp;
	}
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	public List<Image> getImages() {
		return images;
	}
	public void setImages(List<Image> images) {
		this.images = images;
	}
	@Override
	public String toString() {
		return "FeaturedBox [id=" + id + ", name=" + name + ", description=" + description + ", box=" + box
				+ ", timestamp=" + timestamp + ", page=" + page + ", images=" + images + "]";
	}
}
