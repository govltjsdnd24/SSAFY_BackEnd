<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, edu.ssafy.dao.*, edu.ssafy.model.*"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="dao" value="${BoardDaoImpl.getBoardDao()}"></c:set>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<c:set var="list" value="${dao.listArticle()}"></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="userId" value=" ${sessionScope.userId}"></c:set>
	<c:set var="userName" value=" ${sessionScope.userName}"></c:set>
	<c:choose>
		<c:when test="${userId ne ' '}">
			<div class="row justify-content-center">
			  <div class="col-lg-8 col-md-10 col-sm-12 text-center">
				<strong>${userId}</strong> (${userName})님 안녕하세요.
				<a href="${root}/member?action=register">글쓰기</a><br />
				<a href="${root}/member?action=logout">로그아웃</a><br />
			  </div>
			</div>
		</c:when>
		<c:otherwise>
			<script>
			alert("로그인이 필요한 페이지입니다.");
			location.href = "${root}/member/loginform.jsp";
			</script>
		</c:otherwise>
	</c:choose>
	<div align="center">
		<table border=1>
			<tr><td>글번호</td><td>아이디</td><td>제목</td><td>내용</td><td>조회수</td><td>등록일</td></tr>
			<c:forEach  items="${list}" var="l">
				<tr>
				<td>${l.getArticleNo()}</td>
				<td>${l.getUserId()}</td>
				<td>${l.getSubject()}</td>
				<td>${l.getContent()}</td>
				<td>${l.getHit()}</td>
				<td>${l.getRegisterTime()}</td>
				<td><a href="${root}/board?action=view&articleno=${l.getArticleNo()}" value="상세보기" type="button">Click Here</a></td>	
				</tr>
			</c:forEach>
			
			
		</table>
	</div>
	<script type="text/javascript">
		document.querySelectAll(".boardview").foreach(function(item){
			item.addEventListener("click", function(){
				let articleno = this.getAttribute("data-view");
			});
		});
	</script>
</body>
</html>

