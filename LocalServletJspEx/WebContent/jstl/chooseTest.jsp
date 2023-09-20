<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="user" value="s"></c:set>
</head>
<body>
	<c:choose>
		<c:when test="${user== 'ssafy' }">
			<jsp:include page="ifTest.jsp"></jsp:include>
		</c:when>
		<c:when test="${user == 'guest' }">
			<jsp:include page="forTest.jsp"></jsp:include>
		</c:when>	
		<c:otherwise>
			<jsp:include page="outTest.jsp"></jsp:include>
		</c:otherwise>
	</c:choose>
</body>
</html>