<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="PKG_DB.DBCon" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="org.json.simple.JSONArray" %>
<%@ page language="java" import="org.json.simple.JSONObject" %>
    
<%
	//이 getSido.jsp가 DBCon에서 연결해서 값을 가져오는 문구
	DBCon db = new DBCon("jdbc:oracle:thin:@localhost:1521:XE","jdbctest","1234");

	String strProcName = "call PKG_STUDENTS.PROC_SEL_SIDO(?)"; //프로시저의 매개변수가 1개니깐
	String[] strInParams = null;
	
	ResultSet rs = db.getResultSet(strProcName, strInParams); //strProcName 이 SQL문이 오고 csmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR); 이거 타입이 오는거지 
	
	JSONArray arr= new JSONArray();
	
	while(rs.next()){
		JSONObject obj = new JSONObject();
		obj.put("com_id",rs.getString("COM_ID")); // 프로시저의 PROC_SEL_SIDO안에 select문 
		obj.put("grp_id",rs.getString("GRP_ID"));  
		obj.put("com_val",rs.getString("COM_VAL"));
		
		arr.add(obj);
		
	}
	response.setContentType("Application/json");
	out.println(arr);

%>