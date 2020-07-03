<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
	function windowOpen(){
			var txt= $("#txt").val();
		var newWindow = window.open('./newWin.jsp?txt='+txt,'windoooow','width=300; height=300;'); //newWin.jsp는 이미 서버에 있으니깐 서버와 통신을 진행해야한다..
		//window.open()함수 
	}
</script>

</head>
<body>
	<input type = "text" id="txt" />
	<br/>
	<a href="javascript:windowOpen()">나를 눌러러아아</a> <!-- 이걸 누르면서 서버로 간다 -->
	<span id="bbb"></span>
	

</body>
</html>