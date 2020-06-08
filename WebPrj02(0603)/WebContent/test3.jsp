<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		body { font-size:24px;}
	</style>
	
	<script>
		window.onload = function() {
			var v1 = document.getElementById('var1');
			var v2 = document.getElementById('var2');
			var btnAdd = document.getElementById('var6');
			
			btnAdd.onclick = function(e) {
				console.log(e);
				var x = parseInt(v1.value);
				var y = parseInt(v2.value);
				var z = x+y;
				
				var result = document.getElementById('result');
				result.innerHTML = z;
			}
		}
	</script>
</head>
<body>
	값1 <input type="text" id ="var1" value="0"><br>
	값2 <input type="text" id ="var2" value=0><br>
	<input type="button" id="var6" value="덧셈+" > 	<!-- 각각의 사칙연산 버튼을 인식해야 더 간단하게 값을 표현할 수 있는데 그래서 this를 붙여준다. 그걸 clac메소드에서 받아준다.  -->
	<input type="button" id="var7" value="뺼셈-" >
	<input type="button" id="var8" value="곱셈*" >
	<input type="button" id="var9" value="나눗셈/">
	
	결과<br>
	<div id = "result"></div>
</body>
</html>