package com.example.demo.model;

import jakarta.persistence.Entity;


public class Student {

	int rollno;
	String name;
	String email;
	String password;
	long phoneno;
	
	
	
	public Student()
	{
		
	}
	
	@Override
	public String toString() {
		return "Student [rollno=" + rollno + ", name=" + name + ", email=" + email + ", password=" + password
				+ ", phoneno=" + phoneno + "]";
	}
	public Student(int rollno, String name, String email, String password, long phoneno) {
		
		this.rollno = rollno;
		this.name = name;
		this.email = email;
		this.password = password;
		this.phoneno = phoneno;
	}
	public int getRollno() {
		return rollno;
	}
	public void setRollno(int rollno) {
		this.rollno = rollno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public long getPhoneno() {
		return phoneno;
	}
	public void setPhoneno(long phoneno) {
		this.phoneno = phoneno;
	}
	
}
