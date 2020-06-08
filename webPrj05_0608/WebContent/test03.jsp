<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var student = {}; //특이하네..
	student.이름 = "형호"; //이렇게 해서 만들수가 있네?
	student.취미 = '악기다루기';
	student.특기 = '프로그래밍';
	student.장래희망 = 'sw아키텍처';
	student.toString = function(){ //재귀함수 : 함수안에서 함수 자신을 호출하는 방식 
		var msg ='';
		for (var key in student){ //student에 있는 값을 key에 넣는다. 속성의 이름이 key 고  value는 student가 되는거지 
			if(key != 'toString') {
				msg += key + ':' + student[key] + '<br>'; 
			}
		}
		return msg; //for문이 빠져나갔을때 값들이 사라지니깐 toString을 쓰려고 하면 return 을 붙여줘야한다.  
	};
	
	console.log(student);
	alert(student.toString());
	delete(student.특기)
	alert(student.toString());
</script>
</head>
<body>

</body>
</html>