<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
		<title>Insert title here</title>

		<style>
			ul,li{padding:0; margind:0;}
			li{list_style-type:none; padding:0; margind:0; }/*  li앞에 동그라미 지우기*/ 
		</style>
		
		<script>
		
		var questions = ['다음중 자바 연산자가 아닌 것은?','다음주 C언어 연산자가 아닌 것은?']; //7.
		var answerList = [
			{ ans : '+' , name : 'a1'},
			{ ans : '**' , name : 'a1'},
			{ ans : '~' , name : 'a1'},
			{ ans : '!' , name : 'a1'}
		,
			{ ans : '+' , name : 'a2'},
			{ ans : '**' , name : 'a2'},
			{ ans : '~' , name : 'a2'},
			{ ans : '!' , name : 'a2'}
			]
		//8.
		
		function makeExam(){ //5.함수시작 
			var exam = ''; 
		
			for (var i = 0; i < questions.length; i++) { //6.questions를 함수로 빼고 배열을 따로 만들어서 반복문 실행해서 출력한다. 
				exam +='<h3>'+'Q.'+(i+1)+questions[i] +'</h3>'; //exam += 이렇게 하는 이유가 exam에 전부다 담아놓으려고 하는거지 
				var answer = answerList[i]; 
				exam += '<ui>'
			}
		}
		
			window.onload = function(){ //2.
				var exam = document.getElementById('exams'); //4.exams에서 가져왔는데 아직 변수 exam은 안썻지 
				exams.innerHTML = makeExam(); //3. 4.makeExam()을 함수로 따로 뺀다.
			}
		</script>
</head>
<body>
<div id = "exams"></div>		<!-- 1. -->
	<h1>정보처리기사 시험문제</h1>
	<div >
		<h3 class="Q1" > Q1. 다음 중 자바연산자가 아닌 것은 ? </h3>
			<ul>
				<li> <!-- label for은 몸통만 클릭해도 연동되게 하는 것  -->
					<input type="radio" name="A1" value="A1_1" id="A1_1">
					<label for="A1_1"> + </label>	
				</li>
				<li>
					<label ><input type="radio">** </label> 
					<!-- 이렇게 해도 간단하게 됌  -->
					<!-- 하지만 단점은 중복이 안되니깐 ..  -->
				</li>
				<li>
					<input type="radio" name="A1" value="A1_1" id="A1_3">
					<label for="A1_3"> ~ </label>	
				</li>
				<li>
					<input type="radio" name="A1" value="A1_1" id="A1_4">
					<label for="A1_4"> !</label>	
				</li>
				
				
			</ul>
	</div>
	<input type = "button" value ="제출" />
</body>
</html>