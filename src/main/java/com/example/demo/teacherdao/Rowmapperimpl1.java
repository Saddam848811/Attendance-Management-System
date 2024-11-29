package com.example.demo.teacherdao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.example.demo.model.Courseallot;
import com.example.demo.model.Teacher;

public class Rowmapperimpl1 implements RowMapper<Courseallot> {

	@Override
	public Courseallot mapRow(ResultSet rs, int rowNum) throws SQLException {

		Courseallot ca = new Courseallot();
		ca.setCourse(rs.getString("cname"));
		ca.setSemester(rs.getInt("sem"));
		ca.setSubject(rs.getString("subject"));
		
		return ca;
	}

}
