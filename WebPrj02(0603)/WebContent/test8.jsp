<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script>
		var won = '1000원';
		val dollar = '1.5$';
		var dollar2 = '$18.6';
		
		alert( Number(won) + ':' + Number(dollar)); 			//NaN : NaN
		alert( parseInt(won) + ':' + parseInt(dollar));			//1000:1
		alert( parseFloat(won) + ':' + parseFloat(dollar));		//1000:1.5
		alert( Number(dollar2) + ':' + parseFloat(dollar2));	//NaN : NaN
	</script>
</head>
<body>
	<script>
		const multiply = (a,b) => a* b;
		alert( multiply(1,2) );
		alert( multiply(3,4) );
		
	</script>

</body>
</html>