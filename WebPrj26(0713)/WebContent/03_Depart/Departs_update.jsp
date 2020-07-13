<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="PKG_DEPART.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<%
	DepartVO depart= (DepartVO)request.getAttribute("depart");

	String strGrpID = depart.getGrp_id();
	String strComID = depart.getCom_id();
	String strComval = depart.getCom_val();
	String strComLvl = depart.getCom_lvl();
	
	request.setAttribute("doWork", "updateOK");
%>
<body>
	<form name="frm" method="post" action="./Depart">
		<div>그룹아이디 : <%=strGrpID %>> </div>
		<div>학과코드 :  <%=strComID %>> </div>
		<div>학과명 : <input type="text" name="com_val" id="com_val" value="<%=strComval%>"/> </div>
		<div>lvl : <input type="text" name="com_lvl" id="com_lvl" value="<%=strComLvl %>"/> </div>
		<div><input type="submit" value="확인"></div>
		<input type="hidden" name="doWork" value="updateOK"/>
		<input type="hidden" name="grp_id" value="<%=strGrpID %>"/>
		<input type="hidden" name="com_id" value="<%=strComID %>"/>
	</form>
</body>
</html>