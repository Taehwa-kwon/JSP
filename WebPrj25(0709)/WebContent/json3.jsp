<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>

<script>
	function aaa(obj){
		obj.name = "권";
		obj.age = 11;
		obj.print();
	}
	function exec(){
		aaa({
			name : "권태화",
			age : "1994",
			print : function(){
				alert(this.name + "는" + this.age + "년  생 입니다.");
				}
			});
	};
	
	var str = "name : smith, age:49" ; //이 문장자체가 string인데  smith를 뽑을려면 자르는 방법밖에 없잖아. 
	var str2 = "'name' : 'smith', 'age':'49'" ;
	
	
	var obj = { //객체는 이 모든걸 다 담을수 있다. 
			number : 1,
			string : '테스트',
			boolean1 : true
			}
	
	function test(){
	var objStr = JSON.stringify( obj );
	alert(objStr);
	var obj2 = JSON.parse(objStr);
	alert(obj2);
	}
</script>

<body>
	<input type="button" value="" onclick="test()"/>


</body>
</html>