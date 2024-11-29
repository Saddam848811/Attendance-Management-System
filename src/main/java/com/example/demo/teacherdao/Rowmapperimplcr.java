package com.example.demo.teacherdao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.example.demo.model.Courseallot;
import com.example.demo.model.Coursereg;
import com.example.demo.model.Teacher;

public class Rowmapperimplcr implements RowMapper<Coursereg> {

	@Override
	public Coursereg mapRow(ResultSet rs, int rowNum) throws SQLException {

		System.out.println("rmcr");
		Coursereg ca = new Coursereg();
		ca.setCourse(rs.getString("cname"));
		ca.setSemester(rs.getInt("sem"));
		System.out.println(rs.getString(2));

		return ca;
	}

}
