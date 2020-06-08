<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		div{font-size:20px; 
			font-weight:bold;
		}
	</style>

	<script>
		function calc() { <!--     -->
			var var1 = document.getElementById('var1');
			var var2 = document.getElementById('var2');
			var x = parseInt(var1.value);
			var y = parseInt(var2.value);
			var z = x+y;
			var a = x-y;
			var b = x*y;
			var c = x/y;
			
			var result = document.getElementById('result');
			result.innerHTML = z;
			var result = document.getElementById('result2');
			result2.innerHTML = a;
			var result = document.getElementById('result3');
			result3.innerHTML = b;
			var result = document.getElementById('result4');
			result4.innerHTML = c;
		}	
	</script>
</head>
<body>
	값1 <input type="text" id ="var1" value="0"><br>
	값2 <input type="text" id ="var2" value=0><br>
	<input type="button" value="덧셈+" onclick = "calc()">
	<input type="button" value="뺼셈-" onclick = "calc()">
	<input type="button" value="곱셈*" onclick = "calc()">
	<input type="button" value="나눗셈/" onclick = "calc()">
	<div></div>
	결과 <div id = "result"></div>
	결과 <div id = "result2"></div>
	결과 <div id = "result3"></div>
	결과 <div id = "result4"></div>
	
</body>
</html>