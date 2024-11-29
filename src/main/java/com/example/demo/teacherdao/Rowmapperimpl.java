package com.example.demo.teacherdao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.example.demo.model.Teacher;

public class Rowmapperimpl implements RowMapper<Teacher> {

	@Override
	public Teacher mapRow(ResultSet rs, int rowNum) throws SQLException {

		Teacher tr = new Teacher();

		tr.setTid(rs.getInt(1));
		tr.setName(rs.getString(2));
		tr.setEmail(rs.getString(3));
		tr.setPassword(rs.getString(4));
		tr.setPhoneno(rs.getLong(5));

		return tr;

	}

}
