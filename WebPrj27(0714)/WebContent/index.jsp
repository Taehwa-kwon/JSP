<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	boolean isSuc = (boolean)request.getAttribute("isSuc"); //null인지 아닌지 false인지 
	
	String msg = "";
	
	if(isSuc){
		msg = "MainHome[로그인 성공]";
	}
	else {
		msg ="MainHome[로그인 전]";
	}

%>


<body>	
		<!-- 학생리스트 -->
		<!-- 	<a href="./Members/login.jsp">로그인</a> 	-->
		<div id="msg"><%=msg %> </div>
		<p/>
		<% if(isSuc){ %>
		<a href="./Test.do">테스트</a>
		<a href="./Login?gubun=logout">로그아웃</a>
		<% } else{
		  %>
		<a href="./Index?gubun=login">로그인</a> <!-- 서블릿갈떄는 같은경로라고 생각하고 -->
		<% } %>
</body>
</html>