package edu.ssafy.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.ssafy.dao.BoardDto;
import edu.ssafy.service.BoardService;
import edu.ssafy.service.BoardServiceImpl;

@WebServlet("/board")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static BoardService service;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String path="";
		try {
			if(action.equals("register")) {
				path=register(request,response);
				sendRedirect(request,response,path);
				
			} else if (action.equals("boardlist")) {
				//path=boardList(request,response);
				forward(request,response,path);
			} else if( action.contentEquals("view")) {
				forward(request,response,path);
			}
		}
		catch(Exception e) {
			//e.printStackTrace();
			//error page forward
		}
		
		
	}

	@Override
	public void init() throws ServletException {
		super.init();
		service=new BoardServiceImpl();
	}
	

	private String register(HttpServletRequest request, HttpServletResponse response) {
		//파라미터 처리
		String userid=request.getParameter("userid");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		//로직 처리
		BoardDto boardDto=new BoardDto();
		boardDto.setUserId(userid);
		boardDto.setSubject(subject);
		boardDto.setContent(content);
		service.writeArticle(boardDto);
		//화면 처리
		
		return "/board/board_list.jsp";
	}
	
	private void view(HttpServletRequest request, HttpServletResponse response) {
		
		
		
	}

	private void forward(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		request.getRequestDispatcher(path).forward(request, response);
		return;
	}

	private void sendRedirect(HttpServletRequest request, HttpServletResponse response, String path) throws IOException {
		response.sendRedirect(request.getContextPath()+path);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	
}
