<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

   
 <%/* 자바 명령어 코딩 */ 
 // %는 서버 명령어를  변수는 여기에 작성 
 //%가 많으면 많을수록 서버가 부담을 가짐 100명이 들어가면 100번을 수행해서 보내야하니깐 .
 //캐시가 미리 저장해놓는데 그래도 html로하면 더 빠른데 
 	String name = "민성";
 	String msg = "jsp 잘되냐 ?? ";
 %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

</style>

<script>

</script>

</head>
<body>
now : <%= new java.util.Date()+"<br>" %>
<%= msg + "<br>" %>
<%= name %>
<% out.print(name); %>
<% out.print(msg); %>


</body>
</html>