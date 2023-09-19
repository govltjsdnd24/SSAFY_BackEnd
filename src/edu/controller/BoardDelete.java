package edu.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.repository.BoardDAO;

@WebServlet("/delete")
public class BoardDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BoardDelete() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int articleNo = Integer.parseInt(request.getParameter("deleteno"));
		BoardDAO dao= BoardDAO.getInstance();
		dao.deleteArticle(articleNo);
		
		//화면 처리
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html lang=\"ko\">");
		out.println("  <head>");
		out.println("    <meta charset=\"UTF-8\" />");
		out.println("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" />");
		out.println("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />");
		out.println("    <link");
		out.println("      href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css\"");
		out.println("      rel=\"stylesheet\"");
		out.println("      integrity=\"sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65\"");
		out.println("      crossorigin=\"anonymous\"");
		out.println("    />");
		out.println("    <link href=\"/board/assets/css/app.css\" rel=\"stylesheet\" />");
		out.println("    <title>SSAFY</title>");
		out.println("  </head>");
		out.println("  <body>");
		out.println("    <div class=\"container\">");
		out.println("              <button type=\"button\" id=\"btn-list\" class=\"btn btn-outline-danger\">");
		out.println("                다시 목록으로");
		out.println("      </div>");
		out.println("    </div>");
		out.println("    <script");
		out.println("      src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js\"");
		out.println("      integrity=\"sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4\"");
		out.println("      crossorigin=\"anonymous\"");
		out.println("    ></script>");
		out.println("    <script>");
		out.println("      document.querySelector(\"#btn-list\").addEventListener(\"click\", function () {");
		out.println("        location.href = \"/board1_servlet/list\";");
		out.println("      });");
		out.println("    </script>");
		out.println("  </body>");
		out.println("</html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
