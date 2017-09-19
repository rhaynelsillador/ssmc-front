package net.ssmc.services;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import net.ssmc.dao.AnalyticsDao;
import net.ssmc.model.Analytics;

public class AnalyticsServices {

	@Autowired
	private AnalyticsDao analyticsDao;
	
	public void saveHistory(HttpServletRequest httpServletRequest){
		
		Analytics analytics = new Analytics();
		analytics.setCountry(getCountry(httpServletRequest));
		analytics.setIp(getIp(httpServletRequest));
		analytics.setUrl("http://localhost:675/SSMC/Corporate");
		
		try {
			analyticsDao.create(analytics);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private String getIp(HttpServletRequest httpServletRequest){
		return "192.168.1.16";
	}
	
	private String getCountry(HttpServletRequest httpServletRequest){
		return "Philippines";
	}
}
