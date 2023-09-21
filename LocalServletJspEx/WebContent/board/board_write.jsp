<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, edu.ssafy.dao.*"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<c:set var="dao" value="${BoardDaoImpl.getBoardDao()}"></c:set>
<c:set var="dto" value="${BoardDto()}"></c:set>
<c:set var="result" value="${dao.writeArticle(dto)}"></c:set>

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
				<a href="${root}/member?action=list">글목록</a><br />
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
		<form id="writeform">
			<input type="hidden" name="action" value="register">
			<table border="1">

				<tr>
					<td>아이디</td><td><input type="text" name="userid"></td>
				</tr>
				<tr>
					<td>제목</td><td><input type="text" name="subject"></td>
				</tr>
				<tr>
					<td>내용</td><td><input type="text" name="content"></td>
				</tr>
				
			</table>
				<input type="button" value="확인" id="boardwrite" style="margin:10px">
				<input type="reset" value="취소" style="margin:10px">
		</form>
	</div>
	
	<script type="text/javascript">
		let button= document.querySelector("#boardwrite");
		button.addEventListener("click", function() {
			if (!document.querySelector("#subject").value) {
		          alert("제목 입력!!");
		          return;
		    } else if (!document.querySelector("#content").value) {
		          alert("내용 입력!!");
		          return;
		    }
			let form = document.querySelector("#writeform");
			form.method="post";
			form.setAttribute("action","${root}/board?action=register");
			form.submit();
		});
	</script>
</body>
</html>