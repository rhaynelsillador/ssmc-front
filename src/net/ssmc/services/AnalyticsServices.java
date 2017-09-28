package net.ssmc.services;

import java.io.File;
import java.io.IOException;
import java.net.InetAddress;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import com.maxmind.geoip2.DatabaseReader;
import com.maxmind.geoip2.exception.GeoIp2Exception;
import com.maxmind.geoip2.model.CityResponse;
import com.maxmind.geoip2.record.City;
import com.maxmind.geoip2.record.Country;
import com.maxmind.geoip2.record.Location;

import net.ssmc.dao.AnalyticsDao;
import net.ssmc.model.Analytics;

public class AnalyticsServices {

	@Value("${GEOIPURL}")
	private String GEOIPURL;
	@Autowired
	private AnalyticsDao analyticsDao;
	
	public void saveHistory(HttpServletRequest httpServletRequest) throws IOException, GeoIp2Exception{
		
		String uri = httpServletRequest.getScheme() + "://" +
				httpServletRequest.getServerName() + 
	             ("http".equals(httpServletRequest.getScheme()) && httpServletRequest.getServerPort() == 80 || "https".equals(httpServletRequest.getScheme()) && httpServletRequest.getServerPort() == 443 ? "" : ":" + httpServletRequest.getServerPort() ) +
	             httpServletRequest.getRequestURI() +
	            (httpServletRequest.getQueryString() != null ? "?" + httpServletRequest.getQueryString() : "");
		System.out.println(uri);
		
		String ip = getIp(httpServletRequest);
		CityResponse response = getCountry(httpServletRequest, "121.58.211.162");
		
		
		
		Country country = response.getCountry();
		City city = response.getCity();
		Location location = response.getLocation();
		
		Analytics analytics = new Analytics();
		analytics.setCountry(country.getName());
		analytics.setCity(city.getName());
		analytics.setLatitude(location.getLatitude());
		analytics.setIp(ip);
		analytics.setUrl(uri);
		
		
		try {
			analyticsDao.create(analytics);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private String getIp(HttpServletRequest httpServletRequest){
		String ip = httpServletRequest.getHeader("X-FORWARDED-FOR");
		if (ip == null) {
			ip = httpServletRequest.getRemoteAddr();
		}
		return ip;
	}
	
	private CityResponse getCountry(HttpServletRequest httpServletRequest, String ip) throws IOException, GeoIp2Exception{
       	File database = new File(GEOIPURL);
      	DatabaseReader reader = new DatabaseReader.Builder(database).build();
      	InetAddress ipAddress = InetAddress.getByName(ip);
      	CityResponse response = reader.city(ipAddress);
		return response;
	}
	
}
