<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생리스트</title>

<script src = "./js/students.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>

<link rel="stylesheet" type="text/css" href="./css/students.css">


<script>
	$(document).ready(
		function(){
			getStudentList("","","list"); //첫번쨰 자리는 이름-주소-학과  그 selectbox를 말함 << -- 
			
			//1.검색(btnSearch)Click 이벤트
			 $("#btnSearch").click(
					 function(){
						 var v_selSearch = $("#selSearch").val()
						 var v_txtSearch = $("#txtSearch").val()
						 getStudentList(v_selSearch,v_txtSearch,"list");
				} 
			);
			
			//2.체크박스 이벤트
			$("#chk").click( 
				function(){
					
					//if($(this).checked) { //jquery는 무조건 메소드만 사용가능 속성은 사용불가
				
					/*  if($(this).is(":checked")){  //.is 는 체크여부 확인 
						alert(1);
					}
					else{
						alert(2);	
					}  */
					//}
					 if($(this).prop("checked")){     //.prop는 checked 처리
						checkedFunc(1);
						}
					
					else{
						checkedFunc(2);	
							} 
				}		
			) //chk Click
			
			
			$("#btnDel").click(
				function(){
					delStudent();
				}		
			);
			
			$("#btnUpdate").click(
				function(){
					
					var chkVal = $("input[type='checkbox']:checked").val(); //수정은 하나만 선택해서 수정이 가능해야하지.
					
					UpdateStudent(chkVal); //체크된값을 가져가야한다.
				}		
			
			)
			
			
		
			
			
		}//function	
	)//ready
	
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
	      	<input type="button" value="삭제" id="btnDel"/>
	      	<input type="button" value="수정" id="btnUpdate"/>
      </div>
      
      <div id = "title" class = "title">
         <div class = "cchk"><input type="checkbox" id="chk" name="chk" value="true"/> </div>
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