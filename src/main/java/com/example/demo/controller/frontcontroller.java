package com.example.demo.controller;

import java.sql.SQLIntegrityConstraintViolationException;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.Attendance;
import com.example.demo.model.Courseallot;
import com.example.demo.model.Coursereg;
import com.example.demo.model.Student;
import com.example.demo.model.Subjects;
import com.example.demo.model.Teacher;
import com.example.demo.model.Teacher;
import com.example.demo.teacherdao.Teacherdao;

import jakarta.servlet.http.HttpSession;

@Controller
public class frontcontroller {

	@Autowired
	Teacherdao tdao;

	@RequestMapping("/teacherlogin0")
	public String teacherindex() {

		return "teacherlogin";
	}

	@RequestMapping("/studentlogin0")
	public String studentindex() {

		return "studentlogin";
	}

	@RequestMapping("/teacherlogin")
	public ModelAndView teacherlogin(@ModelAttribute Teacher tr,Model model) {

		ModelAndView view = new ModelAndView("teacherlogin");
		int num=tdao.teacherregister(tr.getName(), tr.getEmail(), tr.getPassword(), tr.getPhoneno());

		if(num==-1)
		{
			System.out.println("duplicate entry");
			String msg="Email already exist's";
			model.addAttribute("msg",msg);
			view =new ModelAndView("teacherregister");
		}else
		{
			
		}

		return view;
	}

	@RequestMapping("/teacherregister")
	public String teacherregister() {
		return "teacherregister";
	}

	@RequestMapping("/studentlogin")
	public String studentlogin(@ModelAttribute Courseallot ca, HttpSession session) {

		Student st = (Student) session.getAttribute("st");

		tdao.courseregisterr(ca.getCourse(), ca.getSemester(), st.getRollno());

		System.out.println("student login controller");
		System.out.println(ca);

		return "studentlogin";
	}

	@RequestMapping("/studentregister")
	public String studentregister() {

		return "studentregister";
	}

	@RequestMapping("/teacherclass")
	public String teacherclass(@ModelAttribute Courseallot ca, HttpSession session,Model model) {

		List<Courseallot> list = (List<Courseallot>) session.getAttribute("list");
		List<Subjects> list1 = tdao.getsubjects3();
		model.addAttribute("list",list1);
		System.out.println(list+"tea cher class");

		return "teacherclass";
	}

	@RequestMapping("/teachercourseregister")
	public ModelAndView teachercourseregister(@ModelAttribute Courseallot ca, HttpSession session, Model model) {
		ModelAndView view = new ModelAndView("teacherclass"); 
		Teacher tr = (Teacher) session.getAttribute("tr");
		List<Courseallot> list = tdao.courselogin(tr.getTid());
		List<Courseallot> list1 = tdao.courselogincheck();

		session.setAttribute("tr", tr);

		boolean alreadyExists = false;

		for (Courseallot co : list1) {
			if (ca.getCourse().equals(co.getCourse()) && ca.getSemester() == co.getSemester()
					&& ca.getSubject().equals(co.getSubject())) {
				alreadyExists = true;
				String msgr = "Course Already added";
				model.addAttribute("msgr", msgr);
				System.out.println("Match found, course already added.");
				break;
			}
		}

		if (alreadyExists == false) {
			tdao.courseregister(ca.getCourse(), ca.getSemester(), ca.getSubject(), tr.getTid());
			String msgg = "Course added";
			model.addAttribute("msgg", msgg);
			System.out.println("Course registered successfully.");
		}

		model.addAttribute("list", list);
		return view;
	}

