<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script>
		window.onload = function(){
			var div1 = document.getElementById('div1');
			var msg ='';
			
			var today = new Date();
			msg  = '<ul>';
			
			msg += '<li>' + "오늘 날짜 : " + today +  '</li>';
			msg += '<li>' + "오늘 날짜 : " + today.toLocaleString() +  '</li>';
			msg += '<li>' + "연도 : " + today.getYear() +  '</li>';
			msg += '<li>' + " 월 : " + (today.getMonth()+1) +  '</li>';
			msg += '<li>' + " 일 : " + today.getDate() +  '</li>';
			msg += '<li>' + " 요일 : " + today.getDay() +  '</li>';
			msg += '<li>' + " 시간 : " + today.getHours() +  '</li>';
			msg += '<li>' + " 분 : " + today.getMinutes() +  '</li>';
			msg += '<li>' + " 초 : " + today.getSeconds() +  '</li>';
			msg += '<li>' + " 초(밀리) : " + today.getMilliseconds() +  '</li>';

			//set함수 (12월 25일 세팅 )
			var Xmas = new Date (2020, 11, 25);
			msg += '<li>' + " Xmas : " + Xmas.toLocaleString() +  '</li>';
			
			Xmas.setDate(1);
			msg += '<li>' + " Xmas : " + Xmas.toLocaleString() +  '</li>';
			
			//
			var t1 = today.getTime();
			for (var i = 0; i < 100; i++) {
				var sum = i*1.5*12.4/3.0+2.7;
			}
			var t2 = today.getTime();
			msg += '<li>' + " 경과시간  : " + (t2-t1) +  'ms</li>';
			
			msg += '</ul>'
			div1.innerHTML = msg;
			
		}
	</script>

</head>
<body>
<h2>시간 함수들 </h2>
<div id = "div1"></div>
</body>
</html>