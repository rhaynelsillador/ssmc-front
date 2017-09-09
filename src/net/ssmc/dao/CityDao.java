package net.ssmc.dao;

import java.util.List;

import net.ssmc.model.City;

public interface CityDao {

	long create(City city);
	List<City> findAll();
	
}
