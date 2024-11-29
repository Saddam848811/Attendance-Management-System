package com.example.demo.model;

import java.math.BigInteger;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Teacher {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int tid;
	String name;
	String email;
	String password;
	long phoneno;
	@Override
	public String toString() {
		return "Teacher [tid=" + tid + ", name=" + name + ", email=" + email + ", password=" + password + ", phoneno="
				+ phoneno + "]";
	}
	
	
	
	
	public Teacher() {
	}
	
	public  Teacher(int tid, String name, String email, String password, long phoneno) {
		
		
		this.name = name;
		this.email = email;
		this.password = password;
		this.phoneno = phoneno;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
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
