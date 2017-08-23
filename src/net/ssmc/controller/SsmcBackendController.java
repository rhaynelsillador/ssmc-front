package net.ssmc.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.ssmc.enums.Access;
import net.ssmc.enums.City;
import net.ssmc.enums.Module;
import net.ssmc.enums.TransactionType;
import net.ssmc.interceptor.AppicationAudit;
import net.ssmc.model.Clinic;
import net.ssmc.model.Role;
import net.ssmc.model.User;
import net.ssmc.services.ClinicServices;
import net.ssmc.services.RoleServices;
import net.ssmc.services.UserServices;

@Controller
public class SsmcBackendController {
	
	@Autowired
	private HttpServletRequest httpServletRequest;
	@Autowired
	private ClinicServices clinicServices;
	@Autowired 
	private UserServices userServices;
	@Autowired
	private RoleServices roleServices;
	
	@AppicationAudit(module = Module.DASHBOARD, access = Access.RETRIEVE)
	@RequestMapping(path="/Dashboard", method = RequestMethod.GET, produces="application/json")
	public String dashboard(ModelMap map){
		return "backend/Dashboard";
	}
	
	@AppicationAudit(module = Module.USER, access = Access.RETRIEVE)
	@RequestMapping(path="/Accounts", method = RequestMethod.GET, produces="application/json")
	public String accounts(ModelMap map){
		return "backend/Account";
	}
	
	@AppicationAudit(module = Module.USER, access = Access.UPDATE)
	@RequestMapping(path="/AccountUpdate", method = RequestMethod.GET, produces="application/json")
	public String updateAccounts(ModelMap map, @RequestParam int id){
		HttpSession session = httpServletRequest.getSession(true);
		session.setAttribute("AccountUpdateId", id);
		session.setAttribute("TRANSACTION", TransactionType.UPDATE);
		User user = userServices.getUser(id);
		map.addAttribute("users", user);
		map.addAttribute("userRoles", roleServices.userRolesUpdate(session));
		List<Role> roles = new ArrayList<>();
		roles.add(new Role(user.getRoleId(), user.getRoleName()));
		map.addAttribute("role", roles);
		return "backend/AccountUpdate";
	}
	
	@AppicationAudit(module = Module.USER, access = Access.CREATE)
	@RequestMapping(path="/AccountAdd", method = RequestMethod.GET, produces="application/json")
	public String accountAdd(ModelMap map){
		HttpSession session = httpServletRequest.getSession(true);
		session.removeAttribute("AccountUpdateId");
		session.setAttribute("TRANSACTION", TransactionType.ADD);
		map.addAttribute("role", roleServices.getRole(new HashedMap()));
		return "backend/AccountUpdate";
	}
	
	@AppicationAudit(module = Module.ROLE, access = Access.RETRIEVE)
	@RequestMapping(path="/Role", method = {RequestMethod.GET, RequestMethod.POST}, produces="application/json")
	public String role(ModelMap map, @RequestParam Map<String, String> request){
		HttpSession session = httpServletRequest.getSession(true);
		return "backend/Role";
	}
	
	@AppicationAudit(module = Module.ROLE, access = Access.UPDATE)
	@RequestMapping(path="/RoleUpdate", method = {RequestMethod.GET, RequestMethod.POST}, produces="application/json")
	public String roleUpdate(ModelMap map, @RequestParam Map<String, String> request) {
		HttpSession session = httpServletRequest.getSession(true);
		session.setAttribute("ROLEID", request.get("id"));
		session.setAttribute("ROLENAME", request.get("name"));
		map.addAttribute("roles", roleServices.roles(session));
		return "backend/RoleUpdate";
	}
	
	@AppicationAudit(module = Module.CLINIC, access = Access.RETRIEVE)
	@RequestMapping(path="/Clinic", method = RequestMethod.GET, produces="application/json")
	public String clinic(ModelMap map){
		map.addAttribute("username", "rhaynel");
		return "backend/Clinic";
	}
	
	@AppicationAudit(module = Module.CLINIC, access = Access.UPDATE)
	@RequestMapping(path="/ClinicUpdate", method = {RequestMethod.GET, RequestMethod.POST}, produces="application/json")
	public String addClinic(ModelMap map, @RequestParam Map<String, String> request) {
		HttpSession session = httpServletRequest.getSession(true);
		Clinic clinic = clinicServices.getClinic(session, Long.parseLong(request.get("id")));
		map.addAttribute("username", "rhaynel");
		map.addAttribute("cities", City.cities());
		map.addAttribute("clinic", clinic);
		map.addAttribute("title", clinic.getName());
		session.setAttribute("clinicId", request.get("id"));
		session.setAttribute("TRANSACTION", TransactionType.UPDATE);
		return "backend/ClinicUpdate";
	}
	
	@AppicationAudit(module = Module.CLINIC, access = Access.UPDATE)
	@RequestMapping(path="/ContactUsMessages", method = {RequestMethod.GET, RequestMethod.POST}, produces="application/json")
	public String contactUsMessages(ModelMap map, @RequestParam Map<String, String> request) {
		HttpSession session = httpServletRequest.getSession(true);
		return "backend/ContactUs";
	}
}
