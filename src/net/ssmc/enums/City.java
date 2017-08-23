package net.ssmc.enums;

import java.util.HashMap;
import java.util.Map;

public enum City {

	MAKATI("Makati City"),
	MANILA("Manila City"),
	TAGUIG("Taguig City");
	
	private String name;
	
	private City(String name) {
		this.name=name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public static City getCityByName(String name) {
	     for (City city : City.values()) {
	         if (city.getName().equalsIgnoreCase(name)) {
	             return city;
	         }
	     }
	     throw new IllegalArgumentException("the given number doesn't match any Status.");
	}
	
	public static Map<String, String> cities(){
		Map<String, String> cities = new HashMap<>();
		for (City city : City.values()) {
			cities.put(city.toString(), city.getName());
		}
		return cities;
	};
}
