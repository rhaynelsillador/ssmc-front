package net.cms.ssmc.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import net.cms.ssmc.dao.DirectoryDao;
import net.cms.ssmc.dao.DoctorDao;
import net.cms.ssmc.model.Directory;
import net.cms.ssmc.model.Doctor;

public class DoctorsDirectoryServices {

	@Autowired
	private DirectoryDao directoryDao;
	@Autowired
	private DoctorDao doctorDao;
	
	public List<Directory> findAllDirectories(){
		return directoryDao.findAll();
	}
	
	public List<Doctor> findAllDoctors(){
		return doctorDao.findAll();
	}
	
	public List<Doctor> findAllDoctors(long directoryId, String name){
//		long directory = 0;
//		if(!directoryId.isEmpty()){
//			directory = Long.parseLong(directoryId);
//		}
		return doctorDao.findAll(directoryId, name);
	}
	
}
