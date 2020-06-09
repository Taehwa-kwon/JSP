<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	window.onload= function(){
		
		console.log(window);
		var msg ='';
		for (var key in window) {
			msg += key + ' : ' + window[key] +'<br>' ;
		}
		window.alert(msg);
		document.body.innerHTML = msg.replace(/\n/gim,'<br>');// 정규식  변환방법 앞뒤 / / 해주고 뒤에 gim을 붙여준다. 
		
		
	}

</script>

</head>
<body>

</body>
</html>