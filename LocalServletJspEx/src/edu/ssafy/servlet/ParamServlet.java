package edu.ssafy.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/paramservlet.do")
public class ParamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static int a;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int op1= Integer.parseInt(request.getParameter("op1"));
		int op2= Integer.parseInt(request.getParameter("op2"));
		int res= op1+op2;
		PrintWriter out = response.getWriter();
		out.println("<h1>"+res+"</h1>");
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request.getParameter("nop1");
		int op1=Integer.parseInt(request.getParameter("nop1"));
		int op2=Integer.parseInt(request.getParameter("nop2"));
		int res=op1+op2;
		
		String[] check= request.getParameterValues("check");
		PrintWriter out = response.getWriter();
		
		if(check != null) {
			for (String str:check) {
				System.out.println(str);
			}
		}
		
		StringBuffer sb= new StringBuffer();
//		<label for="iop1">op1 </label><input type="text" id= "iop1" name= "nop1">
//		<label for="iop2">op2 </label><input type="text" id= "iop2" name= "nop2">
//		<label for="res">res</label><input type="text" id= "res" name= "res" readonly="readonly">
		sb.append("<h1>"+op1 + " + "+ op2+"  = " + res+"<h1>");
		out.println(sb.toString());
	}

}
