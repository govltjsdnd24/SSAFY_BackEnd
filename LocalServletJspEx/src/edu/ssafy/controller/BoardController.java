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
	
	@Override
	public void init() throws ServletException {
		super.init();
		service=BoardServiceImpl.getBoardService();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("type/html; charse=utf-8");
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String path="";
		System.out.println("GET: "+request+" "+response+" " +path);
		try {
			if(action.equals("register")) {
				path=register(request,response);
				forward(request,response,path);
				
			} else if (action.equals("list")) {
				path=boardlist(request,response);
				forward(request,response,path);
			} else if( action.equals("view")) {
				path=view(request,response);
				forward(request,response,path);
			}	else if ("modify".equals(action)) {
				path = modify(request, response);
				forward(request, response, path);
			} else if ("delete".equals(action)) {
//				path = delete(request, response);
				sendRedirect(request, response, path);
			} else {
				sendRedirect(request, response, path);
			}
		}
		catch(Exception e) {
			//e.printStackTrace();
			//error page forward
			//asdsd
		}
		
		
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
	
	private String boardlist(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("here");
		return "/board/board_list.jsp";
	}
	
	private String view(HttpServletRequest request, HttpServletResponse response) {
		String articleNo=request.getParameter("articleno");
		try {
			BoardDto boardDto= service.viewArticle(Integer.parseInt(articleNo));
			service.updateHit(Integer.parseInt(articleNo));
			request.setAttribute("article", boardDto);
			return "board/view.jsp";
		} catch(Exception e) {
			e.printStackTrace();
			return "index.jsp";
		}
	}
	
	private String modify(HttpServletRequest request, HttpServletResponse response) {
		return null;
		//String 
		
	}
	
//	private String delete(HttpServletRequest request, HttpServletResponse response) {
//		
//		
//	}

	private void forward(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		request.getRequestDispatcher(path).forward(request, response);
		return;
	}

	private void sendRedirect(HttpServletRequest request, HttpServletResponse response, String path) throws IOException {
		response.sendRedirect(request.getContextPath()+path);
	}
	
	

	
}
