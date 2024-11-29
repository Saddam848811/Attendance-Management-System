package com.example.demo.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Coursereg {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int cid;
	String course;
	int semester;
	int rollno;
	
	@Override
	public String toString() {
		return "Coursereg [cid=" + cid + ", course=" + course + ", semester=" + semester + ", rollno=" + rollno + "]";
	}

	public Coursereg() {
	}
	
	public Coursereg(int cid, String course, int semester, int rollno) {
		this.cid = cid;
		this.course = course;
		this.semester = semester;
		this.rollno = rollno;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public int getSemester() {
		return semester;
	}
	public void setSemester(int semester) {
		this.semester = semester;
	}
	
	
	public int getRollno() {
		return rollno;
	}
	public void setRollno(int rollno) {
		this.rollno = rollno;
	}
	
}
