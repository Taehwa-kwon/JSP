<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>

<script src ="https://code.jquery.com/jquery-3.5.0.js"></script>
	
	<%
	String reqMsg = request.getParameter("msg"); //=이 붙으면 출력
	%>
	
<script>
		if("<%=reqMsg%>" == "fail"){
			alert("아이디 또는 패스워드가 틀렸습니다.")
		}
	

</script>

<script>
	$(document).ready(
		function(){
			//1.첫번째 이벤트 작성 btnLogin
			$("#btnLogin").click(
				function(){
					loginOK();
					
				}		
			)
			//2.두번째 이벤트 btnCheck
			$("#btnCheck").click(
				function(){
					//기존방식
					//location.href="loginCheck.jsp?id=" + $("#userID").val(); 아이디를 url로 넘겨주는거지 
					
					//ajon방식
					$.ajax({
						url:"./loginCheck.jsp",
						type: "get", //get 비밀  //post는 박스
						datatype:"json",
						data:"userID="+$("#userID").val(),
						success:function(datas){ //여기서 datas 는 
							var result = datas[0].CNT
							if(result=="1"){
								//중복되었다
								$("#chkMsg").html("중복되어서 사용불가능");
							}
							else{
								$("#chkMsg").html(" 사용 가능");	
							}
						}
						,
						error : function(err){
							alert(2);
						}
						
							
					}); //중괄호는 객체. 객체안에는 모두 json형태로 함.
					
				}		
			)
			var loginOK = function(){
				//1.아이디가 입력되었는지 확인
				var idVal = $("#userID").val();
				
				if(idVal.length < 4 ){
					alert("아이디를 정확하게 입력하시오");
					return; //로그인버튼이 input type버튼이니깐 return으로 처리가능
				}
				var pwdVal = $("#userPass").val();
				
				if(pwdVal.length<6){
					alert("비밀번호가 너무 짧습니다.");
				}
				
				loginForm.submit();
			}
			
		}	
		
		
	)
</script>
</head>
<body> <!-- body사이는 브라우저가 받아서 실행한거고 페이지소스보기에서 보는것은 서버에 보내는것. -->
	<form name="loginForm" method="post" action="login_ok.jsp">
		<div id="wrap">
			<ul>
				<li>
					<div>아이디</div>
					<div>
						<input type="text" id="userID" name="userID">
						<input type="button" id="btnCheck" name="btnCheck" value="아이디 중복체크">
						<span id="chkMsg"></span>
					</div>
				</li>
				<li>
					<div>패스워드</div>
					<div><input type="password" id="userPass" name="userPass"></div>
				</li>
				<li>
					<input type="button" value="로그인" id="btnLogin"/>
				</li>
			</ul>
		</div>


	</form>
	
	<%
		request.setCharacterEncoding("EUC-KR");
	%>
	<%=request.getParameter("id") %> <!-- 여기는  name이 와야하네?? -->
</body>
</html>