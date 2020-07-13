<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="java.util.ArrayList" %>
<%@ page language="java" import="PKG_DEPART.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%
		ArrayList departList = (ArrayList)request.getAttribute("departList");   
%>

</head>
<body>
	<table border="1" cellpadding="0" cellspaciong="0" align="center" width="600">
		<tr>
			<td width="100" align="center">그룹코드</td>
			<td width="100" align="center">학과코드</td>
			<td width="300" align="center">학과명(단과대학)</td>
			<td width="100" align="center">Level</td>
		</tr>

		<%
         	for(int i=0; i<departList.size(); i++) {
            String strComID  = ((DepartVO)departList.get(i)).getCom_id();
            String strGrpID  = ((DepartVO)departList.get(i)).getGrp_id();
            String strComVal = ((DepartVO)departList.get(i)).getCom_val();
            String strComLvl = ((DepartVO)departList.get(i)).getCom_lvl();
            
            int padding = Integer.parseInt(strComLvl) * 20;
      %>
		
		
		<tr>
			<td width="100" align="center"><%=strGrpID %></td>
			<td width="100" align="center">
				<a href="./Depart?doWork=update&grp_id=<%=strGrpID%>&com_id=<%=strComID%>"><%=strComID %></a>
			</td>
			<td width="300" style="padding-left:<%=padding%>px"><%=strComVal %></td>
			<td width="100" align="center"><%=strComLvl %></td>
		</tr>
		
		<%
			}
		%>
		
	</table>
</body>
</html>