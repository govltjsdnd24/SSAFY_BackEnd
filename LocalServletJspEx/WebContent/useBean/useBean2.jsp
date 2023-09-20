<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:useBean id="dto" class = "edu.ssafy.dao.BoardDto" scope="session"/>
<jsp:useBean id="t" class = "edu.ssafy.dao.BoardDto" scope="session"/>
<jsp:setProperty property="userId" name="t" value ="park"/>

<body>
	<div align="center">
		<pre>
		useBean2.jsp
		
		<%=dto.getSubject() %>
		
		<%-- <%=BoardDto.session.getAttribute(t).t.userId %> --%>
		{t.userId?
		</pre>
	</div>
</body>
</html>