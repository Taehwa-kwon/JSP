<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생등록폼</title>

<script src ="https://code.jquery.com/jquery-3.5.0.js"></script>

<script src="../js/students.js"></script> <!-- js파일을 가져오기 -->

<script>
	$(document).ready(
		function(){
			
			getSido(); //students.js에서 불러오는것
			
			$("#sido").change(
				function(){
					getGugun();
				}		
			)
			$("#dong").change(
				function(){
					getDong();
				}		
			)
		}
		
	)
	
			
	
</script>

</head>
<body>
	<div id="wrap">
		<div>
			학생등록		
		</div>
		<div>
			<div>학생이름</div>
			<div>
				<input type="text" id="stu_id" name="stu_id"/>
			</div>
		</div>

		<div>
			<div>학생주소</div>
			<div>
				<span>
				<select id="sido">
					
				</select>
				</span>
				<span id="gugun"></span>
				
				<span id="dong"></span>
				
				<span></span>
				
			</div>
		</div>
		
	</div>
</body>
</html>