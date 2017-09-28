package net.ssmc.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.maxmind.geoip2.exception.GeoIp2Exception;

import net.ssmc.services.AnalyticsServices;


public class AuditInterceptor implements HandlerInterceptor { 
	
	@Autowired
	private AnalyticsServices analyticsServices;
	
	@Override 
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		System.out.println("PRE");
		return true; 
	} 
	
	@Override 
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		System.out.println("POST" + modelAndView);
		if(modelAndView != null && modelAndView.hasView()){
			new Thread(new Runnable() {
				@Override
				public void run() {
					try {
						analyticsServices.saveHistory(request);
					} catch (IOException | GeoIp2Exception e) {
					}
				}
			}).start();
		}
	} 
	
	@Override 
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception { 
		System.out.println("After completion handle");
		
	 } 
}