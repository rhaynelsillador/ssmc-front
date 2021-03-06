package net.ssmc.services;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import net.ssmc.dao.ContactUsDao;
import net.ssmc.enums.Status;
import net.ssmc.model.ContactUs;
import net.ssmc.model.Email;
import net.ssmc.model.Helper;
import net.ssmc.model.RegisteredAccount;
import net.ssmc.utils.GmailUtility;

public class ContactUsServices {
	
	@Autowired
	private ContactUsDao contactUsDao;
	@Autowired
	private GmailUtility gmailUtility;
	@Autowired
	private HttpServletRequest httpServletRequest;
	
	public Map<String, Object> saveEmail(Email email){
		Map<String, Object> response = new HashMap<>();
		response.put(Helper.STATUS, Status.ERROR);
		if(email.getFullName() == null || email.getFullName().trim().isEmpty()){
			response.put(Helper.MESSAGE, "Full Name is required!");
		}else if(email.getEmail() == null || email.getEmail().trim().isEmpty()){
			response.put(Helper.MESSAGE, "Email is required!");
		}else if(email.getPhone() == null || email.getPhone().trim().isEmpty()){
			response.put(Helper.MESSAGE, "Phone is required!");
		}else if(email.getMessage() == null || email.getMessage().trim().isEmpty()){
			response.put(Helper.MESSAGE, "Message is required!");
		}else{			
			RegisteredAccount registeredAccount = (RegisteredAccount) httpServletRequest.getSession().getAttribute("accountLoggedIn");
			
			ContactUs contactUs = new ContactUs();
			contactUs.setEmail(email.getEmail());
			contactUs.setMessage(email.getMessage());
			contactUs.setSubject("Inquiry");
			contactUs.setDateAdded(new Timestamp(System.currentTimeMillis()));
			contactUs.setName(email.getFullName());
			
			if(registeredAccount != null){
				contactUs.setUserId(registeredAccount.getId());
			}
			
			gmailUtility.sendEmail(email);
			contactUsDao.create(contactUs);
			response.put(Helper.STATUS, Status.SUCCESS);
			response.put(Helper.MESSAGE, "Email sent!");
		}
		
		return response;
		
		
	}
}
