<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script>
	function divDisplay( msg ){
		var div1 = document.getElementById('div1');
		div1.innerHTML = msg;
	}
		window.onload = function() {
			var person = ['유관순','김두환','이박사' ]; //배열 생성 방법 
			var msg = '';
			msg += person + '<br>'; //person배열을 전부다 한줄로 출
			for (var i = 0; i < person.length; i++) {
				msg += person[i]+'<br>'; //하나씩 하나씩 출력 
			}
				divDisplay(msg)
		}
	</script>
</head>
<body>
<%
	java.util.Date today = new java.util.Date();
	out.print(today);
%>
	<div id = "div1"></div>
	 
</body>
</html>