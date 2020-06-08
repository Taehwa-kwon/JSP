<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
</head>
<body>
		<div id="div1"></div>
		
	<script> //setInterval( 함수, 시간 )
			// 지정된 시간(interval) 이 되면 함수를 반복 수행한다. ( 1000:1초 ) 
			var div1 = document.getElementById('div1');
			var intervalID = setInterval ( function( e ) {
				var now = new Date();
				
				div1.innerHTML = now.toLocaleString();
				div1.style.color = 'blue';
			}, 1000);
			//10초후 시계정지
			setTimeout(function() {
				clearInterval( intervalID );  //타이머 종료 
				div1.style.color = 'red';
				
			},10*1000);
	</script>
	
	<script>
		var stmt = "var number=10";
		stmt += "number = number*3.5";
		stmt += "alert(number)";
		eval(stmt);			//자바 스크립트 명령어를 실행한다. eval() : 자바 스크립트 명령어를 실행한다. 
		alert(number);
	</script>

</body>
</html>