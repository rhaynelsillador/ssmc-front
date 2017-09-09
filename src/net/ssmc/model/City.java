package net.ssmc.model;

public class City {

	private long id;
	private String cityKey;
	private String name;
	
	public City() {
		// TODO Auto-generated constructor stub
	}
	
	public City(String name, String key) {
		this.name=name;
		this.cityKey=key;
	}
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getCityKey() {
		return cityKey;
	}
	public void setCityKey(String cityKey) {
		this.cityKey = cityKey;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "City [id=" + id + ", cityKey=" + cityKey + ", name=" + name + "]";
	}
	
	
}
