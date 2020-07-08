<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="PKG_DB.DBCon" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="org.json.simple.JSONArray" %>
<%@ page language="java" import="org.json.simple.JSONObject" %>


<%
	
	String strSelectedDept = request.getParameter("selectedValue");
	//String strSelectedDept = "COM0015";
	//http://localhost:9090/WebPrj22/02_Scores/Datas/getStudent_list.jsp?strSelectedDept=COM0015

	DBCon db = new DBCon("jdbc:oracle:thin:@localhost:1521:XE","jdbctest","1234");

	String strProcName = "CALL PKG_MEMBERS.PROC_SEL_STUDENTS(?,?)";
    
	String[] strParams = {strSelectedDept,""};   //IN_DEPT , IN_LVL
	String[] strInOut = {"IN","OUT"};
	int[] sqlTypes = {0, oracle.jdbc.OracleTypes.CURSOR};
	
	ResultSet rs = db.getResultSet(strProcName,strParams,strInOut,sqlTypes);
	
	JSONArray arr = new JSONArray();
	while(rs.next()){
		JSONObject obj = new JSONObject();
		
		obj.put("stu_id",rs.getString("STU_ID"));
		obj.put("stu_name",rs.getString("STU_NAME"));
		
		arr.add(obj);
	}
	
	response.setContentType("Application/json"); //이걸 안하면 마크업언어로 전달된다. 난 응답한다.json형태로 전달한다.
	out.println(arr);
    
    %>
    
    