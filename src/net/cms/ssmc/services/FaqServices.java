package net.cms.ssmc.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestParam;

import net.cms.ssmc.dao.FaqDao;
import net.cms.ssmc.model.Faq;
import net.ssmc.enums.Status;
import net.ssmc.enums.TransactionType;
import net.ssmc.model.Helper;

public class FaqServices {

	@Autowired
	private FaqDao faqDao;
	
	public Map<String, Object> createUpdateFaq(HttpSession session, Faq faq){
		TransactionType transactionType = (TransactionType) session.getAttribute("TRANSACTION");
		Map<String, Object> response = new HashMap<>();
		response.put(Helper.STATUS, Status.ERROR);
		
		if(faq.getQuestion() == null || faq.getQuestion().isEmpty()){
			response.put(Helper.MESSAGE, "Faq question is required!");
			return response;
		}else if(faq.getAnswer() == null || faq.getAnswer().isEmpty()){
			response.put(Helper.MESSAGE, "Faq answer is required!");
			return response;
		}
		
		
		System.out.println("transactionType "+transactionType);
		
		if(transactionType == TransactionType.UPDATE){
			faq.setId(Integer.parseInt(session.getAttribute("FAQID").toString()));
			try {
				faqDao.update(faq);
				response.put(Helper.STATUS, Status.SUCCESS);
				response.put(Helper.MESSAGE, "Faq successfully updated!");
			} catch (Exception e) {
				response.put(Helper.STATUS, Status.ERROR);
				response.put(Helper.MESSAGE, "Faq unsuccessfully updated!");
			}
		}else if(transactionType == TransactionType.ADD){
			try {
				faqDao.create(faq);
				response.put(Helper.STATUS, Status.SUCCESS);
				response.put(Helper.MESSAGE, "Faq successfully added!");
			} catch (Exception e) {
				response.put(Helper.STATUS, Status.ERROR);
				response.put(Helper.MESSAGE, "Faq unsuccessfully updated!");
			}
		}
		
		return response;
	}
	
	public Map<String, Object> retrieveAllFaq(HttpSession session, @RequestParam Map<String, String> request){
		Map<String, Object> data = new HashMap<>();
		List<Faq> faqList = faqDao.retrieveAll(request);
		data.put("rows", faqList);
		data.put("current", request.get("current"));
		data.put("rowCount", request.get("rowCount"));
		data.put("total", faqDao.count());
		return data;
	}

	public Object getFaq(int id) {
		return faqDao.retrieve(id);
	}

	public Map<String, Object> changeStatusFaq(HttpSession session, Faq faq) {
		Map<String, Object> response = new HashMap<>();
		try {
			faqDao.updateStatus(faq);
			response.put(Helper.MESSAGE, "Faq status successfully " + (faq.isStatus() ? "disabled.":"enabled."));
			response.put(Helper.STATUS, Status.SUCCESS);
		} catch (Exception e) {
			response.put(Helper.MESSAGE, "Faq status unsuccessfully " + (faq.isStatus() ? "disabled.":"enabled."));
			response.put(Helper.STATUS, Status.SUCCESS);
		}
		return response;
	}

	public Map<String, Object> deleteFaq(HttpSession session, Faq faq) {
		Map<String, Object> response = new HashMap<>();
		try {
			faqDao.delete(faq.getId());
			response.put(Helper.MESSAGE, "Faq status successfully deleted");
			response.put(Helper.STATUS, Status.SUCCESS);
		} catch (Exception e) {
			response.put(Helper.MESSAGE, "Faq status unsuccessfully deleted");
			response.put(Helper.STATUS, Status.SUCCESS);
		}
		return response;
	}
}
