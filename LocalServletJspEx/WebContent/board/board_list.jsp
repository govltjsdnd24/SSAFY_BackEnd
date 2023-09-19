<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, edu.ssafy.dao.*"
    errorPage="error.jsp"
%>
<%!
	BoardDao dao = BoardDaoImpl.getBoardDao();
%>

<%
	String root=request.getContextPath();
	List<BoardDto> list=dao.listArticle();
	System.out.println(list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<table border=1>
			<tr><td>글번호</td><td>아이디</td><td>제목</td><td>내용</td><td>조회수</td><td>등록일</td></tr>
			<% for(int i=0;i<list.size();i++){%>
				<tr>
				<td><%=list.get(i).getArticleNo()%></td>
				<td><%=list.get(i).getUserId()%></td>
				<td><%=list.get(i).getSubject()%></td>
				<td><%=list.get(i).getContent()%></td>
				<td><%=list.get(i).getHit() %></td>
				<td><%=list.get(i).getRegisterTime() %></td>
				<%-- <td><a class="boardview" data-view="<%=list.get(i).getArticleNo()%>" value="상세보기" type="button"></td> --%>
				<td><a href="<%=root%>/board?action=view&articleno=<%=list.get(i).getArticleNo()%>" value="상세보기" type="button"></td>
				</tr>
			<%} %>
			
			
			
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