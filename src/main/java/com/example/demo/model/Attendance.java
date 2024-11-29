package com.example.demo.model;

import java.time.LocalDate;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Attendance {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int aid;
	int rollno;
	String status;
	LocalDate date;
	int tid;
	String subject;

	public LocalDate getDate() {
		return date;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public void setDate(LocalDate date) {
		this.date = date;
	}
	public Attendance() {
	}
	public Attendance(int id, int rollno, String status,LocalDate date,int tid,String subject) {
		
		
		this.rollno = rollno;
		this.status = status;
		this.date = date;
		this.tid=tid;
		this.subject=subject;
	}

	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public int getId() {
		return aid;
	}

	public void setId(int id) {
		this.aid = id;
	}

	
	@Override
	public String toString() {
		return "Attendance [aid=" + aid + ", rollno=" + rollno + ", status=" + status + ", date=" + date + "]";
	}
	public int getRollno() {
		return rollno;
	}

	public void setRollno(int rollno) {
		this.rollno = rollno;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	

}
