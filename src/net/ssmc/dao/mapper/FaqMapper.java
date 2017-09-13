package net.ssmc.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.RowMapper;

import net.cms.ssmc.model.Faq;
import net.ssmc.enums.Access;
import net.ssmc.enums.App;
import net.ssmc.enums.Module;
import net.ssmc.model.Role;

public class FaqMapper implements RowMapper<Faq> {

	@Override
	public Faq mapRow(ResultSet rs, int arg1) throws SQLException {
		Faq faq = new Faq();
		faq.setId(rs.getInt("id"));
		faq.setAnswer(rs.getString("answer"));
		faq.setDateAdded(rs.getTimestamp("dateadded"));
		faq.setDateUpdated(rs.getTimestamp("dateupdated"));
		faq.setQuestion(rs.getString("question"));
		faq.setStatus(rs.getBoolean("status"));
		faq.setTitle(rs.getString("title"));
		faq.setType(App.valueOf(rs.getString("type")));
		return faq;
	}

}
