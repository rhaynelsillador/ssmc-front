package net.cms.ssmc.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;

import net.cms.ssmc.dao.ContactInformationDao;
import net.cms.ssmc.model.ContactInformation;
import net.ssmc.enums.Status;
import net.ssmc.model.Helper;

public class ContactInformationServices {

	@Autowired
	private ObjectMapper objectMapper;
	@Autowired
	private ContactInformationDao contactInformationDao;
	
	public ObjectNode updateContactInformation(List<ContactInformation> contactInformations){
		ArrayNode arrayNode = objectMapper.createArrayNode();
		ObjectNode node = objectMapper.createObjectNode();
		for (ContactInformation contactInformation : contactInformations) {
			if(contactInformation.getValue().isEmpty()){
				 arrayNode.add(contactInformation.getName());
			}	
		}
		if(arrayNode.size() > 0){
			node.put(Helper.STATUS, Status.ERROR.toString());
			node.put(Helper.MESSAGE, "The following field/s is/are required "+arrayNode.toString());
		}else{
			
			try {
				contactInformationDao.create(contactInformations);
				node.put(Helper.STATUS, Status.SUCCESS.toString());
				node.put(Helper.MESSAGE, "Contact Information Successfully updated.");
			} catch (Exception e) {
				e.printStackTrace();
				node.put(Helper.STATUS, Status.ERROR.toString());
				node.put(Helper.MESSAGE, "Contact Information unsuccessfully updated.");
			}
		}		
		return node;
	}
	
	public List<ContactInformation> getAllContactInformation(){
		return contactInformationDao.findAll();
	}
}