	@RequestMapping("/teachercourse")
	public String teachercourse(HttpSession session, Model model) {

		Teacher tr = (Teacher) session.getAttribute("tr");

		session.setAttribute("tr", tr);
		List<Courseallot> list = tdao.courselogin(tr.getTid());

		session.setAttribute("list", list);

		model.addAttribute("list", list);

		System.out.println("teacher course");
		return "teachercourse";
	}
	@RequestMapping("/teachercoursedelete")
	public String teachercoursedelete(HttpSession session, Model model) {

		Teacher tr = (Teacher) session.getAttribute("tr");

		session.setAttribute("tr", tr);
		List<Courseallot> list = tdao.courselogin(tr.getTid());

		session.setAttribute("list", list);

		model.addAttribute("list", list);

		System.out.println("tecaher course delete");
		return "teachercoursedelete";
	}
	@RequestMapping("/teachercoursedeletechoose")
	public String teachercoursedeletechoose(HttpSession session, Model model,@ModelAttribute Courseallot ca) {

		
		Boolean present=false;
		Teacher tr = (Teacher) session.getAttribute("tr");

		session.setAttribute("tr", tr);
		List<Courseallot> list = tdao.courselogin(tr.getTid());

		session.setAttribute("list", list);

		System.out.println(list + "tecahercourse");
		System.out.println(ca+"delete choose");
		
		for(Courseallot co: list)
		{
			if(ca.getCourse().equals(co.getCourse()) && ca.getSemester()==co.getSemester() &&  ca.getSubject().equalsIgnoreCase(co.getSubject()))
			{
				System.out.println("subject present delete it");
				present = true;
				String msgr = "Course Deleted Successfully";
				tdao.deletecourse(ca.getCourse(),ca.getSemester(),ca.getSubject(),tr.getTid());
				model.addAttribute("msgr", msgr);
				break;
				
			}
		}
		if(present == false)
		{
			System.out.println("subject not found ");
			String msgr = "Course not found";
			model.addAttribute("msgr", msgr);
		}
			
		model.addAttribute("list", list);

		return "teachercoursedelete";
	}

	@RequestMapping("/coursetoprofile")
	public String coursetoprofile(HttpSession session, Model model) {
		Teacher tr = (Teacher) session.getAttribute("tr");
		int count = tdao.getcount();

		model.addAttribute("name", tr.getName());
		model.addAttribute("email", tr.getEmail());
		model.addAttribute("password", tr.getPassword());
		model.addAttribute("phoneno", tr.getPhoneno());
		model.addAttribute("count", count);

		return "teacherprofile";
	}

	@RequestMapping("/teacherprofile")
	public ModelAndView teacherprofile(@RequestParam String email, String password, Model model, HttpSession session) {

		Teacher tr = tdao.teacherlogin(email, password);
		System.out.println(tr + "teacherprofile");
		ModelAndView view = null;
		if (tr != null) {
			System.out.println(tr + "from tacher course login");

			session.setAttribute("tr", tr);
			session.setAttribute("email", email);
			session.setAttribute("password", password);

			System.out.println(tr + "teacher profile");

			int count = tdao.getcount();

			model.addAttribute("name", tr.getName());
			model.addAttribute("email", tr.getEmail());
			model.addAttribute("password", tr.getPassword());
			model.addAttribute("phoneno", tr.getPhoneno());
			model.addAttribute("count", count);
			view = new ModelAndView("teacherprofile");

		} else {
			String msg = "Incorrect Email or Password";
			model.addAttribute("msg", msg);

			view = new ModelAndView("teacherlogin");

		}

		return view;
	}

	@RequestMapping("/studentregistercourse")
	public ModelAndView studentregistercourse(@ModelAttribute Student st, Model model, HttpSession session) throws SQLIntegrityConstraintViolationException {

		ModelAndView view = new ModelAndView("studentregistercourse");
		int num=tdao.studentregister(st.getRollno(), st.getName(), st.getEmail(), st.getPassword(), st.getPhoneno());
		System.out.println(num);
if(num>0)
{
	System.out.println("register succesfull");
	}if(num ==-1) {
		System.out.println("regioster fail");
		String msg="Roll number : " + st.getRollno()+" already registered. Please enter a unique roll number.";
		model.addAttribute("msg",msg);
		view = new ModelAndView("studentregister");
	}
		session.setAttribute("st", st);

		return view;
	}

	@RequestMapping("/studentlogincourse")
	public String studentlogincourse(@RequestParam int rollno, String email, int password, HttpSession session) {

		return "studentlogincourse";
	}

