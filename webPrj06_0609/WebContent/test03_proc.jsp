<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%
   	request.setCharacterEncoding("utf-8"); // 이게 있어야지 get post방식 모두 한글을 받을수 있다. 세미콜론을 뺴면 500번 에러가 발생.  
   	
   	String name= request.getParameter("name"); //여기서는 무조건 String으로 받는다 .모든 getParameter의 리턴값은 String이다 . 
   	String tel = request.getParameter("tel");
   	String email = request.getParameter("email");
   %> 
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>넘어온 정보 </h1>
	<div>이름 :<%=name %></div>
	<div>전화 :<%=tel %> </div>
	<div>이메일 :<%=email %> </div>
</body>
</html>