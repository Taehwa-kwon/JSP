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
		function sachic(v1,v2,op){
			var v =0;
			switch(op){
			case "덧셈+" : v=v1+v2; break;
			case "뺼셈-" : v=v1-v2; break;
			case "곱셈*" : v=v1*v2; break;
			case "나눗셈/" : v=v1/v2; break; 
			
			}
			return v;
		}
		
	/* 	<!-- 이 매개변수로 받아줌   --> */
		function calc(btn) { 
			console.log(this)
			var var1 = document.getElementById('var1');
			var var2 = document.getElementById('var2');
			var x = parseInt(var1.value);
			var y = parseInt(var2.value);
			var op = btn.value;
			
			var z = sachic(x,y,op);
			
			var result = document.getElementById('result');
			result.innerHTML = z;
		}	
	</script>
</head>
<body>
	<h1>DOM : Document Object Method </h1>
	<h1>BOM : Browser Object Method </h1>
	값1 <input type="text" id ="var1" value="0"><br>
	값2 <input type="text" id ="var2" value=0><br>
	<input type="button"  value="덧셈+" onclick = "calc(this)"> 	
	<!-- 각각의 사칙연산 버튼을 인식해야 더 간단하게 값을 표현할 수 있는데 중복제거중복제거 
	 그래서 this를 붙여준다. 그걸 clac메소드에서 받아준다.  onclick의 역할이 이벤트 받는다 . -->
	<!-- 
	<input type="button" id="var6(this)" value="덧셈+" onclick = "calc(this)"> id는 input의 닉네임같은 역할이네 그래서 this가 못들어감 
	다른 방법이 있는데 그건 test3 참고 -->   
	<input type="button" value="뺼셈-" onclick = "calc(this)">
	<input type="button" value="곱셈*" onclick = "calc(this)">
	<input type="button" value="나눗셈/" onclick = "calc(this)">
	<div></div>
	결과 <div id = "result"></div>
	
</body>
</html>