package com.controller;

import java.io.IOException;
import java.util.List;

import com.DAO.EmpDAO;
import com.model.EmpModel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/update")
public class UpdateController extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			  
		System.out.println("Update Controller");
               int update=Integer.parseInt(req.getParameter("id"));
               
               EmpDAO e=new EmpDAO();
               EmpModel em=e.getEmpById(update);
               System.out.println(em);
               req.setAttribute("getemps", em);
               
               HttpSession session = req.getSession();
               EmpModel semp =(EmpModel) session.getAttribute("emp");
               
               if(semp.getEid()!=em.getEid()) {
               
               RequestDispatcher rd=req.getRequestDispatcher("Update.jsp");
               rd.forward(req, resp);
               }
               else {
            	   
                   RequestDispatcher rd=req.getRequestDispatcher("profileUpdate.jsp");
                   rd.forward(req, resp);
               }
               
               
               
               
	}

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
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
				
				EmpDAO ed=new EmpDAO();
				
				String status = ed.updateEmps(em);
				
				List<EmpModel> allemps=ed.getAllDetails();
				System.out.println(allemps);
				req.setAttribute("allemps", allemps);
				RequestDispatcher rd=req.getRequestDispatcher("home.jsp");
				rd.forward(req, resp);

				
	}
}
