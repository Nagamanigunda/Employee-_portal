package com.controller;

import java.io.IOException;

import com.DAO.EmpDAO;
import com.model.EmpModel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/login")
public class LoginController extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		System.out.println(" hiii");
		String uname=req.getParameter("mail");
		String password=req.getParameter("password");
		System.out.println(uname);
		System.out.println(password);
		
		HttpSession session=req.getSession();
		
		EmpDAO ed=new EmpDAO();
		EmpModel emp=ed.Authen(uname, password);
		if(emp!=null) {
			System.out.println("row(S) are affected");
			session.setAttribute("emp",emp);
			RequestDispatcher rd=req.getRequestDispatcher("EmpListController");
			rd.forward(req, res);
		}
		else {
			System.out.println("something went wrong");
			RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
			rd.include(req, res);
		}
		
		
		
	}

}
