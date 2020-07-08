<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="PKG_DB.DBCon" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="org.json.simple.JSONArray" %>
<%@ page language="java" import="org.json.simple.JSONObject" %>

<%

	String strStu_id = request.getParameter("stu_id");
	//String strStu_id = "STU010";



	DBCon db = new DBCon("jdbc:oracle:thin:@localhost:1521:XE","jdbctest","1234");

	String strProcName = "call PKG_STUDENTS.PROC_SEL_STUDENT(?,?)";
	
	String[] strParams = {strStu_id,""};
	String[] strInOut = {"IN","OUT"};
	int[] sqlTypes = {0, oracle.jdbc.OracleTypes.CURSOR};
	
	ResultSet rs = db.getResultSet(strProcName,strParams,strInOut,sqlTypes);
	
	JSONArray arr = new JSONArray();
	while(rs.next()){
		JSONObject obj = new JSONObject();
		
		obj.put("stu_id",rs.getString("STU_ID"));
		obj.put("stu_name",rs.getString("STU_NAME"));
		obj.put("stu_tel",rs.getString("STU_TEL"));
		obj.put("addr1",rs.getString("ADDR1"));
		obj.put("addr2",rs.getString("ADDR2"));
		obj.put("addr3",rs.getString("ADDR3"));
		obj.put("addr4",rs.getString("ADDR4"));
		obj.put("dept1",rs.getString("DEPT1"));
		obj.put("dept2",rs.getString("DEPT2"));
		
		arr.add(obj);
	}
	
	response.setContentType("Application/json");
	out.println(arr);


%>