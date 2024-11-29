	package com.example.demo.teacherdao;
	
	import java.sql.ResultSet;
	import java.sql.SQLException;
	
	import org.springframework.jdbc.core.RowMapper;
	
	import com.example.demo.model.Attendance;
	
	public class RowMapperat implements RowMapper<Attendance> {
	
		@Override
		public Attendance mapRow(ResultSet rs, int rowNum) throws SQLException {
	
			Attendance at = new Attendance();
			
			at.setRollno(rs.getInt("rollno"));
			at.setStatus(rs.getString("status"));
			at.setDate(rs.getDate("date").toLocalDate());
			at.setTid(rs.getInt("tid"));
			at.setSubject(rs.getString("subject"));
			
			return at;
		}
	
	}