	@RequestMapping("/studentprofile")
	public ModelAndView studentprofile(@RequestParam int rollno, String email, String password, Model model,
			HttpSession session) {

		ModelAndView view = new ModelAndView("studentprofile");
		
		Student st = tdao.studentlogin(rollno, email, password);
		session.setAttribute("st", st);
		if(st == null) {
			System.out.println("student not found");
			String msg="Student not found !";
					model.addAttribute("msg",msg);
			view = new ModelAndView("studentlogin");
		}else
		{
			System.out.println("student  found");
			Coursereg ca = tdao.studentcourselogin(st.getRollno());
			System.out.println(st + "student profile");
			System.out.println(ca + "student[profile");
			session.setAttribute("ca", ca);

			model.addAttribute("course", ca.getCourse());
			model.addAttribute("semester", ca.getSemester());
			model.addAttribute("rollno", st.getRollno());
			model.addAttribute("name", st.getName());
			model.addAttribute("email", st.getEmail());
			model.addAttribute("password", st.getPassword());
			model.addAttribute("phoneno", st.getPhoneno());

			int present = tdao.getattcountp(st.getRollno());
			int absent = tdao.getattcounta(st.getRollno());
			model.addAttribute("present", present);
			model.addAttribute("absent", absent);

			List<Courseallot> list = tdao.getcoursename(ca.getCourse(), ca.getSemester());
			model.addAttribute("list", list);
		}
			

		

		return view;
	}

	@RequestMapping("/takeAttendance")
	public String takeAttendance(Model model, HttpSession session, @RequestParam String course, int semester) {

		Teacher tr = (Teacher) session.getAttribute("tr");
		session.setAttribute("tr", tr);
		String subject =   (String) session.getAttribute("subject");
		
		System.out.println("takeattendance");
		System.out.println(course);
		System.out.println(semester);

		List<String> list = tdao.getsubjects(course,semester,tr.getTid());
		System.out.println("take attendnace"+list);
		
		List<Student> students = tdao.studentlist(course, semester);
        students.sort((student1, student2) -> Integer.compare(student1.getRollno(), student2.getRollno()));

		session.setAttribute("students",students);
		session.setAttribute("list1",list);

		model.addAttribute("students", students);
		model.addAttribute("list", list);

		System.out.println("takeattenndace" + tr);

		return "takeAttendance";
	}

	@RequestMapping("/takeAttendancechoose")
	public String takeAttendancechoose(HttpSession session, Model model) {

		Teacher tr = (Teacher) session.getAttribute("tr");

		session.setAttribute("tr", tr);

		List<String> list = tdao.courseselected(tr.getTid());
		List<String> list1 = tdao.courseselected1(tr.getTid());
		System.out.println(list);
		System.out.println(list1);
			

		System.out.println("choose" + tr);
		System.out.println(list + "choose");

		model.addAttribute("list", list);
		model.addAttribute("list1", list1);

		return "takeAttendancechoose";
	}

