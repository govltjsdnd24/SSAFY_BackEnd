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
	<div align="center" >
	<form action="${root }/member?action=login" method="post">
		<table border="1">
			<tr><td>아이디</td><td><input type="text" id="id" name="id" value=${cookie.id.value}></td></tr>
			<tr><td>비밀번호</td><td><input type="password" name="pw"></td></tr>
			<tr><td>아이디 저장</td><td><input type="checkbox" ${empty cookie.id.value ? "":"checked"} id="idsave" name="idsave"/></td></tr>
			<tr><td colspan="2"><input type="submit" value="로그인"/></td></tr>
			<tr><td colspan="2"><div id='msg'></div></td></tr>
		</table>
	</form>	
	</div>
	<script type="text/javascript">
		document.querySelector("#id").addEventListener("input",function(e){
			let id=e.target.value;
			console.log(id);
			fetch("${root}/member?action=idcheck&"+id)
			.then(function(res){return res.text()})
			.then(function(data){
				console.log(data);
			})
			.catch(function(err){
				console.log("error:"+ data);
			})
		});
		let comment;
		if(data =='ok')
			comment="사용할 수 있는 아이디";
		else
			comment="사용할 수 없는 아이디";
		document.querySelector("#msg").innerHTML=comment;
	</script>
</body>
</html>
