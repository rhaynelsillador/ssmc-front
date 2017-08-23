package net.ssmc.model;

import java.util.Arrays;
import java.util.Map;

public class Params {
	
	private String id;
	private int current;
	private int rowCount;
	private String [] sort;
	private String searchPhrase;
	private Map<String, String> userParams;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getCurrent() {
		return current;
	}
	public void setCurrent(int current) {
		this.current = current;
	}
	public int getRowCount() {
		return rowCount;
	}
	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}
	public String[] getSort() {
		return sort;
	}
	public void setSort(String[] sort) {
		this.sort = sort;
	}
	public String getSearchPhrase() {
		return searchPhrase;
	}
	public void setSearchPhrase(String searchPhrase) {
		this.searchPhrase = searchPhrase;
	}
	public Map<String, String> getUserParams() {
		return userParams;
	}
	public void setUserParams(Map<String, String> userParams) {
		this.userParams = userParams;
	}
	@Override
	public String toString() {
		return "Params [id=" + id + ", current=" + current + ", rowCount=" + rowCount + ", sort="
				+ Arrays.toString(sort) + ", searchPhrase=" + searchPhrase + ", userParams=" + userParams + "]";
	}
	
	
	
}
