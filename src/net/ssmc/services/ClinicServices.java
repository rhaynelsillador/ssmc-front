package net.ssmc.services;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import net.cms.ssmc.model.Header;
import net.cms.ssmc.services.HeaderServices;
import net.ssmc.dao.ClinicDao;
import net.ssmc.enums.Page;
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
		List<Clinic> clinicList = clinicDao.retrieveAll(Page.HospitalAndClinic);
		Map<String, List<Clinic>> clinics = new HashMap<>();
		clinics.put("data", clinicList);
		return clinics;
	}
	
	public Map<String, List<Clinic>> getClinicsAndHospitalList(){
		List<Clinic> clinicList = clinicDao.retrieveAll(Page.Branches);
		Map<String, List<Clinic>> clinics = new HashMap<>();
		clinics.put("data", clinicList);
		return clinics;
	}

	public Map<String, List<Clinic>> getHMOList() {
		List<Clinic> clinicList = clinicDao.retrieveAll(Page.HMO);
		Map<String, List<Clinic>> clinics = new HashMap<>();
		clinics.put("data", clinicList);
		return clinics;
	}
}
