<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script>//객체를 function안에서 만드는거랑 밖에서 만드는 것과의 차이는 전역변수
	var cars = 
		[
		{ type : 'Volvo' , year : 2016 },
		{ type : 'Saab' , year : 2001 },
		{ type : 'BMW' , year : 2010 }
		];
	
	function displayObjs(arr){
		var output = '';
		for(var i=0; i<arr.length; i++){
			
			output += arr[i].type + ',' + arr[i].year;
			output += '<br />';
		}
		output+= '<hr/>'
		return output;		
		
	}
	var descYear = function (a,b) { return b.year - a.year; }
	// 		var ascType = function (a,b) { return b.year - a.year; }    //작동안함 
	var ascType = function (a,b) { 
		var x = a.type.toLowerCase(); 
		var y = b.type.toLowerCase();
		if( x< y ) return -1;
		if( x> y ) return 1;
		return 0;
	}
	
	window.onload = function(){
		var div1 = document.getElementById('div1');
		console.log(cars);
		var msg = displayObjs(cars);
		//방법1
		cars.sort(function (a,b) {return a.year - b.year; });
		//방법2
		cars.sort(descYear);
		msg += displayObjs(cars);
		
		cars.sort(ascType);
		msg += displayObjs(cars);
		
		div1.innerHTML = msg;
	};
	</script>
</head>
<body>
	<div id = "div1"> </div>
</body>
</html>