<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
	<title>Insert title here</title>
	<!-- style은 div에 대한 style이다. -->
	<style> 
	div { width :200; height: 100px;
		border :1px solid blue;
		padding : 20px;
		border-radius : true;
		margin :10px;
	}
	
	</style>
	<script>
	var array = [ '사과','바나나','망고','딸기'] //배열에 대한 괄호
	var product = { //객체에 대한 괄호 
		제품명 : '7D 건조 망고',
		유형 : '당 절임',
		성분 : '망고,설탕,메타중아황산나트륨,치자황색소',
		원산지 : '필리핀'
	};
	
	var object = {   // 중괄호 객체
			'width space' :273,
			'width ~!@#' :52
			
	};
	var obj = { //객체는 이 모든걸 다 담을수 있다. 
			number : 275,
			string : '개체 테스트',
			boolean : true,
			array:[52,273,103,32],
			method : function() {
				alert('메세지');
			}
	}
	
	
	window.onload = function () {
		var div1 = document.querySelector('div'); // 제공한 선택자 또는 선택자 뭉치와 일치하는 문서 내 첫 번째
		// querySelectorAll() 객체와 동일한 모두를 가져온다 
		var msg ='';
		msg += '제품명' + product.제품명 + '<br>';
		msg += '유형' + product.유형 + '<br>';
		msg += '성분' + product.성분 + '<br>';
		msg += '원산지' + product.원산지 + '<br>';
		
		div1.innerHTML = msg;
		
		var array1 = document.querySelector('#array') //#은 id가 array인것 
		var msg2= object[ 'width space' ] + '<br>';
		msg2 += object['width ~!@#'] +'<br>'
		
		array1.innerHTML = msg2;
		obj.method();
		
		var div3 = document.querySelector('div:nth-child(3)'); //nth 자주 사용하는 문법임 3번쨰 div에 사용할것이다.  
		console.log(div3);
		var msg3 = '<ul>';
		//방법1.for문
//		for (var i = 0; i < obj.array.length; i++) {
//			msg3 += '<li>' + obj.array[i] + '</li>';
//		}
		//방법2.forEach() 문 
		//obj.array.forEach( function(value, index, array ){ //
		obj.array.forEach( function(value, index){ 
			//msg3 += '<li>' + value + '</li>';   //2.1이걸 살리려면 function(value)
			msg3 += '<li>' + obj.array[index] + '</li>'; //2.2이걸 살리려면 function(index) 
		});
	
		
		 msg3 += '</ul>';
		div3.innerHTML = msg3;
		 //div3.innerHTML = '<H1>TESTING</H1>'
		 
		 alert(obj);
		 console.log(obj);
		 
		 
		 //JSON !!! 자바스크립트 객체는 메소드를 가질수 있지만, 메소드를 뺸 나머지가 JSON이다. 그래서 여기서는 method는 사라진다. 
		 var objStr = JSON.stringify( obj ); //객체를 문자열로 
		 alert( objStr);
		 var obj2 = JSON.parse(objStr); //문자열을 객체로 바꾸는것
		 alert(obj2)
		 console.log(obj2);
	}
	
	/*
	alert ( array )
	alert ( typeof (array));//배열의 타입인 object
	console.log(array); //객체는 Object 타입인 object
	console.log(product);
	alert ( product)
	alert ( typeof product);
	alert ( product.제품명 ); //제품명이 똑같이 나옴 
	alert ( product["제품명"]); //제품명이 똑같이 나옴 // 이 기법은 객체를 해쉬맵처럼 사용한것  //자바스크립트는 객체를 해쉬맵처럼 사용가능하다. 
													//키(key)와 값(value)를 하나의 세트로 묶어서 저장하는 컬렉션 클래스를 구현하는 데 사용
						 							//키(key) : 중복될 수 없음
													//값(value) : 중복될 수 있음.
	*/
	
	
	</script>

</head>
<body>
	<div ></div>
	<div id= "array"></div>
	<div ></div>
</body>
</html>