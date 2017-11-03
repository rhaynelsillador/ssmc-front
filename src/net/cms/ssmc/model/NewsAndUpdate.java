package net.cms.ssmc.model;

import java.sql.Timestamp;
import java.util.List;

import net.ssmc.model.Image;

public class NewsAndUpdate {
	
	private long id;
	private String title;
	private Timestamp date;
	private String news;
	private int status;
	private List<NewsAndUpdatesImage> images;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public String getNews() {
		return news;
	}
	public void setNews(String news) {
		this.news = news;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public List<NewsAndUpdatesImage> getImages() {
		return images;
	}
	public void setImages(List<NewsAndUpdatesImage> images) {
		this.images = images;
	}
	@Override
	public String toString() {
		return "NewsAndUpdate [id=" + id + ", title=" + title + ", date=" + date + ", news=" + news + ", status="
				+ status + ", images=" + images + "]";
	}
	
}
