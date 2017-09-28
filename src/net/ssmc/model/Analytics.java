package net.ssmc.model;

import java.sql.Timestamp;

public class Analytics {

	private int id;
	private String country;
	private String ip;
	private Timestamp date;
	private String url;
	private String city;
	private double latitude;
	private double longhitude;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLonghitude() {
		return longhitude;
	}
	public void setLonghitude(double longhitude) {
		this.longhitude = longhitude;
	}
	@Override
	public String toString() {
		return "Analytics [id=" + id + ", country=" + country + ", ip=" + ip + ", date=" + date + ", url=" + url
				+ ", city=" + city + ", latitude=" + latitude + ", longhitude=" + longhitude + "]";
	}
		
}
