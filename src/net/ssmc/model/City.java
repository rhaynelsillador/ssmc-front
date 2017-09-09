package net.ssmc.model;

public class City {

	private long id;
	private String name;
	private String citykey;
	
	public City() {
	}
	
	public City(long id) {
		this.id=id;
	}
	
	public City(long id, String name, String citykey) {
		this.id=id;
		this.name = name;
		this.citykey = citykey;
	}
	
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
	
	public String getCitykey() {
		return citykey;
	}
	public void setCitykey(String citykey) {
		this.citykey = citykey;
	}
	@Override
	public String toString() {
		return "City [id=" + id + ", name=" + name + ", citykey=" + citykey + "]";
	}
}
