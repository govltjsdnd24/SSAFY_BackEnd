<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String root= request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	index.jsp
	<%response.sendRedirect("board/board_write.jsp"); %>
	<%-- <jsp:forward page="<%=root%>/board/board_write.jsp"> --%>
</body>
</html>