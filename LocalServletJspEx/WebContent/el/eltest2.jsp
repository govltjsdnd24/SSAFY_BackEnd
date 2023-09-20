<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="edu.ssafy.dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String name= (String) request.getParameter("name");
		request.setAttribute("id", "id");
	%>
	
	<div align="center">
		<%=name %><br>
		${param.name }
		<!-- 만약 param이 배열이면 -->
		${paramValues.name[0]}<br>
		${paramValues.name[1]}<br>
		
		${id }
	</div>
</body>
</html>