<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	index.jsp<br/>
	<li><a href="${root}/board/boardwrite.jsp">회원등록</a></li>
	<li><a href="${root}/board?action=boardlist">회원리스트</a></li>
	<li><a href="${root}/member?action=loginform">로그인</a></li>

</body>
</html>
