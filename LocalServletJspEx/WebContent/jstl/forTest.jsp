<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="price" value="{'1000','2000','3000'}"></c:set>
</head>
<body>
	<c:forEach begin="0" end="3" items="${price}" var="p" varStatus="i">
		price: ${p } : ${i.count }<br>
	</c:forEach>
	<hr>
	<c:forTokens delims=":" items="${price }" var="p" varStatus="i">
		price: ${p } : ${i.count }<br>
	</c:forTokens>
</body>
</html>