<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생리스트</title>

<script src = "../js/students.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<link rel="stylesheet" type="text/css" href="../css/students.css">

<script>
	$(document).ready(
		function(){
			getStudentList("","","list"); //첫번쨰 자리는 이름-주소-학과 << -- 
			
			//1.검색(btnSearch)Click 이벤트
			 $("#btnSearch").click(
					 function(){
						 var v_selSearch = $("#selSearch").val()
						 var v_txtSearch = $("#txtSearch").val()
						 getStudentList(v_selSearch,v_txtSearch,"list");
				} 
			)
		}		
	)
	
</script>


</head>
<body>

   <div id = "wrap">
      <div>학생리스트</div>
     
     
      <div>
	      	검색 : 
	      	<select>
	      		<option value="stu_name">이름</option> <!-- value는 서버에 전송될값  -->
	      		<option value="stu_addr">주소</option>
	      		<option value="stu_dept">학과</option>
	      		<option value="ALL">이름+학과+주소</option>
	      	</select>
	      	
	      	<input type="text" id="txtSearch" name="txtSearch"/>
	      	<input type="button" value="검색" id="btnSearch"/>
	      	<input type="button" value="저장" id="btnSave"/>
      </div>
      
      <div id = "title" class = "title">
         <div class = "cId">아이디</div>
         <div class = "cName">이름</div>
         <div class = "cTel">연락처</div>
         <div class = "cAddr">주소</div>
         <div class = "cDept">학과</div>
      </div>
      <div id = "list">
        <!--  <div class = "list">
         <div class = "cId">아이디</div>
         <div class = "cName">이름</div>
         <div class = "cTel">연락처</div>
         <div class = "cAddr">주소</div>
         <div class = "cDept">학과</div>
         </div> -->
      </div>
   </div>
   
   
</body>
</html>