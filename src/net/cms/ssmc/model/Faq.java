package net.cms.ssmc.model;

import java.sql.Timestamp;
import java.util.Date;

import net.ssmc.enums.App;

public class Faq {

	private int id;
	private String title;
	private String question;
	private String answer;
	private Timestamp dateAdded;
	private Timestamp dateUpdated;
	private App type;
	
	private boolean status;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public Timestamp getDateAdded() {
		return dateAdded;
	}
	public void setDateAdded(Timestamp dateAdded) {
		this.dateAdded = dateAdded;
	}
	public Timestamp getDateUpdated() {
		return dateUpdated;
	}
	public void setDateUpdated(Timestamp dateUpdated) {
		this.dateUpdated = dateUpdated;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public App getType() {
		return type;
	}
	public void setType(App type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "Faq [id=" + id + ", title=" + title + ", question=" + question + ", answer=" + answer + ", dateAdded="
				+ dateAdded + ", dateUpdated=" + dateUpdated + ", type=" + type + ", status=" + status + "]";
	}

}
