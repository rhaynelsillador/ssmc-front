package net.cms.ssmc.model;

import java.sql.Timestamp;

public class Faq {

	private int id;
	private String question;
	private String answer;
	private Timestamp dateAdded;
	private Timestamp dateUpdated;
	
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
	@Override
	public String toString() {
		return "Faq [id=" + id + ", question=" + question + ", answer=" + answer + ", dateAdded=" + dateAdded
				+ ", dateUpdated=" + dateUpdated + ", status=" + status + "]";
	}
	
}
