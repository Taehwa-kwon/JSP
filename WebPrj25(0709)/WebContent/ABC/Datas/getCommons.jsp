<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="PKG_DB.DBCon" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="org.json.simple.JSONArray" %>
<%@ page language="java" import="org.json.simple.JSONObject" %>

<%
	String strGrpID = request.getParameter("grp_id");
	//?grp_id=GRP001
			
	DBCon db = new DBCon("jdbc:oracle:thin:@localhost:1521:XE","jdbctest","1234");

	String strProcName = "CALL PKG_SCORES.PROC_SEL_COM(?,?)";
	
	String[] strParams = {strGrpID,""};
	String[] strInOut = {"IN","OUT"};
	int[] sqlTypes = {0,oracle.jdbc.OracleTypes.CURSOR};
	
	ResultSet rs = db.getResultSet(strProcName,strParams,strInOut,sqlTypes);
	
	JSONArray arr = new JSONArray();
	while(rs.next()){
		JSONObject obj = new JSONObject();    
		
		obj.put("grp_id",rs.getString("GRP_ID"));  
		obj.put("com_id",rs.getString("COM_ID")); 
		obj.put("com_val",rs.getString("COM_VAL")); 
		obj.put("com_lvl",rs.getString("COM_LVL")); 
		
		arr.add(obj);  
	}
	
	response.setContentType("Application/json");
	out.println(arr);
	
	%>