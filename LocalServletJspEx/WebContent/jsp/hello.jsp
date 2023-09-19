<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!//선언
	int a=10;

	//provaected 

	void print(){
		System.out.println("SSAFY");
	}
	class Ssafy{
		void print(){};
	}
	Ssafy s = new Ssafy();
%>

<%	//스크립트잇
	int a =20;
	print();
	s.print();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>hello</h1>
	<h2><%=a%></h2>
</body>
</html>