	@RequestMapping("/attendancesubmit")
	public ModelAndView attendancesubmit(@RequestParam List<String> attendance, LocalDate date,String subject, HttpSession session,
			Model model) {
		List<Student> students=(List<Student>)session.getAttribute("students");
		List<String> list1 =  (List<String>) session.getAttribute("list1");

		ModelAndView view = new ModelAndView("teacherprofile");
		Teacher tr = (Teacher) session.getAttribute("tr");
		session.setAttribute("tr", tr);
		session.setAttribute("subject", subject);
		session.setAttribute("list1", list1);
		

		
		System.out.println(attendance+"///////////////////////////////////////////////////////////////////////////");

		System.out.println(tr + "attendnace submit");
		System.out.println(subject+"attenace submit");

		List<Attendance> list = tdao.attendancelist( date, tr.getTid(),subject);////////////////////////////////////

		if(list.isEmpty())
		{
			System.out.println("list is empty");
			System.out.println(list);
			for (String record : attendance) {
				String[] parts = record.split(":");
				int studentId = Integer.parseInt(parts[0]);
				String status = parts[1];
				System.out.println("Student ID: " + studentId + ", Status: " + status);

				Attendance att = new Attendance(studentId, studentId, status, date, tr.getTid(),subject);
				att.setRollno(studentId);
				att.setStatus(status);
				att.setDate(date);
				att.setTid(tr.getTid());
				att.setSubject(subject);

				System.out.println(att + "att");

				tdao.attendance(att.getRollno(), att.getStatus(), att.getDate(), att.getTid(),subject);
			}
		}else
		{
			System.out.println("list has strudengt");
			System.out.println(list);
			
			String msg="Attendance already taken ";
			model.addAttribute("msg",msg);
			model.addAttribute("students", students);
			model.addAttribute("list", list1);

			view = new ModelAndView("takeAttendance");
			

		}
		int count = tdao.getcount();

	
		model.addAttribute("name", tr.getName());
		model.addAttribute("email", tr.getEmail());
		model.addAttribute("password", tr.getPassword());
		model.addAttribute("phoneno", tr.getPhoneno());
		model.addAttribute("count", count);

		return view;
	}

	@RequestMapping("/fetchrecord")
	public String fetchrecord(HttpSession session,Model model) {
		Teacher tr = (Teacher) session.getAttribute("tr");
		session.setAttribute("tr", tr);
		System.out.println("fetch record");
		
		List<String> list = tdao.getsubjects1(tr.getTid());

		model.addAttribute("list",list);
		

		return "fetchrecord";
	}

	@RequestMapping("/fetch")
	public ModelAndView fetch(@RequestParam LocalDate date,String subject, Model model, HttpSession session) {

		ModelAndView view = null;
		Teacher tr = (Teacher) session.getAttribute("tr");
		session.setAttribute("tr", tr);

		
		List<Attendance> list = tdao.fetchrecord(date, tr.getTid(),subject);
		System.out.println(list + "fetch");

		session.setAttribute("list", list);
		model.addAttribute("list", list);
		model.addAttribute("date", date);
		view = new ModelAndView("record");

		return view;
	}

	@RequestMapping("/goback")
	public String goback(HttpSession session, Model model) {

		Teacher tr = (Teacher) session.getAttribute("tr");
		session.setAttribute("tr", tr);
		int count = tdao.getcount();

		model.addAttribute("name", tr.getName());
		model.addAttribute("email", tr.getEmail());
		model.addAttribute("password", tr.getPassword());
		model.addAttribute("phoneno", tr.getPhoneno());
		model.addAttribute("count", count);

		System.out.println("fetch record");

		return "teacherprofile";
	}

	@RequestMapping("/gobackst")
	public String gobackst(HttpSession session, Model model) {

		Student st = (Student) session.getAttribute("st");
		Coursereg ca = (Coursereg) session.getAttribute("ca");

		model.addAttribute("course", ca.getCourse());
		model.addAttribute("semester", ca.getSemester());
		model.addAttribute("rollno", st.getRollno());
		model.addAttribute("name", st.getName());
		model.addAttribute("email", st.getEmail());
		model.addAttribute("password", st.getPassword());
		model.addAttribute("phoneno", st.getPhoneno());

		int present = tdao.getattcountp(st.getRollno());
		int absent = tdao.getattcounta(st.getRollno());
		model.addAttribute("present", present);
		model.addAttribute("absent", absent);

		List<Courseallot> list = tdao.getcoursename(ca.getCourse(), ca.getSemester());
		System.out.println(list + "studentbprofile");
		model.addAttribute("list", list);

		return "studentprofile";
	}

	@RequestMapping("/perrecordchoose")
	public String perrecordchoose(HttpSession session,Model model) {
		Student st = (Student) session.getAttribute("st");
		Coursereg ca = (Coursereg) session.getAttribute("ca");

		session.setAttribute("st", st);
		
		List<Subjects> list = (List<Subjects>)tdao.getsubjects2(ca.getSemester(), ca.getCourse());
		
		model.addAttribute("list",list);

		return "perrecordchoose";
	}

