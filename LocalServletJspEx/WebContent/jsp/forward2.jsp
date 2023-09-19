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
		String attr=(String)request.getAttribute("msg");
		System.out.println("forward2: "+attr);
	%>	
	<h2>forward2.jsp</h2>
</body>
</html>