<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="edu.ssafy.dao.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		BoardDto b= new BoardDto();
		b.setSubject("목차");
		session.setAttribute("dto", b);
	%>
	<a href="./useBean2.jsp">useBean</a>
</body>
</html>