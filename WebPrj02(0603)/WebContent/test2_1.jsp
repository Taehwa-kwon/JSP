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
		function calc() { <!--   이렇게 하면 숫자를 계산하지 않고 문자열 더하기를 해버린다. 이유는 아래 body에 "" 로 묶어둬서 문자열 취급받음+input type이 text다 . -->
			var var1 = document.getElementById('var1');
			var var2 = document.getElementById('var2');
			var x = var1.value;
			var y = var2.value;
			var z = x+y;
			
			var result = document.getElementById('result');
			result.innerHTML = z;
		}	
	</script>
</head>
<body>
	값1 <input type="text" id ="var1" value="0"><br>
	값2 <input type="text" id ="var2" value="0"><br>
	<input type="button" value="계산+" onclick = "calc()">

	결과 <div id = "result"></div>

</body>
</html>