<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
		var temp=[];		//배열
		var subjects =[];
		var sendDatas = {};  //객체
			$(document).ready(
				function(){
					
					var data={"name" : "123", "age":"32"};
					data.gender="남자";
					alert(JSON.stringify(data));
					
					var data2 = {"name" : "123", "age":"32","gender":"남자"};
					alert(JSON.stringify(data2));
					/* 이거 두개가 현재 같다. 이게 가능한 이유는 */
					
					temp.push(data)
					temp.push(data2)
					
					alert(JSON.stringify(temp));
					
					var subject={};
					subject.sub_id = "sub01";
					subject.sub_name = "중국어";
					
					subjects.push(subject);
					
					var subject2={"sub_id" : "sub02", "sub_name":"수학"};
					subjects.push(subject2);
					
					alert(JSON.stringify(subjects));
					
					
					//Q. temp랑 subjects의 객체를 한번에 어떻게 DB로 넘길수 있냐 ?
/*
[{"name":"123","age":"32","gender":"남자"},{"name":"123","age":"32","gender":"남자"}]   이건 TEMP에 있고
[{"sub_id":"sub01","sub_name":"중국어"},{"sub_id":"sub02","sub_name":"수학"}]			  이건 subject에 있다.
*/				
					sendDatas.temp = temp;
					sendDatas.subjects=subjects;
					
					//Q. 답
					
/*

 {
	
 temp : 
	 
[{"name":"123","age":"32","gender":"남자"},{"name":"123","age":"32","gender":"남자"}]  

subjects :
	
[{"sub_id":"sub01","sub_name":"중국어"},{"sub_id":"sub02","sub_name":"수학"}]	

 }
 
*/				
				}
			)

</script>
</head>
<body>
	

</body>
</html>