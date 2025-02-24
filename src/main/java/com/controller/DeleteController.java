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

@WebServlet("/delete")
public class DeleteController extends HttpServlet{

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));
		System.out.println(id + "------------------");
		
		EmpDAO d=new EmpDAO();
		String status=d.deleteemps(id);
		System.out.println(status);
		List<EmpModel> allemps=d.getAllDetails();
		req.setAttribute("allemps", allemps);
		RequestDispatcher rd=req.getRequestDispatcher("home.jsp");
		rd.forward(req, resp);
	}

}