	@RequestMapping("/perrecord")
	public String perrecord(HttpSession session, Model model, @RequestParam String subject) {

		Student st = (Student) session.getAttribute("st");
		System.out.println(st + subject);
		System.out.println(subject);
		Coursereg ca = (Coursereg) session.getAttribute("ca");

		session.setAttribute("st", st);
		session.setAttribute("ca", ca);

		List<Attendance> list = tdao.perrecord(subject, st.getRollno());

		System.out.println(list+"efcsefjbwefvbwyhvfwvfywevfy");
		int present = tdao.getattcountst(subject, st.getRollno());
		int absent = tdao.getattcountabst(subject, st.getRollno());
		
		
		model.addAttribute("present", present);
		model.addAttribute("absent", absent);

		int tabsent = tdao.tabsent(st.getRollno());
		
		int fine=0;
		if(absent>10)
		{
			int num = absent-10;
			fine = fine + num*50;
		}
		model.addAttribute("fine",fine);
		
		int tfine=0;
		if(tabsent>50)
		{
			int num = tabsent - 50;
			tfine = tfine + num*50;
		}
		model.addAttribute("tfine",tfine);

		model.addAttribute("list", list);
System.out.println(fine+tfine+"rgvbsebgaiegaeubvieuvbgaiegvaiugvaiugviauegviuae");
		return "perrecord";
	}

	@RequestMapping("/forperrecord")
	public String forperrecord() {

		return "forperrecord";
	}

	@RequestMapping("/forperrecordtr")
	public String forperrecordtr(HttpSession session) {
		Teacher tr = (Teacher) session.getAttribute("tr");
		session.setAttribute("tr", tr);
		return "forperrecordtr";
	}

//	@RequestMapping("/forperrecordroll")
//	public String forperrecordroll(@RequestParam int rollno, Model model) {
//
//		System.out.println(rollno + "forperrecordroll");
//
//		Student st = tdao.strolllogin(rollno);
//
//		System.out.println(st + "from forperrecord");
//		List<Attendance> list = tdao.perrecord(st.getRollno());
//		System.out.println(list);
//		int present = tdao.getattcountst(st.getRollno());
//		int absent = tdao.getattcountabst(st.getRollno());
//		model.addAttribute("present", present);
//		model.addAttribute("absent", absent);
//
//		model.addAttribute("list", list);
//		model.addAttribute("st", st);
//
//		System.out.println("for per record");
//
//		return "perrecord";
//	}
	@RequestMapping("/forperrecordrolltr")
	public ModelAndView forperrecordrolltr(@RequestParam int rollno, Model model, HttpSession session) {

		ModelAndView view = null;
		Teacher tr = (Teacher) session.getAttribute("tr");
		session.setAttribute("tr", tr);

		System.out.println(rollno + "forperrecordroll");

		Student st = tdao.strolllogin(rollno);

		if (st != null) {
			List<Attendance> list = tdao.perrecordtr(st.getRollno(), tr.getTid());
			System.out.println(list);
			int present = tdao.getattcount(st.getRollno(), tr.getTid());
			int absent = tdao.getattcountab(st.getRollno(), tr.getTid());
			int tabsent = tdao.tabsent(st.getRollno());
			

			model.addAttribute("present", present);
			model.addAttribute("absent", absent);

			model.addAttribute("list", list);
			model.addAttribute("st", st);
			int fine = 0;
			
			if(absent>10)
			{
				int num=absent-10;
				fine=fine+num*50;
			}
			model.addAttribute("fine",fine);
			int tfine=0;
			
			if(tabsent>50)
			{
				int num=tabsent-50;
				 tfine = tfine+num*50;
			}
			model.addAttribute("tfine",tfine);


			view = new ModelAndView("perrecordtr");
		} else {
			String msg = "Roll No. not Found !";
			model.addAttribute("msg", msg);

			view = new ModelAndView("forperrecordtr");
		}
		System.out.println(st + "from forperrecord");

		System.out.println("for per record");

		return view;
	}

}
