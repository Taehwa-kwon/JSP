<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="PKG_DB.DBCon" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="org.json.simple.JSONArray" %>
<%@ page language="java" import="org.json.simple.JSONObject" %>


<%
	DBCon db = new DBCon("jdbc:oracle:thin:@localhost:1521:XE","jdbctest","1234");

	String strProcName = "CALL PKG_STUDENTS.PROC_SEL_DEPT(?,?,?)";
    
	String[] strParams = {"","1",""};
	String[] strInOut = {"IN","IN","OUT"};
	int[] sqlTypes = {0, 0,oracle.jdbc.OracleTypes.CURSOR};
	
	ResultSet rs = db.getResultSet(strProcName,strParams,strInOut,sqlTypes);
	
	JSONArray arr = new JSONArray();
	while(rs.next()){
		JSONObject obj = new JSONObject();
		
		obj.put("com_id",rs.getString("COM_ID"));
		obj.put("com_val",rs.getString("COM_VAL"));
		
		arr.add(obj);
	}
	
	response.setContentType("Application/json"); //이걸 안하면 마크업언어로 전달된다. 난 응답한다.json형태로 전달한다.
	out.println(arr);
%>
    