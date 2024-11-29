package com.example.demo.model;


public class Subjects {

	int sid;
	String subname;
	int sem;
	String cname;
	public Subjects() {
		
	}
	public Subjects(int sid, String subname, int sem, String cname) {
		
		this.sid = sid;
		this.subname = subname;
		this.sem = sem;
		this.cname = cname;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public String getSubname() {
		return subname;
	}
	public void setSubname(String subname) {
		this.subname = subname;
	}
	public int getSem() {
		return sem;
	}
	public void setSem(int sem) {
		this.sem = sem;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	
	
}
