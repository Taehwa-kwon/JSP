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
	String reqMsg = request.getParameter("msg"); //=�� ������ ���
	%>
	
<script>
		if("<%=reqMsg%>" == "fail"){
			alert("���̵� �Ǵ� �н����尡 Ʋ�Ƚ��ϴ�.")
		}
	

</script>

<script>
	$(document).ready(
		function(){
			//1.ù��° �̺�Ʈ �ۼ� btnLogin
			$("#btnLogin").click(
				function(){
					loginOK();
					
				}		
			)
			//2.�ι�° �̺�Ʈ btnCheck
			$("#btnCheck").click(
				function(){
					//�������
					//location.href="loginCheck.jsp?id=" + $("#userID").val(); ���̵� url�� �Ѱ��ִ°��� 
					
					//ajon���
					$.ajax({
						url:"./loginCheck.jsp",
						type: "get", //get ���  //post�� �ڽ�
						datatype:"json",
						data:"userID="+$("#userID").val(),
						success:function(datas){ //���⼭ datas �� 
							var result = datas[0].CNT
							if(result=="1"){
								//�ߺ��Ǿ���
								$("#chkMsg").html("�ߺ��Ǿ ���Ұ���");
							}
							else{
								$("#chkMsg").html(" ��� ����");	
							}
						}
						,
						error : function(err){
							alert(2);
						}
						
							
					}); //�߰�ȣ�� ��ü. ��ü�ȿ��� ��� json���·� ��.
					
				}		
			)
			var loginOK = function(){
				//1.���̵� �ԷµǾ����� Ȯ��
				var idVal = $("#userID").val();
				
				if(idVal.length < 4 ){
					alert("���̵� ��Ȯ�ϰ� �Է��Ͻÿ�");
					return; //�α��ι�ư�� input type��ư�̴ϱ� return���� ó������
				}
				var pwdVal = $("#userPass").val();
				
				if(pwdVal.length<6){
					alert("��й�ȣ�� �ʹ� ª���ϴ�.");
				}
				
				loginForm.submit();
			}
			
		}	
		
		
	)
</script>
</head>
<body> <!-- body���̴� �������� �޾Ƽ� �����ѰŰ� �������ҽ����⿡�� ���°��� ������ �����°�. -->
	<form name="loginForm" method="post" action="login_ok.jsp">
		<div id="wrap">
			<ul>
				<li>
					<div>���̵�</div>
					<div>
						<input type="text" id="userID" name="userID">
						<input type="button" id="btnCheck" name="btnCheck" value="���̵� �ߺ�üũ">
						<span id="chkMsg"></span>
					</div>
				</li>
				<li>
					<div>�н�����</div>
					<div><input type="password" id="userPass" name="userPass"></div>
				</li>
				<li>
					<input type="button" value="�α���" id="btnLogin"/>
				</li>
			</ul>
		</div>


	</form>
	
	<%
		request.setCharacterEncoding("EUC-KR");
	%>
	<%=request.getParameter("id") %> <!-- �����  name�� �;��ϳ�?? -->
</body>
</html>