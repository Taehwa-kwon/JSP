<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div{ border:1px solid red;
	border-radius :20px;
	padding : 10px;
	width : 400px; 
	margin : 10px;
	float : left;
	}
</style>
	<script>
		var studs = []; //studs 는 배열인데 배열안에 객체를 밑에서 한줄씩 한줄씩 넣는거지 
		studs.push({이름 : '형호' , 국어:1, 영어:100, 수학:100}); //push 명령어를 이용해서 값을 집어넣는다.배열의 맨 마지막자리에 (스택처럼)자료를 집어넣는것 . shift 는 앞에서부터 뒤로 밀어넣는것 . 앞에는 컬럼 뒤에는 데이터 . 
		studs.push({이름 : '형호1' , 국어:2, 영어:100, 수학:100});  
		studs.push({이름 : '형호2' , 국어:3, 영어:100, 수학:100});  
		studs.push({이름 : '형호3' , 국어:4, 영어:100, 수학:100});  
		studs.push({이름 : '형호4' , 국어:5, 영어:100, 수학:100});  
		studs.push({이름 : '형호5' , 국어:6, 영어:100, 수학:100});  
		studs.push({이름 : '형호6' , 국어:7, 영어:100, 수학:100});  
		studs.push({이름 : '형호7' , 국어:8, 영어:100, 수학:100});  
		studs.push({이름 : '형호8' , 국어:9, 영어:100, 수학:100});  
		studs.push({이름 : '형호9' , 국어:10, 영어:100, 수학:100});  
		studs.push({이름 : '형호10' , 국어:0, 영어:100, 수학:100});  
		//java script plug-in 을 사용할수 있다. 
		window.onload = function (){
			
			
			//총점, 평균을 구한다.
			//총점 구하기 함수 ,, 평균 구하기 함수를 추가한다 .
			for(var i in studs){ //key 가  컬럼명: 이름,국어,영어,수학이고 studs인 값이 : 형호, 1, 100, 100 이 되는거지
				studs[i].getSum = function() { //getSum =function() 이 뜻은 getSum은 함수다
					return this.국어 + this.영어 + this.수학;
				}
	//getSum,getAvg 의 값들을 각 객체에 값을 넣는것.
				studs[i].getAvg= function(){
					return this.getSum() / 3
				}
				studs[i].toString= function(){
					var msg = '';
					msg += '<ul>';
					msg += '<li>' + this.이름 +'</li>';
					msg += '<li>' + this.국어 +'</li>';
					msg += '<li>' + this.영어 +'</li>';
					msg += '<li>' + this.수학 +'</li>';
					msg += '<li>' + this.getSum() +'</li>';
					msg += '<li>' + this.getAvg().toFixed(2) +'</li>';
					msg += '</ul>';
					return msg;
				}
				
			}  
			//출력한다. 
			var msg ='';
			for (var i in studs) {
				msg += '<div>';
				msg += studs[i].toString() ;
				msg += '</div>';
			}
			document.body.innerHTML = msg;
		};
		
	</script>
</head>
<body>

</body>
</html>