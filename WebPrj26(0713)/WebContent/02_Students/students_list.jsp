<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="java.util.ArrayList" %>
<%@ page language="java" import="PKG_STUDENT.*" %>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
	.col1{width:250px; height:30px; float:left;}
	#rows{clear:both;}
</style>

<%
	/* 방법1
	String strID = (String)request.getAttribute("strID");
	String strName = (String)request.getAttribute("strName");
	String strTel = (String)request.getAttribute("strTel"); */
	
	//방법2
	//ResultSet rs = (ResultSet)request.getAttribute("ResultSet");
	//방법3
	//ArrayList arr = (ArrayList)request.getAttribute("students");
	//방법4
	ArrayList<Student> arr = (ArrayList<Student>)request.getAttribute("students");
	
	
%>

<body>
	<div>리스트</div>
	
	<%--  <% while(rs.next()){  	%>
	
	<div>
		방법1
		<div>아이디: <%=strID %></div>
		<div>이름: <%=strName %></div>
		<div>연락처: <%=strTel %></div>
		
		방법2
		<div>아이디: <%=rs.getString("STU_ID") %></div>
		<div>이름: <%=rs.getString("STU_NAME") %></div>
		<div>연락처: <%=rs.getString("STU_TEL") %></div>
	</div>

	
	<% }  %>  --%>
	
	<!-- 방법 3 -->
	<%--  <%
		for(Object obj : arr){
		String strStu_id = ((Student)obj).getStu_id();
		String strStu_name = ((Student)obj).getStu_name();
		String strStu_tel = ((Student)obj).getStu_tel();
	%> --%>
		<%-- <div>아이디 : <%=strStu_id %></div>
		<div>이름 : <%=strStu_name %></div>
		<div>연락처 : <%=strStu_tel %></div> --%>
<%-- 	
	<%
		}
	%> 
 --%>
	
	<!-- 방법4 -->
	
	 <%
		for(Student stud : arr){
		String strStu_id = stud.getStu_id();
		String strStu_name = stud.getStu_name();
		String strStu_tel = stud.getStu_tel();
	%> 
	
	<div id="rows">
	
		<div class="col1">아이디 : <a href="./Students?stu_id=<%=strStu_id%>&doWork=detail"><%=strStu_id %></a></div><!--  경로를 달고 가니깐 Students의 doget방식으로 넘어간다. --> 
		<div class="col1">이름 : <%=strStu_name %></div>
		<div class="col1">연락처 :<%=strStu_tel %></div>
	 </div>
	 
	<%
		}
	%>
	
	<div><a href="./student_register.jsp"> 학생등록 </a></div>
	
</body>
</html>