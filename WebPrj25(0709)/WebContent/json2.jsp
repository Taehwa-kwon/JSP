<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script>


var students=[];
var genders=[];

	students[0] = '박';
	students[1] = '김';
	students[2] = '권';

	genders[0]= "m";
	genders[1]= "b";
	genders[2]= "c";


	for (var i = 0; i < students.length; i++) {
		
	}
	var student1 = {name:"a",score: "", gender : ""};
	var student2 = {name:"b",score: "", gender : ""};
	var student3 = {name:"c",score: "", gender : ""};
	
	var students = [];
	students[0] = {name:"a",score: "", gender : ""};
	students[1] = {name:"b",score: "", gender : ""};
	students[2] = {name:"c",score: "", gender : ""};
	
	var students2 = [    //테이블은 필드와 속성밖에 없다. + function도 사실 가능함, ajax에서 success:function
		{name:"a",score: "", gender : ""},
		{name:"b",score: "", gender : ""},
		{name:"c",score: "", gender : ""}
	];
	
	var professors =[
		{ name : "", depart: ""},
		{ name : "", depart: ""},
		{ name : "", depart: ""}
		
	];
	
	var cup={
			width :15,
			height : 22,
			make :function(i){
				alert(i);
			}
	}
	
	cup.make();
	
	cup.make(3);
	
	

</script>

<body>



</body>
</html>