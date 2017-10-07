package net.ssmc.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.node.ObjectNode;

import net.ssmc.model.RegisteredAccount;
import net.ssmc.services.RegistrationServices;

@RestController
public class SsmcRestApiController {
	
	@Autowired
	private RegistrationServices registrationServices;
	@Autowired
	private HttpServletRequest httpServletRequest;
	
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
	
}
