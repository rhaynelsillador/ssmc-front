package net.ssmc.services;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import net.cms.ssmc.model.Header;
import net.cms.ssmc.services.HeaderServices;
import net.ssmc.dao.ClinicDao;
import net.ssmc.model.Clinic;

public class ClinicServices {
	
	@Autowired
	private ClinicDao clinicDao;
	@Autowired
	private HeaderServices headerServices;
	
	public Header getClinicHeader(){
		return headerServices.getClinicHeader();
	}
	
	public Map<String, List<Clinic>> getClinicsAndHospitals(){
		List<Clinic> clinicList = clinicDao.retrieveAll();
		Map<String, List<Clinic>> clinics = new HashMap<>();
		for (Clinic clinic : clinicList) {
			List<Clinic> tmp = clinics.get(clinic.getCity().getName());
			if(tmp == null){
				tmp = new ArrayList<>();
				tmp.add(clinic);
				clinics.put(clinic.getCity().getName(), tmp);
			}else{
				tmp.add(clinic);
				clinics.put(clinic.getCity().getName(), tmp);
			}
		}
		return clinics;
	}
}
