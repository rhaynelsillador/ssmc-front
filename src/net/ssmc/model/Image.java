package net.ssmc.model;

import net.ssmc.enums.App;

public class Image {

	private int id;
	private String image;
	private boolean status;
	private App type; 
	private int serviceId;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public int getServiceId() {
		return serviceId;
	}
	public void setServiceId(int serviceId) {
		this.serviceId = serviceId;
	}
	public App getType() {
		return type;
	}
	public void setType(App type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "Image [id=" + id + ", image=" + image + ", status=" + status + ", type=" + type + ", serviceId="
				+ serviceId + "]";
	}
	
}
