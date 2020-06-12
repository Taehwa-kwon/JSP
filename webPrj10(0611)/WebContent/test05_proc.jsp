<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String favoriteNumber = request.getParameter("fruit"); //요청 getParameter 리턴값은 무조건 String //Form 태그에 버튼을 누르면 HTTP요청에 의해 Form 내용이 함께 끼워져서 서버로 날라간다. 그 form내용이 바로 HTTP 요청의 파라멘터가 된다. 
	//원래는 form태그 안에 input type="text" id="" << 이 아이디를 기준으로 가져와야하는데 test05에서 이미 그 작업을 했기때문에 F12로 확인가능 
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
