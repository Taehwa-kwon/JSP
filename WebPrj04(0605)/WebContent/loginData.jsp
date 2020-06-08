<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String userid  = request.getParameter("userid"); //login에서 보내온걸 받으려면 jsp파일에서 자바로 받아야하니깐 이러하게 작성한다.자바를 사용하려면 %를 사용해야한다.
	String password  = request.getParameter("passwd");
	
	boolean bLogin = false;
	if (userid.equals("sky")&& password.equals("1234") ) //지금 userid는 unll값인데 그래서 HTTP 500번 %안의 오류는 무조건 HTTP500번오류  
			bLogin = true;
%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% if (bLogin ) { %>
아이디 <% out.print(userid); %> <br>
암호 <%=password %> <br>
<% } else  { %>
로그인 실패
<% } %>
</body>
</html>