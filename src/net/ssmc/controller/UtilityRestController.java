package net.ssmc.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import net.ssmc.model.Email;
import net.ssmc.services.ContactUsServices;
import net.ssmc.utils.GmailUtility;

@RestController
public class UtilityRestController {

	@Autowired
	private ContactUsServices contactUsServices;
	
	@RequestMapping(path="/sendEmail", method = {RequestMethod.POST, RequestMethod.GET}, produces="application/json")
	public @ResponseBody Map<String, Object> sendEmail(@RequestBody Email email) {
		System.out.println(email);
		return contactUsServices.saveEmail(email);
	}
	
	
}
