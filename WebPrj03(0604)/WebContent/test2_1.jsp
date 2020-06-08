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
				//divDisplay(msg)
		
		var student = {
				num : 1,
				name : '이순신',
				tel : '010-1111-1234'
		};
		msg += '<hr/>';
		msg += '번호: ' + student.num + '<br>';
		msg += '이름: ' + student.name + '<br>';
		msg += '전화: ' + student.tel + '<br>';
		msg += '<hr/>';
		
		var fruits = ['사과','망고','바나나','오렌지','수박'];
		var fruitsId = ['Apple','mango','banana','orange','watermelon'];
		msg += '<ul>';
			for (var i = 0; i < fruits.length; i++) {
				msg += '<li>' + fruits[i] + '</li>';	
			}
		msg += '<ul>';
		msg += '<select>';
		for (var i = 0; i < fruits.length; i++) {
			msg += '<option>' + fruits[i] + '</option>';	
		}
		msg += '</select>';
		
		for (var i = 0; i < fruits.length; i++) {
			msg += '<input type="checkbox" id = " '+fruitsId[i]+' " >' ;
			msg += '<label for="'+fruitsId[i]+'">'+fruits[i]+'</label>';
		}
		
			divDisplay(msg);
		}
	</script>
</head>
<body>
	<div id = "div1"></div>
</body>
</html>

<!--  HTML은 트리형식으로 이해함 
.JSON 객체로 묶어로 배열로 처리 
	var students = [{
		firstName : 'John',
		lastname : 'Doe',
		age : 19
		},
		{
		firstName : 'John',
		lastname : 'Doe',
		age : 19
		}
		];
jsp
	var student = {
		firstName : 'John',
		lastname : 'Doe',
		age : 19
		};
xml 태그로 묶는것
<students>
	<student>
		<name>John</name>
		<age>19</age>
	</student>
</students>			
		
	var fName = s.firstName;
	
	JavaScript Object Notation : JSON	


 -->