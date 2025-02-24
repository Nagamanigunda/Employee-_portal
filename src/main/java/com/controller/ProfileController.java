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

@WebServlet("/myprofile")
public class ProfileController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("Update profile Controller");
        
       
            String idParam = req.getParameter("id");
           
            
            int id = Integer.parseInt(idParam);
            EmpDAO empDAO = new EmpDAO();
            EmpModel empModel = empDAO.getEmpById(id);
            
            if (empModel == null) {
                req.setAttribute("error", "Employee not found");
            } else {
                req.setAttribute("getemps", empModel);
            }
            
            RequestDispatcher rd = req.getRequestDispatcher("myprofile.jsp");
            rd.forward(req, resp);
       
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
				
	            EmpModel empModel = ed.getEmpById(eid);

				
				if(status.equals("success")) {
	                req.setAttribute("getemps", empModel);

					  RequestDispatcher rd = req.getRequestDispatcher("myprofile.jsp");
			            rd.forward(req, resp);
				}
				
				
	}
	
}
