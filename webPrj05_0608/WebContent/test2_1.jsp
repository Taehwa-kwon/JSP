<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var msg ='';
	var student = {
			이름: '이영효',
			국어: 92, 수학:90, 영어:96, 과학:90};
	
	
	msg += "'이름: '" + ('이름' in student) + '\n';
	msg += "'성별: '" + ('성별' in student) + '\n';
	alert(msg);
	//student 클래스(객체)안에 이러한 내용이 있는지 확인하기 위함.. 
	


</script>

</head>
<body>

</body>
</html>