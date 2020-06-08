<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>


function myFunc1( value, index, array){
	return value + '&nbsp;&nbsp';
}

	window.onload = function() {
		var div1 = document.getElementById('div1');
		var msg = '';
		
		//기본출력
		var nums = [45,4,7,120,30];
		for (var i = 0; i < nums.length; i++) {
			msg += nums[i] + '&nbsp;&nbsp;';
		}
		msg += '<br />';
		
		//태화 어떻게 바로 출력할까? 
		msg += myFunc1(nums);
		
		//방법1 
		nums.forEach(myFunc1);
		function myFunc1( value, index, array){
			msg += value + '&nbsp;&nbsp;'
		}
		msg += '<br />';
		
		
		//방법2 각각의 배열 
		nums.forEach(function ( value, index, array){
			msg += value + '&nbsp;&nbsp;'
		});
		msg += '<br />';
		
		//방법3  map은 각 배열의 용도에 함수의 결과를 실행 한 후에 새로운 배열을 만든다.
		var nums2 = nums.map(function ( value, index, array){
			return value *2;
		});
		msg +=nums2 + '<br />';
		
		//방법4 
		var nums3 = nums.filter(function (value,index,array) {
			return value >40 ;
		});
		msg +=nums3 + '<br />'
		
		
		var cars = 	
			[
			{ type : 'Volvo' , year : 2016 },
			{ type : 'Saab' , year : 2001 },
			{ type : 'BMW' , year : 2010 }
			];
		//foreach 는 저기 한줄 이 값이되고 index는 0부터 시작 (0~2)
		// 첫줄 가져와서 첫줄 전체가 value, 여기에 있는 타입에 있는 글자를 꺼내서 찍고 , 그 뒤에 year을 꺼내서 찍고 
		// 그 다음으로 두번째 줄을 가져오고 
		cars.forEach (function (value, index, array)
			msg += '차종 : ' + value.type + '<br>'; 		
			msg += '출시년도 : ' + value.year + '<br>'; 		
		)};
		
		div1.innerHTML = msg;

</script>


<body>
<h1>배열 출력</h1>
<div id = "div1"></div>
</body>
</html>