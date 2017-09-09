package net.ssmc.model;

import java.sql.Timestamp;
import java.util.List;

import net.ssmc.exception.EmptyStringException;

public class Clinic {

	private int id;
	private String name;
	private Timestamp dateUpdated;
	private Timestamp dateAdded;
	private String description;
	private String logo;
	private String address1;
	private String address2;
	private City city;
	private String mobile;
	private String phone;
	private String email;
	private String map;
	private String type;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) throws EmptyStringException{
		if(name == null || name.isEmpty()){
			throw new EmptyStringException("Clinic name is required.");
		}
		this.name = name;
	}
	public Timestamp getDateUpdated() {
		return dateUpdated;
	}
	public void setDateUpdated(Timestamp dateUpdated) {
		this.dateUpdated = dateUpdated;
	}
	public Timestamp getDateAdded() {
		return dateAdded;
	}
	public void setDateAdded(Timestamp dateAdded) {
		this.dateAdded = dateAdded;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description)  throws EmptyStringException{
		if(description == null || description.isEmpty()){
			throw new EmptyStringException("Clinic description is required.");
		}
		this.description = description;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public City getCity() {
		return city;
	}
	public void setCity(City city) {
		this.city = city;
	}
	public String getMap() {
		return map;
	}
	public void setMap(String map) {
		this.map = map;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "Clinic [id=" + id + ", name=" + name + ", dateUpdated=" + dateUpdated + ", dateAdded=" + dateAdded
				+ ", description=" + description + ", logo=" + logo + ", address1=" + address1 + ", address2="
				+ address2 + ", city=" + city + ", mobile=" + mobile + ", phone=" + phone + ", email=" + email
				+ ", map=" + map + ", type=" + type + "]";
	}
	
	
	
}
