<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="PKG_DB.DBCon" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="org.json.simple.JSONArray" %>
<%@ page language="java" import="org.json.simple.JSONObject" %>

<%

	String strStu_id = request.getParameter("stu_id");
	String strSub_id = request.getParameter("sub_id");



	DBCon db = new DBCon("jdbc:oracle:thin:@localhost:1521:XE","jdbctest","1234");

	String strProcName = "call PKG_STUDENTS.PROC_SEL_TIME(?,?,?)";
	
	String[] strParams = {strStu_id,strSub_id,""};
	String[] strInOut = {"IN","IN","OUT"};
	int[] sqlTypes = {0,0, oracle.jdbc.OracleTypes.CURSOR};
	
	ResultSet rs = db.getResultSet(strProcName,strParams,strInOut,sqlTypes);
	
	JSONArray arr = new JSONArray();
	while(rs.next()){
		JSONObject obj = new JSONObject();
		
		obj.put("stu_id",rs.getString("STU_ID")); //stu_id로 내보낸다.
		obj.put("o_stu_id",rs.getString("O_STU_ID")); //stu_id로 내보낸다.
		obj.put("stu_name",rs.getString("STU_NAME")); 
		obj.put("sub_id",rs.getString("SUB_ID"));
		obj.put("o_sub_id",rs.getString("O_SUB_ID"));
		obj.put("sub_nameㄴ",rs.getString("SUB_NAME"));
		obj.put("do_year",rs.getString("DO_YEAR"));
		obj.put("o_do_year",rs.getString("O_DO_YEAR"));
		obj.put("semester",rs.getString("SEMESTER"));
		obj.put("o_semester",rs.getString("O_SEMESTER"));
		obj.put("reg_date",rs.getString("REG_DATE"));
		
		arr.add(obj);
		System.out.println(arr.get(0));
		
	}
	
	response.setContentType("Application/json");
	out.println(arr);
	
	%>
