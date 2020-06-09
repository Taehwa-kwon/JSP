<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<body>
	<h1>페이지 이동</h1>
	<pre> <!-- 여기에 적는 대로 화면에 구성됌 , enter때문에 생겨남  -->
	html 페이지 이동방법 (+데이터 이동)
	이름,전화번호를 전송
	
	html 페이지 이동방법
1. get방식
	&lt; a href=''&gt;&lt;/a&gt;

<!-- 특수문자 &gt; / &li; / &nbsp;
- &nbsp; : 띄어쓰기를 여러 번 시행할 때 사용
- &lt; : <를 쓰고 싶을 때 사용
- &gt; : >를 쓰고 싶을 때 사용 -->

<!-- GET방식은 URL에 데이터를 붙여서 보내는 반면, POST방식은 URL에 붙여서 보내지 않고
BODY에다가 데이터를 넣어서 보낸다.   -->

2. get/post방식 
	&lt; form action=""&gt;
	&lt; input type="submit"&gt;
	&lt; input type="image"&gt;
	&lt; button&gt;&lt;/button&gt;
	&lt;/form&gt;

3.javascript	: 페이지이동역할 (get방식의 페이지이동)
	location.href='';

4.javascript	: submit버튼을 구현 (get/post방식의 페이지 이동가능) 
	document.forms[0].submit();
	</pre>
	
	
	<h2> 1. a tag를 사용한 페이지 이동</h2>	<!-- a태그는  ??뒤에 내용전달할꺼 & 추가  -->
	<div id = "div1"></div>									
	<a href= "http://localhost:9090/webPrj06_0609/test03_proc.jsp?name=aaa&tel=010-1234-5678">서버로 입력하시오</a> <!-- 여기서 test03_proc로 연결되네  --> 
	<!-- 장점은 빠르다. 포장을 안해도 되니깐 .단점은 get방식은 주소줄에서 모든 내용이 다 표시된다.. 그럼 보안상의 우려가 분명히 존재한다.  -->
	
	
	<h2> 2. form tag를 이용한 페이지 이동</h2>	<!--  FORM태그  get방식은 한글이 넘어가는데 나머지 post, get+post 합친 부분은 안넘어간다. -->
	<form action = "http://localhost:9090/webPrj06_0609/test03_proc.jsp" method = "GET">  <!-- chrome는 어느정도 융통성을 발휘해서 한글을 받아서 다시 전환시킨다.  -->
	<input type="text" name ="name" value="aaa">
	<input type="text" name ="tel" value="010-1234-5678">
	<input type="submit" value="서버로 이동">
	</form>
	<form action = "http://localhost:9090/webPrj06_0609/test03_proc.jsp" method = "POST"> <!-- 내부적으로 한글을 변환시켜서 보내는데  받을려면 다시 변환해야지  utf-8방식으로 받을수 있다. -->
	<input type="text" name ="name" value="aaa">												<!-- request.setCharacterEncoding("utf-8"); 추가 -->
	<input type="text" name ="tel" value="010-1234-5678">
	<input type="submit" value="서버로 이동">
	</form>
	
	<!-- form태그는 사실 get/post방식 둘다 가능하다 . -->
	<form action = "http://localhost:9090/webPrj06_0609/test03_proc.jsp?email=aaa@bbb.com" method = "POST">  
	<input type="text" name ="name" value="한글">
	<input type="text" name ="tel" value="010-1234-5678">
	<input type="submit" value="서버로 이동">
	</form>
	
	<h2>3. javascript get전송 방식 </h2>
	<input type="button" onclick="send()">
	<script>
		function send(){
		//클릭안해도 되는 a태그 버전 .
			location.href= 'http://localhost:9090/webPrj06_0609/test03_proc.jsp?name=aaa&tel=010-1234-5678'
		}
	</script>
	<h2>4. javascript get/post 전송 방식 </h2>
	<form method = "POST">
		<input type ="text" name="name" />
		<input type ="text" name="tel" />
		<input type ="text" name="email" />
		<input type="button" value="click2" onclick='send2()'>
	</form>
	<script>
		function send2(){
			//document.forms[0].submit(); //예전식 코딩 , 도큐멘트 > 폼태그 > 엘리먼트 > value 
			//document.querySelector('form').submit(); //최신식 코딩 .. 이렇게하면 첫번째꺼 값이 전달됌 
			var myform = document.querySelectorAll('form')[3] //form중에 4번쨰를 가져오고 
			myform.action= 'http://localhost:9090/webPrj06_0609/test03_proc.jsp';
			myform.submit();
		}
	</script>
	
	
</body>
</html>