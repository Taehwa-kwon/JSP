<%@page import="javax.xml.ws.Response"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="PKG_DB.DBCon" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="org.json.simple.JSONArray" %>
<%@ page language="java" import="org.json.simple.JSONObject" %>

<%
	String strSearch = request.getParameter("selSearch");
	String strtxtSearch = request.getParameter("txtSearch"); //내가 원하는 검색 키워드 

	
	
	DBCon db = new DBCon("jdbc:oracle:thin:@localhost:1521:XE","jdbctest","1234");
	
	//학생리스트 가져오기 
	String strProcName = "call PKG_STUDENTS.PROC_SEL_STUDENTS(?,?,?)";
	
	String[] strParams = {strSearch,strtxtSearch,"" };
	String[] strInOut = {"IN","IN","OUT"};
	int[] sqlTypes = {0,0,oracle.jdbc.OracleTypes.CURSOR};
	
	ResultSet rs = db.getResultSet(strProcName,strParams,strInOut,sqlTypes);
	
	JSONArray arr = new JSONArray();
	
	while(rs.next()){
		JSONObject obj = new JSONObject();
		
		obj.put("stu_id",rs.getString("STU_ID"));
		obj.put("stu_name",rs.getString("STU_NAME"));
		obj.put("stu_tel",rs.getString("STU_TEL"));
		obj.put("stu_addr",rs.getString("STU_ADDR"));
		obj.put("stu_dept",rs.getString("STU_DEPT"));
		obj.put("comid1",rs.getString("COMID1"));
		obj.put("comid2",rs.getString("COMID2"));
		obj.put("comid3",rs.getString("COMID3"));
		obj.put("comid4",rs.getString("COMID4")); 
		
		arr.add(obj);
		
		
	}
		response.setContentType("Application/json");

	
	out.println(arr);


%>