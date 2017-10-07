package net.ssmc.services;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

import net.ssmc.dao.RegisteredAccountDao;
import net.ssmc.enums.Code;
import net.ssmc.enums.MessageKey;
import net.ssmc.enums.Status;
import net.ssmc.model.RegisteredAccount;
import net.ssmc.utils.AES;
import net.ssmc.utils.AppUtils;

public class RegistrationServices {

	@Autowired
	private ObjectMapper objectMapper;
	@Autowired
	private AppUtils appUtils;
	@Autowired
	private RegisteredAccountDao registeredAccountDao;
	@Autowired
	private HttpServletRequest httpServletRequest;
	
	private static final String REGISTRATIONSUCCESS = "You have successfully registered your account!";
	private static final String REGISTRATIONERROR  	= "You have unsuccessfully registered your account!";
	private static final String EMAILEXIST  		= "Email already registered.";
	private static final String INVALIDUSERPASS		= "Invalid username and password!";
	
	public ObjectNode accountLogin(RegisteredAccount registeredAccount){
		ObjectNode node = objectMapper.createObjectNode();
		
		node.put(MessageKey.STATUS.getName(), Status.ERROR.toString());
		if(registeredAccount.getEmail().isEmpty() || !AppUtils.isValidEmailAddress(registeredAccount.getEmail())){
			node.put(MessageKey.MESSAGE.getName(), Code.INVALIDEMAIL.getName());
			node.put(MessageKey.CODE.getName(), Code.INVALIDEMAIL.getCode());
		}
		try {
			registeredAccount = registeredAccountDao.findOne(registeredAccount.getEmail(), AES.encrypt(registeredAccount.getPassword()));
			httpServletRequest.getSession().setAttribute("accountLoggedIn", registeredAccount);
			node.put(MessageKey.STATUS.getName(), Status.SUCCESS.toString());
		} catch (Exception e) {
			e.printStackTrace();
			node.put(MessageKey.MESSAGE.getName(), INVALIDUSERPASS);
			node.put(MessageKey.CODE.getName(), Code.ERROR.getCode());
		}
		return node;
	}
	
	private RegisteredAccount getRegistreredAccountByEmail(String email){
		try {
			return registeredAccountDao.findOne(email);
		} catch (Exception e) {
			return null;
		}
	}
	
	public ObjectNode registerAccount(RegisteredAccount registeredAccount){
		ObjectNode node = objectMapper.createObjectNode();
		node.put(MessageKey.STATUS.getName(), Status.ERROR.toString());
		if(registeredAccount.getEmail().isEmpty() || !AppUtils.isValidEmailAddress(registeredAccount.getEmail())){
			node.put(MessageKey.MESSAGE.getName(), Code.INVALIDEMAIL.getName());
			node.put(MessageKey.CODE.getName(), Code.INVALIDEMAIL.getCode());
		}else if(getRegistreredAccountByEmail(registeredAccount.getEmail()) != null){
			node.put(MessageKey.MESSAGE.getName(), EMAILEXIST);
			node.put(MessageKey.CODE.getName(), Code.INVALIDEMAIL.getCode());
		}else if(registeredAccount.getNumber() == 0){
			node.put(MessageKey.MESSAGE.getName(), Code.INVALIDNUMBER.getName());
			node.put(MessageKey.CODE.getName(), Code.INVALIDNUMBER.getCode());
		}else if(appUtils.passwordValidations(registeredAccount.getPassword()) != null){
			node = appUtils.passwordValidations(registeredAccount.getPassword());
		}else if(appUtils.passwordConfirmValidations(registeredAccount.getPassword(), registeredAccount.getPassword1()) != null){
			node = appUtils.passwordConfirmValidations(registeredAccount.getPassword(), registeredAccount.getPassword1());
		}else{
			try {
				registeredAccountDao.create(registeredAccount);
				node.put(MessageKey.STATUS.getName(), Status.SUCCESS.toString());
				node.put(MessageKey.MESSAGE.getName(), REGISTRATIONSUCCESS);
				node.put(MessageKey.CODE.getName(), Code.SUCCESS.getCode());
			} catch (Exception e) {
				e.printStackTrace();
				node.put(MessageKey.MESSAGE.getName(), REGISTRATIONERROR);
				node.put(MessageKey.CODE.getName(), Code.ERROR.getCode());
			}
		}		
		return node;
	}
	
	
	
}
