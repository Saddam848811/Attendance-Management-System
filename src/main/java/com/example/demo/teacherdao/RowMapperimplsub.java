package com.example.demo.teacherdao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.example.demo.model.Subjects;

public class RowMapperimplsub implements RowMapper<Subjects> {

	@Override
	public Subjects mapRow(ResultSet rs, int rowNum) throws SQLException {

		Subjects sub = new Subjects();
		sub.setSubname(rs.getString("subname"));
		sub.setSem(rs.getInt("sem"));
		sub.setCname(rs.getString("cname"));
		return sub;
	}

}
