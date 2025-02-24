package com.model;

public class EmpModel {
	private int eid;
	private String ename;
	private String mail;
	private String password;
	public EmpModel(int eid, java.lang.String ename, java.lang.String mail, java.lang.String string) {
		this.eid = eid;
		this.ename = ename;
		this.mail = mail;
		this.password = string;
	}
	public EmpModel() {
		
	}
	public int getEid() {
		return eid;
	}
	public void setEid(int eid) {
		this.eid = eid;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String toString() {
		return "EmpModel [eid= " + eid + ",ename = " + ename + " , mail = " + mail + " , password = " + password + "]";
		
	}

}
