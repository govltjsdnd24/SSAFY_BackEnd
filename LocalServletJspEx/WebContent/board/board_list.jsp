<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, edu.ssafy.dao.*, edu.ssafy.model.*"
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
	<%
	MemberDto userInfo = (MemberDto) session.getAttribute("userinfo");
	if(userInfo != null) {
	%>
		<div class="row justify-content-center">
		  <div class="col-lg-8 col-md-10 col-sm-12 text-center">
			<strong><%= userInfo.getUserName() %></strong> (<%= userInfo.getUserId() %>)님 안녕하세요.
			<a href="<%= root %>/member?action=logout">로그아웃</a><br />
		  </div>
		</div>
	<%
	} else {
	%>
		<script>
		alert("로그인이 필요한 페이지입니다.");
		location.href = "<%= root %>/member?action=logout";
		</script>
	<%	
	}
	%>
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
				<td><a href="<%=root%>/board?action=view&articleno=<%=list.get(i).getArticleNo()%>" value="상세보기" type="button">Click Here</td>
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

