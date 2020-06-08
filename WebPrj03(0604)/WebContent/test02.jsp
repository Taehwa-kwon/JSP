<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script>
	var fruits = ['사과','망고','바나나','오렌지','수박'];
	var fruitsId = ['Apple','mango','banana','orange','watermelon'];
	
	  
	function checkAll(sw){
		//console.dir(sw);
		//console.log(chkBox);
		for (var i = 0; i < fruits.length; i++) {
			var chkBox =  document.getElementById(fruitsId[i]);
			chkBox.checked = sw;
		}
		
	}
	
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
				divDisplay(msg)
		
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
		
		//var fruits = ['사과','망고','바나나','오렌지','수박'];
		//var fruitsId = ['Apple','mango','banana','orange','watermelon'];
		
		msg += '<ul>';
			for (var i = 0; i < fruits.length; i++) {
				msg += '<li>' + fruits[i] + '</li>';	
			}
		msg += '</ul>';
		
		msg += '<select>';
		for (var i = 0; i < fruits.length; i++) {
			msg += '<option>' + fruits[i] + '</option>';	
		}
		msg += '</select>';
		
		
		for (var i = 0; i < fruits.length; i++) {
		msg += '<input type="checkBox" id = "'+fruitsId[i]+ '"/>';
		msg += '<label for="' + fruitsId[i] + '">' + fruits[i] + '</label>';
	      }
		
		
		
		msg += '<hr>';
		msg += '<ul>';
		fruits.forEach(function (value) {
			msg += '<li>' + value + '</li>';
		});
		msg += '</ul>';
		
		
		var prod = ['사과','바나나','딸기'];
		msg += prod + '<br>';
		prod.push('오렌지');
		msg += prod + '<br>';
		var f = prod.pop();
		msg += f 		+ '<br>';
		msg += prod		+ '<br>';
		msg += prod.length	+ '<br>';
		prod[999] = '두리안'; //배열사이즈는 마지막 첨자의 크기 
		msg += prod.length + '<br>';
		
		var nums = [ 10, 8, 23, 5, 4, 238 ];
		msg += '정렬전 : ' + nums + '<br>';
		nums.sort();
		msg += '정렬후(문자): ' +nums + '<br>' ;
		
		nums.sort(function(a,b){return a-b;});
		msg += '정렬후(문자): ' +nums + '<br>' ;
		
		var nums2 = [ 10, 8, 23, 5, 4, 238 ];		//이렇게 새롭게 안하면 앞에 있던것이 저장되어서 뒤죽박죽이 되네 ?
		msg += '정렬전 : ' + nums2 + '<br>';
		nums2.sort(function(a,b){return a-b; });
		msg += '정렬후(숫자): ' +nums2 + '<br>' ;
		
		var nums3 = [ 10, 8, 23, 5, 4, 238 ];
		msg += '정렬전 : ' + nums3 + '<br>';
		nums3.sort(function(a,b){return b-a; });
		msg += '정렬후(숫자): ' +nums3 + '<br>' ;
		
		
		
			divDisplay(msg);
		}
	</script>
</head>
<body>
	<div id = "div1"></div>
	
	<button onclick="checkAll(true)">전체선택</button>
  	<button onclick="checkAll(false)">전체선택해제</button>
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