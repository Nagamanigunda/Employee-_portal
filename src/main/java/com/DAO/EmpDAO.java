package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.EmpModel;


public class EmpDAO {
	String status="fail";
	public String insertEmp(EmpModel em) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mani","root","root");
			PreparedStatement ps=con.prepareStatement("insert into e1 values(?,?,?,?)");
			ps.setInt(1,em.getEid());
			ps.setString(2,em.getEname());
			ps.setString(3,em.getMail());
			ps.setString(4, em.getPassword());
			int i=ps.executeUpdate();
			if(i>0) {
				status="success";
				System.out.println(status);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	return status;
	}
	
	public EmpModel Authen(String email,String ps) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mani","root","root");
			
			PreparedStatement ps1=con.prepareStatement("select * from e1 where mail=? and password=?");
			ps1.setString(1, email);
			ps1.setString(2, ps);
			
			ResultSet rs = ps1.executeQuery();
			while(rs.next()) {
				return new EmpModel(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4));
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
				
		return null;
		
	}
	public List<EmpModel> getAllDetails() {
		List<EmpModel> list=new ArrayList();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mani","root","root");
			PreparedStatement ps=con.prepareStatement("select * from e1");
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				EmpModel em=new EmpModel(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4));
				list.add(em);
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		
		return list;
		
	}
	
	public String deleteemps(int id) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mani","root","root");
			PreparedStatement ps=con.prepareStatement("delete from e1 where eid=?");
			ps.setInt(1, id);
			int i=ps.executeUpdate();
			if(i>0) {
				status="success";
			}
			
				
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		
		return status;
		
	}
	public EmpModel getEmpById(int id) {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mani","root","root");
			PreparedStatement ps=con.prepareStatement("select * from e1 where eid=?");
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				System.out.println("-------------");
				EmpModel e= new EmpModel(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4));	
				return e;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	public String  updateEmps(EmpModel emp) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mani","root","root");
			PreparedStatement ps=con.prepareStatement("update e1 set ename=?,mail=?,password=? where eid=?");
			
			ps.setString(1,emp.getEname());
			ps.setString(2, emp.getMail());
			ps.setString(3, emp.getPassword());
			ps.setInt(4, emp.getEid());
			int n = ps.executeUpdate();
			if(n>0) {
				status="success";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
		
	}

}
