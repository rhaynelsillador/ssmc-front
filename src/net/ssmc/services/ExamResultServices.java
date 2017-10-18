package net.ssmc.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

import net.ssmc.dao.ExamResultDao;
import net.ssmc.enums.Status;
import net.ssmc.model.ExamResult;
import net.ssmc.model.Helper;
import net.ssmc.model.RegisteredAccount;

public class ExamResultServices {

	@Autowired
	private ObjectMapper objectMapper;
	@Autowired
	private ExamResultDao examResultDao;
	@Autowired
	private HttpServletRequest httpServletRequest;
	
	public Map<String, List<ExamResult>> getAccountExamResult(){
		RegisteredAccount account = (RegisteredAccount) httpServletRequest.getSession().getAttribute("accountLoggedIn");
		System.out.println(""+"sss "+account);
		Map<String , List<ExamResult>> data = new HashMap<>();
		data.put("data", examResultDao.findByAccount(account.getId()));
		return data;
	}
	
	public ObjectNode deleteTestResult(long id){
		examResultDao.delete(id);
		ObjectNode node = objectMapper.createObjectNode();
		node.put(Helper.STATUS, Status.SUCCESS.toString());
		node.put(Helper.MESSAGE, "Test result successfully deleted!");
		return node;
	}
	
}
