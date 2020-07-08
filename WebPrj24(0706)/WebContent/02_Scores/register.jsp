<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>

</style>

<script src ="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="./js/scores.js"></script>
<link rel="stylesheet" type="text/css" href="./css/scores.css">

<script>
	$(document).ready(
		function(){
			
			getYear("year")
			getCollege("college");
			
			
			$("#college").change(
				function(){
					
					var selectedValue = $("#college").val();
					getDept(selectedValue,"dept");
					$("#dept").css("display","inline");
					
				}	
			);
			
			$("#dept").change(
				function(){
					var selectedValue = $("#dept").val();
					getStudents(selectedValue,"student");
					$("#student").css("display","inline");
					
				}
			);
			
			$("#student").change(
				function(){
					
					var stu_id= $("#student").val();
					var syear = $("#year").val();
					var semester = $("#semester").val();
			
					
					getSubjects(stu_id,syear,semester,"subject"); //학생id와 선택된year, 선택된 학기, 과목을 DB에 넘겨줘서 db에서 쿼리를 짠다.
					
				}		
			);
			
			$("#btnSave").click(
				function(){
					frm.submit();
					alert("why are you so serious?");
				}		
			)
			
			
		}	//ready function		
		
	)//ready 
</script>

<title>학생성적 조회</title>

</head>
<body>
	<form action='./register_ok.jsp' method="post" id="frm" name="frm">
	<table border="1" width="90%" height="10%" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td width="30%">학생이름</td>
			<td width="70%">
				<select id="college" name="college"></select>
				<select id="dept" name="dept"></select>
				<select id="student" name="student"></select>
			
			
			</td>
		</tr> 
		
		<tr>
			<td width="30%">시험학기</td>
			<td width="70%">
				<select id="year" name="year">
				</select>
				년
				
				<select id="semester" name="semester">
					<option value="1">1</option>
					<option value="2">2</option>
				</select>
				학기
				&nbsp&nbsp&nbsp
				<select id="gubun" name="gubun">
					<option value="1">중간고사</option>
					<option value="2">기말고사</option>
				</select>
			</td>
		</tr>
		
		<tr>
			<td width="30%">시험과목</td>
			<td width="70%">
				<select id="subject" name="subject"></select>
			</td>
		</tr> 
		<tr>
			<td width="30%">시험점수</td>
			<td width="70%">
				<input type="text" id="score" name="score"/>
			</td>
		</tr> 
		<tr>
			<td width="30%">시험날짜</td>
			<td width="70%">
				<input type="text" id="examdate" name="examdate"/>
			</td>
		</tr> 
		<tr>
			<td width="100%" colspan="2" align="center">
				<input type="button" id="btnSave" name="btnSave" value="확인">
			</td>
		</tr>
		
		
	</table>
	</form>
</body>
</html>