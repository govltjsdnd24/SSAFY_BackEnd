<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="user" value="ssafy"> </c:set>
</head>
<body>
	
	<c:if test="${user eq 'ssafy' }">
		<c:out value="${user }님"></c:out>
	</c:if>
	<c:if test="${empty user}">
		<c:out value="이름을 입력하세요"></c:out>
	</c:if>
</body>
</html>