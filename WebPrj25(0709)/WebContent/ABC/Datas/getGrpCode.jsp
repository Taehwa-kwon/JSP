<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="PKG_DB.DBCon" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="org.json.simple.JSONArray" %>
<%@ page language="java" import="org.json.simple.JSONObject" %>

<%
	String strGrpName = request.getParameter("grp_name");
	//String strGrpName= "지역코드";
	
	DBCon db = new DBCon("jdbc:oracle:thin:@localhost:1521:XE","jdbctest","1234");

	String strProcName = "CALL PKG_SCORES.PROC_SEL_GRPCOM(?,?)";
	
	String[] strParams = {strGrpName,""};
	String[] strInOut = {"IN","OUT"};
	int[] sqlTypes = {0,oracle.jdbc.OracleTypes.CURSOR};
	
	ResultSet rs = db.getResultSet(strProcName,strParams,strInOut,sqlTypes);
	
	JSONArray arr = new JSONArray();
	while(rs.next()){
		JSONObject obj = new JSONObject();   //얘는 json객체를 {}를 만든다. 
		
		obj.put("grp_id",rs.getString("GRP_ID"));  //json 배열{} 를 만든다.
		obj.put("grp_name",rs.getString("GRP_NAME")); //stu_id로 내보낸다.
		
		arr.add(obj);  //여기서 { [], [] ,[], [], [] } 이런 형태로 만든다.
	}
	
	response.setContentType("Application/json");
	out.println(arr);
	
	%>