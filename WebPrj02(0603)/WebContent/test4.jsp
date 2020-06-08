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
	var sachic = function(e) {  //e: event -> onclick 
		console.log(e);
		var btn = e.target;   //e.getSourece()
		var v1 = parseInt(var1.value);
		var v2 = parseInt(var2.value);
		var v  = 0;
		switch(btn.id){
		case 'btnAdd' : v=v1+v2; break;
		case 'btnSub' : v=v1-v2; break;
		case 'btnMul' : v=v1*v2; break;
		case 'btnDiv' : v=v1/v2; break;
		}
		
		var result = document.getElementById('result');
		result.innerHTML = v; //앞에는 id가 와야하네 
		
	}
	
		window.onload = function() {
		//	var val1 = document.getElementById('var1');		//문서안에서 (body) 요소의 이름이 var1인것을 찾아서 값을 가져온나. 
		//	var val2 = document.getElementById('var2');
			
			var btnAdd = document.getElementById('btnAdd');
			btnAdd.onclick = sachic;
			
			var btnSub = document.getElementById('btnSub');
			btnSub.onclick = sachic;
				
			var btnSub = document.getElementById('btnMul');
			btnSub.onclick = sachic;
			
			var btnSub = document.getElementById('btnDiv');
			btnSub.onclick = sachic;
			}
	</script>
</head>
<body>
	값1 <input type="text" id ="var1" value="0"><br>
	값2 <input type="text" id ="var2" value=0><br>
	<input type="button" id="btnAdd" value="덧셈+" > 	<!-- 각각의 사칙연산 버튼을 인식해야 더 간단하게 값을 표현할 수 있는데 그래서 this를 붙여준다. 그걸 clac메소드에서 받아준다.  -->
	<input type="button" id="btnSub" value="뺼셈-" >
	<input type="button" id="btnMul" value="곱셈*" >
	<input type="button" id="btnDiv" value="나눗셈/">
	<br>
	결과<br>
	<div id = "result"></div>
</body>
</html>