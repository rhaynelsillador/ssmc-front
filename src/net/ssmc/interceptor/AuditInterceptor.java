package net.ssmc.interceptor;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.maxmind.geoip2.exception.GeoIp2Exception;

import net.ssmc.enums.Module;
import net.ssmc.model.RegisteredAccount;
import net.ssmc.services.AnalyticsServices;


public class AuditInterceptor implements HandlerInterceptor { 
	
	@Autowired
	private AnalyticsServices analyticsServices;
	
	@Override 
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		System.out.println("PRE");
		RegisteredAccount registeredAccount = (RegisteredAccount) session.getAttribute("accountLoggedIn");
		System.out.println(registeredAccount);
		try{
			HandlerMethod hm=(HandlerMethod)handler; 
			Method method=hm.getMethod();
			if(method.getDeclaringClass().isAnnotationPresent(Controller.class) && method.isAnnotationPresent(AppicationAudit.class)){
				final Module module = method.getAnnotation(AppicationAudit.class).module();
				if (registeredAccount == null && module != Module.ALL) {
					response.sendRedirect("Welcome");
				}				
			}
		}catch (Exception e) {
		}
		
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