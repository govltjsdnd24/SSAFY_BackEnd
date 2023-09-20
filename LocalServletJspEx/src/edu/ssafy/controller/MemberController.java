package edu.ssafy.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.ssafy.model.MemberDto;
import edu.ssafy.service.MemberService;
import edu.ssafy.service.MemberServiceImpl;

@WebServlet("/member")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static MemberService service;
	
	@Override
	public void init() throws ServletException {
		super.init();
		service= new MemberServiceImpl();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		process(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		process(request, response);
	}

	String url=new String("index.jsp");
	private void process(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("type/html; charse=utf-8");
		try {
			String action= request.getParameter("action");
			System.out.println(action);
			if(action !=null) {
				if(action.equals("loginform")) {
					url="member/loginform.jsp";
				}else if(action.contentEquals("login")){
					url=login(request,response);
				} else if(action.equals("logout")) {
					System.out.println("there");
					request.getSession().invalidate();
					url=new String("index.jsp");
				}
			}
			else {
				url=new String("index.jsp");
			}
		}catch(Exception e) {
			request.setAttribute("exception", e);
			url="error.jsp";
		}
		if(url.startsWith("redirect")) {
			url=url.substring(url.indexOf(":")+1);
			url= request.getContextPath()+url;
			response.sendRedirect(url);
		}
		else {
			request.getRequestDispatcher(url).forward(request, response);
		}
	}
	
	private String login(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		//파라미터 처리
		String id= request.getParameter("id");
		String pw=request.getParameter("pw");
		String idsave=request.getParameter("idsave"); // check if remember id is checked
		//로그인
		
		MemberDto login = service.login(id, pw);
		if(login!=null){
			request.setAttribute("login", "true");
			request.getSession().setAttribute("login", "true");
			if(idsave!=null) {
				Cookie c= new Cookie("id",id);
				c.setMaxAge(60*60*24);
				response.addCookie(c);
				System.out.println(c.toString());
			} else { 
				Cookie cookies[] = request.getCookies();
				if(cookies != null) {
					for(Cookie cookie : cookies) {
						if("id".equals(cookie.getName())) {
							cookie.setMaxAge(0);
							response.addCookie(cookie);
							break;
						}
					}
				}
			}
			session.setAttribute("userinfo",login);
			System.out.println(login.getUserName());
			return "redirect:/board?action=list";
		} else {
			request.setAttribute("login", "false");
			return "index.jsp";
		}
		
	}
	
	
	

	
}