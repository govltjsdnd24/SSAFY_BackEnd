package edu.ssafy.servlet;

import java.io.IOException;
import java.security.Provider.Service;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;

@WebServlet("/mygeneric.do")
public class MyGenericServlet extends GenericServlet {
	private static final long serialVersionUID = 1L;
       
    public MyGenericServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    @Override
    public void init() throws ServletException {
    	// TODO Auto-generated method stub
    	System.out.println("init");
    }
    
    @Override
    public void destroy() {
    	System.out.println("destroy");
    }

	/**
	 * @see Servlet#service(ServletRequest request, ServletResponse response)
	 */
	public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
		System.out.println("service");
	}

}
