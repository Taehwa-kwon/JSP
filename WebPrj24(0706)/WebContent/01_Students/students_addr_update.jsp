<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	String str = request.getParameter("comIDs");
    	//out.println(str);
    	
    	String[] strComIDs = str.split("-");
    	
    	//out.println(strComIDs.length);
    	
    	
    %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "./js/students.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>

<script>
	$(document).ready(
		function(){
			/*		학생 주소 		*/
			getAddr("","1","sido");
			
			$("#addr1").val("<%=strComIDs[1]%>");
			
			$("#sido").change(
				function(){
					$("#gugun").html("");
					$("#dong").html("");
					$("#dong2").html("");
					getAddr($("#addr1").val(),2,"gugun");
				
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
		}		
	)
</script>

</head>
<body>
					<span id="sido"> </span>
					<span id="gugun"></span>
					<span id="dong"></span>
					<span id="dong2"></span>

</body>
</html>