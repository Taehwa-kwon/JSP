<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function winopen(){
	var html = 'http://www.naver.com';
	var name = '';
	var features = 'height=400, width=400';
	//var child = window.open(html,name,features); //새창 띄우기
	var child = window.open('',name,features); //새창 띄우기
	if ( child ) {
		var newhtml = '<h1> 주소 찾기 </h1>';
		newhtml += '<input type="text" name="dong"></input>'
		child.document.write(newhtml);
		} else {
			alert('팝업차단을 해제해주세요');
		}
	}
</script>
</head>
<body>
<button onclick="winopen()">button window open</button>
<input type ="button" onclick="location.href='http://www.naver.com'" value="(href)네이버로 가기 "> <!-- 새창띄우기메소드 -->
<input type ="button" onclick="document.URL='http://www.naver.com'" value="(url)네이버로 가기 "> <!-- 새창띄우기메소드 -->
<input type ="button" onclick="location.assign('http://www.naver.com')" value="(assign)네이버로 가기 "> <!-- 새창띄우기메소드 -->
<input type ="button" onclick="history.back()" value="뒤로 가기 ">
<input type ="button" onclick="history.go(+1)" value="앞으로 가기 ">

	
</body>
</html>