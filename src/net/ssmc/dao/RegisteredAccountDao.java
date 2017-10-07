package net.ssmc.dao;

import net.ssmc.model.RegisteredAccount;

public interface RegisteredAccountDao {

	long create(RegisteredAccount registeredAccount) throws Exception;
	RegisteredAccount findOne(int id);
	RegisteredAccount findOne(String email);
	
}
