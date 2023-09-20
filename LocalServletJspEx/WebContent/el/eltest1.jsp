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
		BoardDto dto=new BoardDto();
		dto.setUserId("dto");
		pageContext.setAttribute("name","park");
		request.setAttribute("name", "lee");
		session.setAttribute("name","Kim");
		application.setAttribute("name","son");
	%>
	
	<div align="center">
		<p><%=pageContext.getAttribute("name") %></p>
		PageScope: ${pageScope.name }
		RequestScope: ${requestScope.name }
		SessionScope: ${sessionScope.name }
		ApplicationScope: ${applicationScope.name }<br>
		<%= dto.getUserId()%>
		userid: ${pageScope.dto.getUserId()}
		userid: ${dto.userId() }
	</div>
</body>
</html>