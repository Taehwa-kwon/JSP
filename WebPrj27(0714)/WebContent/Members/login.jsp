<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script>
	$(document).ready(
		function(){
			//1.event정의 
			$("#btnLogin").click(
				function(){
				
					loginFrm.submit(); //이걸로 frm을 제어 할수있고 
					
				}
			);
			
			$("#btn").click(
				function(){
					var userID = $("#userID").val();
					var userPass = $("#userPass").val();
					alert(userID+userPass);
					$.ajax(
						{
							url : "./Login",
							type :"POST",
							datatype : "JSON",
							data : "userID="+userID+"&userPass="+userPass+"&gubun=ajax",
							success :function(data){ //datas는 배열임
								alert(data.result); //Login.java의 obj.put("result",rs.getString("cnt"))를 불러온다.
								
								if(data.result=="1"){
									//로그인 성공했을때
									
								}
								else
								{
									$("#showMsg").html("로그인 실패");
								}
								
							}
							,
							error : function(){
								
							}
						}							
					);
				}		
			);
		}		
	);
</script>

<%
	boolean isSuc = (boolean)request.getAttribute("isSuc");
	String strMsg = "";
	
	if(isSuc){
		strMsg="";
	}
	else {
		strMsg="로그인 실패";
	}
%>
</head>
<body>
<form action="./Login" method="post" name="loginFrm"> <!-- 얘가 Login.java를 부름 -->
	<table width="400" cellpadding="0" cellspacing="0" align="center">
		<tr>
			<td width="100" align="center">
			아이디
			</td>
			<td width="300">
			<input type="text" name="userID" id="userID"/>
			</td>
		</tr>
		
		<tr>
			<td width="100" align="center">
			패스워드
			</td>
			<td width="300">
			<input type="passWord" name="userPass" id="userPass"/>
			</td>
		</tr>
		
		<tr>
			<td width="400" align="center" colspan="2">
			<input type="hidden" name="gubun" value="login" /> <!-- 이 값을 받아서 Login.java에서 doWork를 받는다 -->
			<input type="button" name="btnLogin" id="btnLogin" value="로그인" style="width:100px; margin-top:10px"/>
			<input type="button" name="btn" id="btn" value="ajax로그인" style="width:150px"/>
			</td>
		</tr>
		
		<tr>
			<td width="400px" align="center" colspan="2">
		</tr>
	</table>
	<div> <%=isSuc %>로그인 해주세요</div>
</form>	

</body>
</html>