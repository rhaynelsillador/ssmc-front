package net.cms.ssmc.model;

public class Partner {
	
	private long id;
	private String name;
	private String url;
	private String logo;
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
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	@Override
	public String toString() {
		return "Partners [id=" + id + ", name=" + name + ", url=" + url + ", logo=" + logo + "]";
	}
	
}
