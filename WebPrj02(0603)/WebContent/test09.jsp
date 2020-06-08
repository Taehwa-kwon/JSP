<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script>
		window.onload = function() {
			var div1 = document.getElementById('div1');
			var msg = '';
			var str1 = "대한민국1234aBCde한글  English  12 English";
			msg += "str1: " + str1+'<br>';
			msg += '문자열 길이 : ' + str1.length+ '<br>'; 
			msg += '대문자 : ' + str1.toUpperCase() + '<br>'; 
			msg += '소문자 : ' + str1.toLowerCase() + '<br>'; 
			msg += '한글의 위치는 '+ str1.indexOf('한글') + '<br>';
			msg += '앞에서 찾을때 12의 위치 '+ str1.indexOf('12') + '<br>';
			msg += '뒤에서 찾을때 12의 위치 '+ str1.lastIndexOf('12') + '<br>';
			msg += '문자열 추출 ' + str1.substring(8,15)+ '<br>';
			msg += '문자열 추출 ' + str1.substr(7,8)+ '<br>';
			
			msg += '문자열 교체(replace)' + str1.replace( 'English','영어' );   //한번밖에 못바꾼다.
			//정규식을 이용하여 여러번 교체가능 하게 한다.
			// 정규식은 교체할 문자열 앞뒤로 슬러쉬로 /교체할 문자열/옵션 
			// g : global match (모두 바꾸기)
			// i : ignorecase
			// m : multi line 
			msg += '문자열 교체(replace)' + str1.replace (/English/gim, '영어')+ '<br>';
			
			var str2 = "HELLO wORLD";
			msg += '문자추출' + str2.charAt(6) +'<br>';
			msg += '문자코드추출' + str2.charCodeAt(6)+'<br>';
			msg += '문자추출:' + str2[6] +'<br>';//str2[6] = 'W';불가능
			var str3  = 'a_b_c_d_e_f_g';
			var str3_arr =str3.split('_');
			msg += '문자열을 배열로 ' + str3_arr +' : ' + str3_arr[3]+'<br>';
			
			
			div1.innerHTML = msg;
		}
	</script>
</head>
<body>
	<h2>문자열 조작 함수들 </h2>
	<div id = "div1"> </div>

</body>
</html>