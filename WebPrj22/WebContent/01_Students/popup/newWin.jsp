<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>

<script>
	function a(){
		opener.window.document.getElementById("txt").value=$("#txt").val();   //이 말의 뜻은 popup에서 newWin.jsp 가 열렸잖아 그럼 popup.jsp의 자식이니깐  newWin.jsp의 부모를 호출하고 싶으면 opener을 한다.
		this.window.close(); //이걸 뺴도됌
	}
</script>

</head>

<%
	String strTxt = request.getParameter("txt");
	

%>


<body>
나아아는 팝업이지롱 
<br/>
<input type="text" id="txt" value=<%=strTxt %>> 
<input type="button" value="나돌아갈래" onclick="a()">
</body>
</html>