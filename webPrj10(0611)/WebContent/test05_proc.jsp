<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String favoriteNumber = request.getParameter("fruit"); //요청 getParameter 리턴값은 무조건 String
	int favNum = Integer.valueOf(favoriteNumber);
	String [] fruits = {"Apple","Banana","Kiwi","Mango"};
	String [] selFruits = request.getParameterValues("fruits");
	String str = "";
	for(int i=0; i<selFruits.length;i++){
		str += selFruits[i] + ",";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>선호하는 과일 : <%=fruits [favNum] %></div>
	<div>좋아하는 과일 : <%=str %></div>

</body>
</html>