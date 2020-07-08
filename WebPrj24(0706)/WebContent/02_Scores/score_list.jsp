<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/scores.css">

<script src ="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="./js/scores.js"></script>

<script>
   $(document).ready(
		   function(){
			   getCollege("college");
      
      
      $("#college").change(function(){
         
         var selectedValue = $("#college").val();
         getDept(selectedValue, "dept");
         $("#dept").css("display", "inline");      
         
      });
      
      $("#dept").change(function(){
         
         var selectedValue = $("#dept").val();
         getStudents(selectedValue, "student");
         $("#student").css("display", "inline");
         
      });      
      
      
   });
</script>



</head>
<body>
	<div id="wrap">
		
		<div id="search">
			<div class="scol">
				<input type="text" name="year" id="year">년 
			</div>
			<div class="scol">
				<input type="text" name="semester" id="semester">학기
			</div>
			
			<div class="scol">
				<select name="gubun" id="gubun">
					<option value="1">중간고사</option>
					<option value="2">기말고사</option>
				</select>
			</div>
			
			<div class="scol">
				<select name="college" id="college">
				
				</select>
			</div>
			<div class="scol">
				<select name="dept" id="dept">
				
				</select>
			</div>
			<div class="scol">
				<select name="student" id="student">
			
			</select>
		</div>
		<div class="scol">
			<input type="button" id="btnSearch" value="검색"/>
		</div>
	</div>
	</div>
	
</body>
</html>