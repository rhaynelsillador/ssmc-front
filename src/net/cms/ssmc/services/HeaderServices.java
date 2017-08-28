package net.cms.ssmc.services;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import net.cms.ssmc.dao.HeaderDao;
import net.cms.ssmc.model.Header;
import net.ssmc.enums.App;
import net.ssmc.enums.Page;

public class HeaderServices {

	@Autowired
	private HeaderDao headerDao;
	
	public HeaderServices(){
		
	}
	
	public void getHeaders(HttpServletRequest httpServletRequest){
		List<Header> headers = headerDao.retrieve(Page.Main);
		for (Header header : headers) {
			if(header.getType().equals(App.BUSINESS)){
				httpServletRequest.setAttribute("business", header);
			}else if(header.getType().equals(App.CLINIC)){
				httpServletRequest.setAttribute("clinic", header);
			}
		}
		
	}
	
	public Header getBusinessHeader(){
		return headerDao.retrieve(App.BUSINESS, Page.Corporate);
	}
	public Header getMedicalHeader(){
		return headerDao.retrieve(App.CLINIC, Page.Medical);
	}
}
