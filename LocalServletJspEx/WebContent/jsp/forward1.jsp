<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>forward1.jsp</h1>
	<% 
		pageContext.setAttribute("op1","11");	
		
		request.setAttribute("msg","sendredirect");
		response.sendRedirect("sendredirect2.jsp");
		
		
	%>
	<%
		pageContext.setAttribute("op1","Hello");
	%>
	
	<jsp:forward page="forward2.jsp"></jsp:forward>
</body>
</html>