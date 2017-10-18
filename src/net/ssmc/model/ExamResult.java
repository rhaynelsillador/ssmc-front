package net.ssmc.model;

import java.sql.Timestamp;

import net.ssmc.enums.ExaminStatus;

public class ExamResult {

	private long id;
	private String name;
	private String description;
	private Timestamp dateExamined;
	private Timestamp dateEncoded;
	private long encodedBy;
	private long accountId;
	private ExaminStatus status;
	private String result;
	private int resultCount;
	
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Timestamp getDateExamined() {
		return dateExamined;
	}
	public void setDateExamined(Timestamp dateExamined) {
		this.dateExamined = dateExamined;
	}
	public Timestamp getDateEncoded() {
		return dateEncoded;
	}
	public void setDateEncoded(Timestamp dateEncoded) {
		this.dateEncoded = dateEncoded;
	}
	public long getEncodedBy() {
		return encodedBy;
	}
	public void setEncodedBy(long encodedBy) {
		this.encodedBy = encodedBy;
	}
	public long getAccountId() {
		return accountId;
	}
	public void setAccountId(long accountId) {
		this.accountId = accountId;
	}
	public ExaminStatus getStatus() {
		return status;
	}
	public void setStatus(ExaminStatus status) {
		this.status = status;
	}
	
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public int getResultCount() {
		return resultCount;
	}
	public void setResultCount(int resultCount) {
		this.resultCount = resultCount;
	}
	
	@Override
	public String toString() {
		return "ExamResult [id=" + id + ", name=" + name + ", description=" + description + ", dateExamined="
				+ dateExamined + ", dateEncoded=" + dateEncoded + ", encodedBy=" + encodedBy + ", accountId="
				+ accountId + ", status=" + status + ", result=" + result + ", resultCount=" + resultCount + "]";
	}
}