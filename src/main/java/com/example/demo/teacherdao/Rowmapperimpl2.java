package com.example.demo.teacherdao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.example.demo.model.Student;

public class Rowmapperimpl2 implements RowMapper<Student> {

	@Override
	public Student mapRow(ResultSet rs, int rowNum) throws SQLException {

		Student st = new Student() ;
		
		st.setRollno(rs.getInt(1));
		st.setName(rs.getString(2));
		st.setEmail(rs.getString(3));
		st.setPassword(rs.getString(4));
		st.setPhoneno(rs.getLong(5));
		
		
		return st;
	}

}
