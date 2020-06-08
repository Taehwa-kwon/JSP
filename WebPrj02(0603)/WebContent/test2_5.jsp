<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		#calcResult {
		font-size:20px;
		font-weight:bold;}
	</style>
	<script>
	function calc(sw){
		var value1 = document.getElementById('value1')
		var value2 = document.getElementById('value2')
		var x = parseInt(value1.value);
		var y = parseInt(value2.value);
		var a = x+y;
		var b = x-y;
		var c = x*y;
		var d = x/y;
		
		var result1 = document.getElementById('result1')
		
		var result2 = document.getElementById('result2')
		
		var result3 = document.getElementById('result3')
		
		var result4 = document.getElementById('result4')
		
		
		switch(sw){
		case 1: result1.innerHTML = a; break;
		case 2: result2.innerHTML = b; break;
		case 3: result3.innerHTML = c; break;
		case 4: result4.innerHTML = d; break;
		default: break;
		
		}
		
	}
	</script>

</head>


<body>	
	값 : <input type="text" id="value1" value=0>
	값 : <input type="text" id="value2" value=0>
	<input type="button" value="+" onclick="calc(1)">
	<input type="button" value="-" onclick="calc(2)">
	<input type="button" value="*" onclick="calc(3)">
	<input type="button" value="/" onclick="calc(4)">
	<div id="calcResult"></div>
	결과 <div id="result1"></div>
	결과 <div id="result2"></div>
	결과 <div id="result3"></div>
	결과 <div id="result4"></div>
</body>
</html>