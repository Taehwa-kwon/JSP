<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script>
	
		var str = "c:\\aaa\\bbb\\ccc\\ddegdd\\a.txt"; //split, substr , 
		
		var i =str.lastIndexOf("\\");
		var fileName = str.substr(i+1);
		
		var str2 = "123#45678#90";
		
		str2.indexOf("#");
		
		var index = str2.lastIndexOf("#");
		
		//var result = str2.substr(10,2);
		var result = str2.substr(index+1);
		var result = str2.substr(index+1,2);
		
		alert(fileName)
	</script>



</head>
<body>

</body>
</html>