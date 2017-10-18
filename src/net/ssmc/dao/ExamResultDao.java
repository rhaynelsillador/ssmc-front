package net.ssmc.dao;

import java.util.List;

import net.ssmc.model.ExamResult;

public interface ExamResultDao {

	void create(ExamResult examResult);
	List<ExamResult> findByAccount(long accountId);
	void delete(long id);
	
}
