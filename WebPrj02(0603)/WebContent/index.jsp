<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script><!--개인컴퓨터의 시간  -->

window.onload = function() { // onload의 뜻은 자바스크립트가 문서가 준비된 상황 이후에 발동 (대괄호 주의 )
var today = new Date(); 
var msg = '클라이언트 시간 ' + today.toLocaleString();

//alert(msg);

var div1 = document.getElementById('div1');//여기서 맨뒤에 div1을 실행하고 찾으려고 하는데 없잖아.. div1은 맨밑에 있으니깐 불가능  그래서 window.onload = function() 이걸 추가해준다. 
div1.innerHTML = msg;
}
</script>

</head>

<body>
	<h1>hello</h1>
	<!--서버의 시간 --> 
	<%
	java.util.Date today = new java.util.Date();
	out.print(today.toLocaleString());
	%>
	<div id = "div1"></div>
	<div id = "div2"></div>
	<script>
	var div2= document.getElementById('div2');
	div2.innerHTML = '<h2>안녕하세요</h2>';
	</script>
	
</body>
</html>