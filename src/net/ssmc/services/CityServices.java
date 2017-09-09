package net.ssmc.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import net.ssmc.dao.CityDao;
import net.ssmc.model.City;

public class CityServices {

	@Autowired
	private CityDao cityDao;
	
	public List<City> getAllCities(){
		return cityDao.findAll();
	}
	
}
