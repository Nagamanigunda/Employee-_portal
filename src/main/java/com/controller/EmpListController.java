package com.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.DAO.EmpDAO;
import com.model.EmpModel;

@WebServlet("/EmpListController")
public class EmpListController extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EmpDAO ed=new EmpDAO();
		List<EmpModel> allemps=ed.getAllDetails();
		System.out.println(allemps);
		request.setAttribute("allemps", allemps);
		RequestDispatcher rd=request.getRequestDispatcher("home.jsp");
		rd.forward(request, response);
		
	}

}
