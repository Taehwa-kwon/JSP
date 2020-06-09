<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	window.onload = function(){
	
	console.log(window);
	var msg = '';
	for (var key in window) {
		msg += key + ' : '+ window[key] +'\n';
	}
	//document.body.innerHTML = msg.replace('\n','<br>'); 
	//자바스크립트는 replace는 한개밖에 안바꾸고 , 한 라인당 한개의 enter가 있는데 그것을 모두 정규식 ( /  /gim인 형식으로  변환한다. 
	window.alert(msg)
	document.body.innerHTML = msg.replace(/\n/gim,'<br>');
	}
</script>
</head>
<body>

</body>
</html>