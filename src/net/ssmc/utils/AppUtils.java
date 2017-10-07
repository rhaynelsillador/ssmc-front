package net.ssmc.utils;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;

import org.springframework.beans.factory.annotation.Autowired;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

import net.ssmc.enums.Code;
import net.ssmc.enums.MessageKey;
import net.ssmc.enums.Status;

public class AppUtils {

	@Autowired
	private ObjectMapper objectMapper;
	
	private final static String PASSWORDLENGTHMESSAGE = "Password must be be 6 to 12 characters.";
	
	public static boolean isValidEmailAddress(String email) {
	   boolean result = true;
	   try {
	      InternetAddress emailAddr = new InternetAddress(email);
	      emailAddr.validate();
	   } catch (AddressException ex) {
	      result = false;
	   }
	   return result;
	}
	
	public ObjectNode passwordValidations(String password){
		ObjectNode node = objectMapper.createObjectNode();
		if(password == null || password.isEmpty()){
			node.put(MessageKey.STATUS.getName(), Status.ERROR.toString());
			node.put(MessageKey.MESSAGE.getName(), Code.INVALIDPASSWORD.getName());
			node.put(MessageKey.CODE.getName(), Code.INVALIDPASSWORD.getCode());
		}else if(password.length() < 6 || password.length() > 12){
			node.put(MessageKey.STATUS.getName(), Status.ERROR.toString());
			node.put(MessageKey.MESSAGE.getName(), PASSWORDLENGTHMESSAGE);
			node.put(MessageKey.CODE.getName(), Code.INVALIDPASSWORD.getCode());
		}else{
			return null;
		}
		return node;
	}
	
	public ObjectNode passwordConfirmValidations(String password1, String password2){
		ObjectNode node = objectMapper.createObjectNode();
		if(!password1.equalsIgnoreCase(password2)){
			node.put(MessageKey.STATUS.getName(), Status.ERROR.toString());
			node.put(MessageKey.MESSAGE.getName(), Code.PASSWORDNOTSAME.getName());
			node.put(MessageKey.CODE.getName(), Code.PASSWORDNOTSAME.getCode());
		}else{
			return null;
		}
		return node;
	}
}
