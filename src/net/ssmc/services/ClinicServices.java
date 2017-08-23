package net.ssmc.services;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import net.ssmc.dao.ClinicContactDao;
import net.ssmc.dao.ClinicDao;
import net.ssmc.enums.City;
import net.ssmc.enums.Status;
import net.ssmc.enums.TransactionType;
import net.ssmc.exception.EmptyStringException;
import net.ssmc.model.Clinic;
import net.ssmc.model.Helper;

public class ClinicServices {
	
	@Autowired
	private ClinicDao clinicDao;
	@Autowired
	private ClinicContactDao clinicContactDao;
	
	public Map<String, Object> retrieveClinics(HttpSession session, Map<String, String> request){
		Map<String, Object> data = new HashMap<>();
		List<Clinic> clinics = clinicDao.retrieveAll(request);
		data.put("rows", clinics);
		data.put("current", request.get("current"));
		data.put("rowCount", request.get("rowCount"));
		data.put("total", clinicDao.count());
		return data;
	}

	public Map<String, Object> createClinic(HttpSession session, Map<String, String> request){
		Map<String, Object> data = new HashMap<>();
		data.put(Helper.STATUS, Status.ERROR);
		Clinic clinic = new Clinic();
		try {
			clinic.setName(request.get("name"));
		} catch (EmptyStringException e1) {
			data.put(Helper.MESSAGE, e1.getMessage());
			return data;
		}
		try {
			clinic.setDescription(request.get("description"));
		} catch (EmptyStringException e1) {
			data.put(Helper.MESSAGE, e1.getMessage());
			return data;
		}
		clinic.setDateUpdated(new Timestamp(System.currentTimeMillis()));
		clinic.setDateAdded(new Timestamp(System.currentTimeMillis()));
		clinic.setLogo(request.get("logo"));
		clinic.setAddress1(request.get("address1"));
		clinic.setAddress2(request.get("address2"));
		clinic.setType(request.get("type"));
		try {
			clinic.setCity(City.valueOf(request.get("city")));
		} catch (Exception e) {
		}
		clinic.setMap(request.get("map"));
		
		if(session.getAttribute("TRANSACTION") == TransactionType.UPDATE){
			try {
				clinic.setId(Integer.parseInt(session.getAttribute("clinicId").toString()));
				clinicDao.update(clinic);
				data.put(Helper.STATUS, Status.SUCCESS);
				data.put(Helper.MESSAGE, "Successfully updated clinic information.");
			} catch (Exception e) {
				data.put(Helper.STATUS, Status.ERROR);
				data.put(Helper.MESSAGE, "Unsuccessfully updated clinic information.");
			}
		}else if(TransactionType.valueOf(request.get("transType")) == TransactionType.UPDATE){
			try {
				clinicDao.create(clinic);
				data.put(Helper.STATUS, Status.SUCCESS);
				data.put(Helper.MESSAGE, "Successfully added clinic information.");
			} catch (Exception e) {
				data.put(Helper.STATUS, Status.ERROR);
				data.put(Helper.MESSAGE, "Unsuccessfully added clinic information.");
			}
		}
		
		
		
		return data;
	}
	
	public Clinic getClinic(HttpSession session, long id){
		Clinic clinic = clinicDao.retrieve(id);
		clinic.setClinicContacts(clinicContactDao.retrieveByClinic(id));
		return clinic;
	}
}
