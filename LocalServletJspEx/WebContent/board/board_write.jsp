<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, edu.ssafy.dao.*"
%>
<% String root= request.getContextPath(); %>
<%!
	BoardDao dao = BoardDaoImpl.getBoardDao();
	BoardDto dto= new BoardDto();
%>

<%
	dao.writeArticle(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
			let form = document.querySelector("#writeform");
			form.method="post";
			form.setAttribute("action","<%=root%>/board?action=register");
			form.submit();
		});
	</script>
</body>
</html>