<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String strID = (String)request.getAttribute("id");
%>
</head>
<body>

	웹페이지
	<p/>
	<a href="../hi">글쓰기</a>
	<p/>
	<%=strID %>
	
</body>
</html>