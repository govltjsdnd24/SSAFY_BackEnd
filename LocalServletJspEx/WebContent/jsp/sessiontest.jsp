<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if(session.isNew()){
	%>
	<p> 첫 방문 이시군요</p>
	<%
	}else{
	%>
	<p> welcome back</p>
	<%
	}
	%>
	<p>JSESSIONID : <%=session.getId() %></p>
	<%!
		int cnt;
	%>
	<%
		if(++cnt > 5) {
			session.invalidate();
		}
	%>
	
</body>
</html>