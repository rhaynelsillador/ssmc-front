package net.ssmc.dao;

import net.ssmc.model.RegisteredAccount;

public interface RegisteredAccountDao {

	long create(RegisteredAccount registeredAccount) throws Exception;
	RegisteredAccount findOne(int id) throws Exception;
	RegisteredAccount findOne(String email) throws Exception;
	RegisteredAccount findOne(String email, String password) throws Exception;
	
}
