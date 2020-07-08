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
			
			getAddr("","1","sido");//COM_ID/COM_LVL/<span id=sido>
			
			/* $("#addr1").change( 			//이 페이지가 로딩될때 id 값이 없으니깐 안된대.
				function(){
					getAddr($("#addr1").val(),"2","gugun") //students.js 에 getAddr의 strHTML
				}		
			) */
			
			/*		학생 주소 		*/
			$("#sido").change(
				function(){
				 	$("#gugun").html("");
					$("#dong").html("");
					$("#dong2").html(""); 
					getAddr($("#addr1").val() ,2, "gugun");
					//COM_ID0001, COM_LVL, <span id=gugun>
				}		
			);
			
			$("#gugun").change(
					function(){
						$("#dong").html("");
						$("#dong2").html("");
						getAddr($("#addr2").val(),3,"dong");
					
					}		
				);
			$("#dong").change(
					function(){
						$("#dong2").html("");
						getAddr($("#addr3").val(),4,"dong2");
					
					}		
				);
			/*		학생 주소  끝		*/
			
			
			/*		학생 학과 시작 		*/
			
			getDept("","1","college");
			
			$("#college").change(
					function(){
						$("#dept").html("");
						//getDept($("#dept1").val(),2,"dept")
						getDept($("#college").val(),2,"dept")
						
					})
			
			/*		학생 학과 끝 		*/
			
			
			
		}//function
		
	);//ready()
	
			
	
</script>

</head>
<body>
	<div id="wrap">
		<form action="register_ok.jsp" method="post">
			<div>
				학생등록	(회원등록시 현재 DB에 NOU Null 제약조건이 있어서 꼭 다 입력해야함)	
			</div>
			<div>
				<div>학생이름</div>
				<div>
					<input type="text" id="stu_name" name="stu_name"/>
				</div>
			</div>
	
			<div>
				<div>학생주소</div>
				<div>
					<span id="sido"> </span>
					<span id="gugun"></span>
					<span id="dong"></span>
					<span id="dong2"></span>
				</div>
			</div>
			
			<div>
				<div>학생학과</div>
				<div>
					<span id="college"></span>
					<span id="dept"></span>
				</div>
			</div>
			
			<div>
				<div>학생연락처</div>
				<div>
					<input type="text" id="tel" name="tel11">
				</div>
			</div>
			
			<div>
				<input type="submit" value="확인" id="btnSubmit"/>
			</div>
			
		</form>	
	</div>
</body>
</html>