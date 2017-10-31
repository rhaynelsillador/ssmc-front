package net.ssmc.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.node.ObjectNode;

import net.cms.ssmc.model.ContactInformation;
import net.cms.ssmc.model.Partner;
import net.cms.ssmc.services.ContactInformationServices;
import net.cms.ssmc.services.ImageServices;
import net.cms.ssmc.services.PartnerServices;
import net.ssmc.model.ExamResult;
import net.ssmc.model.Image;
import net.ssmc.model.RegisteredAccount;
import net.ssmc.services.ExamResultServices;
import net.ssmc.services.RegistrationServices;

@RestController
public class SsmcRestApiController {
	
	@Autowired
	private RegistrationServices registrationServices;
	@Autowired
	private HttpServletRequest httpServletRequest;
	@Autowired
	private ContactInformationServices contactInformationServices;
	@Autowired
	private ExamResultServices examResultServices;
	@Autowired
	private PartnerServices partnerServices;
	
	@RequestMapping(path="/AccountLogin", method = RequestMethod.POST, produces={"application/json"})
	public ObjectNode accountLogin(@RequestBody RegisteredAccount registeredAccount){
		return registrationServices.accountLogin(registeredAccount);
	}
	
	@RequestMapping(path="/AccountLogout", method = {RequestMethod.POST, RequestMethod.GET}, produces={"application/json"})
	public String accountLogout(){
		httpServletRequest.getSession().invalidate();
		return "{\"ACTION\" : \"LOGOUT\"}";
	}
	
	@RequestMapping(path="/RegistrationSave", method = RequestMethod.POST, produces={"application/json"})
	public ObjectNode registrationSave(@RequestBody RegisteredAccount registeredAccount){
		return registrationServices.registerAccount(registeredAccount);
	}
	
	@RequestMapping(path="/LoginAccountInformation", method = RequestMethod.POST, produces={"application/json"})
	public RegisteredAccount loginAccountInformation(){
		RegisteredAccount registeredAccount = (RegisteredAccount) httpServletRequest.getSession().getAttribute("accountLoggedIn");
		if(registeredAccount != null){
			return registrationServices.getRegistreredAccountByEmail(registeredAccount.getEmail());
		}
		return registeredAccount;
	}
	
	@RequestMapping(path="/AccountInformationUpdate", method = RequestMethod.POST, produces={"application/json"})
	public ObjectNode accountInformationUpdate(@RequestBody RegisteredAccount registeredAccount){
		System.out.println(registeredAccount);
		return registrationServices.updateAccountInformation(registeredAccount);
	}
	
	@RequestMapping(path="/ContactInformationList", method = {RequestMethod.POST, RequestMethod.GET}, produces={"application/json"})
	public List<ContactInformation> contactInformationList(){
		return contactInformationServices.getAllContactInformation();
	}
	
	@RequestMapping(path="/AccountExamResult", method = {RequestMethod.POST, RequestMethod.GET}, produces={"application/json"})
	public Map<String, List<ExamResult>> accountExamResult(){
		return examResultServices.getAccountExamResult();
	}
	
	
	@RequestMapping(path="/PartnerList", method = {RequestMethod.POST, RequestMethod.GET}, produces={"application/json"})
	public List<Partner> getPartners(){
		return partnerServices.getPartners();
	}
	
	
}
