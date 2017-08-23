package net.ssmc.utils;

import java.util.Map;

public class DataTableHelper {

	public static String sort(Map<String, String> request){
		for (String key : request.keySet()){
			if(key.contains("sort[")){
				return " ORDER BY "+key.substring(5, key.length()-1)+ " " + request.get(key);
			}
		}
		return "";
	}
	
}
