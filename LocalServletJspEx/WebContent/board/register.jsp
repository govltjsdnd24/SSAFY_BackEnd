<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="edu.ssafy.dao.*"    
%>
<%! 
	BoardDao dao = BoardDaoImpl.getBoardDao();
%>

<%
	String userid= request.getParameter("userid");
	String subject= request.getParameter("subject");
	String content= request.getParameter("content");
	String hit= request.getParameter("hit");
	String registertime= request.getParameter("registertime");
	
	BoardDto dto = new BoardDto();
	dto.setUserId(userid);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setHit(Integer.parseInt(hit));
	dto.setRegisterTime(registertime);
	
	int cnt=dao.writeArticle(dto);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% if(cnt>0){ %>
		<h1>잘 입력되었습니다.</h1>
	<%} else {%>
		<h1>입력 실패</h1>
	<% } %> 
	<h1><a href="/LocalServletJspEx/board_list.jsp"></a></h1>
</body>
</html>