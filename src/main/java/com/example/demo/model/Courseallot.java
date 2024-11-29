package com.example.demo.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Courseallot {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int cid;
	String course;
	int semester;
	String subject;
	int tid;
	
	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public Courseallot() {
	}
	
	public Courseallot(int cid, String course, int semester,String subject,int tid) {
		
		this.cid = cid;
		this.course = course;
		this.semester = semester;
		this.subject= subject;
		this.tid=tid;
	}
	
	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	

	@Override
	public String toString() {
		return "Courseallot [cid=" + cid + ", course=" + course + ", semester=" + semester + ", subject=" + subject
				+ ", tid=" + tid + "]";
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
	public void setSemester(int sem) {
		this.semester = sem;
	}
	
}
