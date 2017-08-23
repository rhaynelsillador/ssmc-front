package net.ssmc.model.form;

import net.ssmc.model.ContactUs;

public class ContactUsForm extends ContactUs{

	private String []sort;
	private String searchPhrase;
	
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
}
