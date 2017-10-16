package net.ssmc.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

import net.ssmc.enums.Gender;

public class RegisteredAccount implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private long id;
	private String email;
	private String password;
	private String password1;
	private String firstName;
	private String lastName;
	private String middleName;
	private long number;
	private boolean status;
	private Timestamp dateCreated;
	private Timestamp dateLastLogin;
	private String birthday;
	private Gender gender;
	private String address;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getMiddleName() {
		return middleName;
	}
	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}
	
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	
	public Timestamp getDateCreated() {
		return dateCreated;
	}
	public void setDateCreated(Timestamp dateCreated) {
		this.dateCreated = dateCreated;
	}
	public Timestamp getDateLastLogin() {
		return dateLastLogin;
	}
	public void setDateLastLogin(Timestamp dateLastLogin) {
		this.dateLastLogin = dateLastLogin;
	}
	public long getNumber() {
		return number;
	}
	public void setNumber(long number) {
		this.number = number;
	}
	public String getPassword1() {
		return password1;
	}
	public void setPassword1(String password1) {
		this.password1 = password1;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	
	public Gender getGender() {
		return gender;
	}
	public void setGender(Gender gender) {
		this.gender = gender;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "RegisteredAccount [id=" + id + ", email=" + email + ", password=" + password + ", password1="
				+ password1 + ", firstName=" + firstName + ", lastName=" + lastName + ", middleName=" + middleName
				+ ", number=" + number + ", status=" + status + ", dateCreated=" + dateCreated + ", dateLastLogin="
				+ dateLastLogin + ", birthday=" + birthday + ", gender=" + gender + ", address=" + address + "]";
	}
}
