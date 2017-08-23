package net.ssmc.dao;

import java.util.List;
import java.util.Map;

import net.ssmc.model.User;

public interface UserDao {
	
	long count();
	void create(User user);
	User retrieve(int id);
	List<User> retrieveAll(Map<String, String> request);
	User retrieve(String username);
	User login(String username, String password) throws Exception;
	void update(User user);
	int countApprover();
	void updateApprover(User user);
}
