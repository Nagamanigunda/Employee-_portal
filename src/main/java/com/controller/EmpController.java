package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.DAO.EmpDAO;
import com.model.EmpModel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class EmpController extends HttpServlet{
	
	Connection con;
	@Override
	protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException {
		System.out.println("Hello");
		int eid= Integer.parseInt(req.getParameter("eid"));
		String ename=req.getParameter("ename");
		String mail=req.getParameter("mail");
		String password=req.getParameter("password");
		
		System.out.println(eid);
		System.out.println(ename);
		System.out.println(mail);
		System.out.println(password);
		
		//creating model object
		EmpModel em=new EmpModel();
		em.setEid(eid);
		em.setEname(ename);
		em.setMail(mail);
		em.setPassword(password);
		
		
		//creating DAO Object
		EmpDAO ed=new EmpDAO();
		String status=ed.insertEmp(em);
		if(status.equals("success")) {
			System.out.println("rows are affected");
//			req.setAttribute("ename",ename );
			RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
			rd.forward(req, res);
			
		}
		else {
			System.out.println("Something went wrong");
			RequestDispatcher rd=req.getRequestDispatcher("index.html");
			rd.forward(req, res);
			
		}
		
		
	}
	
	

}
