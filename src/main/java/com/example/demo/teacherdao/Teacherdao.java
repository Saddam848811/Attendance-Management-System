package com.example.demo.teacherdao;

import java.sql.Date;
import java.sql.SQLIntegrityConstraintViolationException;

import java.time.LocalDate;
import java.util.List;

import javax.security.auth.Subject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.MethodArgumentNotValidException;

import com.example.demo.model.Attendance;
import com.example.demo.model.Courseallot;
import com.example.demo.model.Coursereg;
import com.example.demo.model.Student;
import com.example.demo.model.Subjects;
import com.example.demo.model.Teacher;

@Repository
public class Teacherdao {

	@Autowired
	JdbcTemplate template;

	public int teacherregister(String name, String email, String password, long phoneno) {
		int num = 0;
		try {
			num = template.update("INSERT INTO teacher (name, email, password, phoneno) VALUES (?, ?, ?, ?)", name,
					email, password, phoneno);

		} catch (DuplicateKeyException e) {
			e.printStackTrace();
			num=-1;
		}

		System.out.println(name + "from jdbc");
		if (num > 0) {
			System.out.println("teacher regioster success");
		} else {
			System.out.println("teacher register fail");
		}
		return num;
	}

	public Teacher teacherlogin(String email, String password) {
		System.out.println(email);

		Teacher tr = null;
		RowMapper<Teacher> rowmap = new Rowmapperimpl();
		try {
			tr = template.queryForObject("select * from teacher where email=? and password =?", rowmap, email,
					password);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return tr;
	}

	public void courseregister(String course, String semester, String subject) {
	}

	public void courseregister(String course, int semester, String subject, int tid) {
		int num = template.update("INSERT INTO courseallot (cname, sem,subject,tid) VALUES (?, ?,?,?)", course,
				semester, subject, tid);

		if (num > 0) {
			System.out.println("course register success");
		} else {
			System.out.println("course register fail");
		}

	}

	public List<Courseallot> courselogin(int tid) {

		RowMapper<Courseallot> row = new Rowmapperimpl1();

		List<Courseallot> list = template.query("SELECT * FROM courseallot where tid=?", row, tid);

		return list;
	}

	public List<Courseallot> courselogincheck() {

		RowMapper<Courseallot> row = new Rowmapperimpl1();

		List<Courseallot> list = template.query("SELECT * FROM courseallot", row);

		return list;
	}

	public int getcount() {
		Integer count = template.queryForObject("SELECT COUNT(*) FROM student", Integer.class);
		System.out.println(count + "count");
		return count;

	}

	public int studentregister(int rollno, String name, String email, String password, long phoneno) {

		int num = 0;
		System.out.println(phoneno);
		try {
			num = template.update("INSERT INTO student (rollno, name, email, password, phoneno) VALUES (?, ?, ?, ?, ?)",
					rollno, name, email, password, phoneno);
			if (num > 0) {
				System.out.println("student register successfullyy");
			} else {
				System.out.println("student register fail");
			}
		} catch (DuplicateKeyException e) {
			e.printStackTrace();
			num = -1;
		}

		return num;
	}

	public void courseregisterr(String course, int semester, int rollno) {

		int num = template.update("INSERT INTO courseregister (cname, sem,rollno) VALUES (?, ?,?)", course, semester,
				rollno);

		if (num > 0) {
			System.out.println("course register student success");
		} else {
			System.out.println("course register student fail");
		}

	}

	public Student studentlogin(int rollno, String email, String password) {

		Student st = null;
		RowMapper<Student> rowmap = new Rowmapperimpl2();
		try {
			st = template.queryForObject("select * from student where rollno=? and email=? and password =?", rowmap,
					rollno, email, password);
		} catch (Exception e) {

			e.printStackTrace();
		}

		return st;
	}

	public Coursereg studentcourselogin(int rollno) {

		System.out.println(rollno + "studentcourseregister");
		RowMapper<Coursereg> row = new Rowmapperimplcr();

		Coursereg ca = template.queryForObject("select  * from courseregister where rollno=? ", row, rollno);

		System.out.println(ca + "student course register");
		return ca;
	}

	public List<Student> studentlist(String course, int semester) {

		RowMapper<Student> row = new Rowmapperimpl2();
		List<Student> studentlist = (List<Student>) template.query(
				"SELECT s.* FROM student s 	JOIN courseregister c ON s.rollno = c.rollno WHERE c.cname = ? AND c.sem = ?",
				row, course, semester);

		System.out.println(studentlist);

		return studentlist;
	}

	public void attendance(int rollno, String status, LocalDate date, int tid, String subject) {

		int num = template.update("INSERT INTO attendance (rollno, status,date,tid,subject) VALUES (?, ?,?,?,?)",
				rollno, status, date, tid, subject);

		if (num > 0) {
			System.out.println("attendance register succesfull");
		} else {
			System.out.println("attendance fail");
		}

	}

	public List<Attendance> fetchrecord(LocalDate date, int tid, String subject) {
		System.out.println(date + " date from fetch record");

		List<Attendance> list = null;
		RowMapper<Attendance> row = new RowMapperat();
		try {
			list = template.query("SELECT * FROM attendance WHERE date = ? and tid=? and subject=?", row, date, tid,
					subject);

		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println(list + " from fetchrecord");

		return list;
	}
	
	public int tabsent(int rollno) {
		String sql = "SELECT COUNT(*) FROM attendance WHERE rollno = ? AND status = 'absent'";
		int count = template.queryForObject(sql, new Object[] { rollno }, Integer.class);
		System.out.println(count);
		return count;
	}

	public int getattcount(int rollno, int tid) {
		String sql = "SELECT COUNT(*) FROM attendance WHERE rollno = ? AND status = 'present'  and tid=?";
		int count = template.queryForObject(sql, new Object[] { rollno, tid }, Integer.class);
		System.out.println(count);
		return count;
	}

	public int getattcountab(int rollno, int tid) {

		String sql = "SELECT COUNT(*) FROM attendance WHERE rollno = ? AND status = 'absent' and tid=?";
		int count = template.queryForObject(sql, new Object[] { rollno, tid }, Integer.class);
		System.out.println(count);
		return count;

	}

	public int getattcountp(int rollno) {
		int count = 0;
		System.out.println(rollno);
		try {
			String sql = " SELECT     (COUNT(CASE WHEN status = 'present' THEN 1 END) / COUNT(*)) * 100 AS average_present_percentage FROM attendance WHERE     rollno = ?";
			count = template.queryForObject(sql, new Object[] { rollno }, Integer.class);
		} catch (Exception e) {

			e.printStackTrace();
		}
		System.out.println(count + "getattcountp");
		return count;
	}

	public int getattcounta(int rollno) {

		int count = 0;
		try {
			String sql = " SELECT     (COUNT(CASE WHEN status = 'absent' THEN 1 END) / COUNT(*)) * 100 AS average_present_percentage FROM attendance WHERE     rollno = ?";

			count = template.queryForObject(sql, new Object[] { rollno }, Integer.class);
		} catch (Exception e) {

			e.printStackTrace();
		}

		return count;
	}

	public int getattcountst(String subject, int rollno) {
		String sql = " SELECT COUNT(DISTINCT a.date) AS present_count FROM attendance a JOIN courseallot c ON a.tid = c.tid WHERE c.subject = ? AND a.rollno = ? AND a.status = 'present'";
		int count = template.queryForObject(sql, new Object[] { subject, rollno }, Integer.class);
		System.out.println(count);
		return count;
	}

	public int getattcountabst(String subject, int rollno) {

		String sql = " SELECT COUNT(DISTINCT a.date) AS present_count FROM attendance a JOIN courseallot c ON a.tid = c.tid WHERE c.subject = ? AND a.rollno = ? AND a.status = 'absent'";
		int count = template.queryForObject(sql, new Object[] { subject, rollno }, Integer.class);
		System.out.println(count);
		return count;

	}

	public List<Attendance> perrecord(String subject, int rollno) {

		RowMapper<Attendance> row = new RowMapperat();
		List<Attendance> list = template.query("Select * from attendance where subject = ? and rollno=?", row, subject,
				rollno);
		System.out.println(list + "from perrecord");

		return list;
	}

	public List<Attendance> perrecordtr(int rollno, int tid) {

		RowMapper<Attendance> row = new RowMapperat();
		List<Attendance> list = template.query("select * from attendance where rollno=? and tid=?", row, rollno, tid);
		System.out.println(list + "from perrecord");

		return list;
	}

	public Student strolllogin(int rollno) {

		Student st = null;
		System.out.println(rollno + "strolllogin");
		RowMapper<Student> row = new Rowmapperimpl2();
		try {
			st = template.queryForObject("select * from student where rollno=?", row, rollno);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return st;
	}

	public void adda(int prollno, String pname) {

		int num = template.update("insert into a values(?,?)", prollno, pname);

		if (num > 0) {
			System.out.println("register success");
		} else {
			System.out.println("reguister fail");
		}
	}

	public List<String> courseselected(int tid) {

		List<String> list = template.query("SELECT cname FROM courseallot WHERE tid = ? GROUP BY cname",
				new Object[] { tid }, (rs, rowNum) -> rs.getString("cname"));

		System.out.println(list);
		return list;
	}

	public List<String> courseselected1(int tid) {

		List<String> list1 = template.query("SELECt sem FROM courseallot WHERE tid = ? GROUP BY sem",
				new Object[] { tid }, (rs, rowNum) -> rs.getString("sem"));
		System.out.println(list1);
		return list1;
	}

	public List<Courseallot> getcoursename(String course, int semester) {
		String sql = "select * from courseallot where cname=? and sem=?";
		System.out.println("get course name" + course);
		RowMapper<Courseallot> row = new Rowmapperimpl1();
		List<Courseallot> list = template.query(sql, row, course, semester);
		System.out.println(list);
		return list;
	}

	public void deletecourse(String course, int semester, String subject, int tid) {

		template.update("delete from courseallot where cname=? and sem=? and subject=? and tid=?", course, semester,
				subject, tid);
	}

	public List<Attendance> attendancelist(LocalDate date, int tid, String subject) {

		List<Attendance> list = null;
		RowMapper<Attendance> row = new RowMapperat();
		list = template.query("select * from attendance where date=? and tid=? and subject=?", row, date, tid, subject);

		return list;
	}

	public List<String> getsubjects(String course, int semester, int tid) {

		List<String> list = template.query("select * from courseallot where cname=? and sem=? and tid=?",
				new Object[] { course, semester, tid }, (rs, rownum) -> rs.getString("subject"));
		return list;
	}

	public List<String> getsubjects1(int tid) {

		List<String> list = template.query("select * from courseallot where tid=?", new Object[] { tid },
				(rs, rownum) -> rs.getString("subject"));
		return list;
	}

	public List<Subjects> getsubjects2(int semester, String course) {

		RowMapper<Subjects> row = new RowMapperimplsub();

		List<Subjects> list = template.query("select * from subjects where sem=? and cname=?", row, semester, course);
		return list;
	}

	public List<Subjects> getsubjects3() {

		RowMapper<Subjects> row = new RowMapperimplsub();

		List<Subjects> list = template.query("select * from subjects ", row);
		return list;
	}

}
