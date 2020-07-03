<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="PKG_DB.DBCon" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="org.json.simple.JSONArray" %>
<%@ page language="java" import="org.json.simple.JSONObject" %>
    
<%
	request.setCharacterEncoding("UTF-8");

	String strAddr = request.getParameter("dept"); //students.js에서 ajax안에  data를 어떻게 던져줄꺼냐 
	String strLVL = request.getParameter("lvl");
	//[{"val":"COM0001","txt":"인문과학대학"}, , , , , , , , , ,] 이러한 값들이 빠져나옴 
	
	DBCon db = new DBCon("jdbc:oracle:thin:@localhost:1521:XE","jdbctest","1234");

	String strProcName = "call PKG_STUDENTS.PROC_SEL_DEPT(?,?,?)"; 
	String[] strInParams = {strAddr, strLVL, ""}; 
	String[] strInOut = {"IN","IN","OUT"};
	int [] sqlTypes= {0,0,oracle.jdbc.OracleTypes.CURSOR};
	
	
	ResultSet rs = db.getResultSet(strProcName, strInParams,strInOut,sqlTypes); //strProcName 이 SQL문이 오고 csmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR); 이거 타입이 오는거지 
	
	JSONArray arr= new JSONArray();
	while(rs.next()){
		
		JSONObject obj = new JSONObject();
		obj.put("val",rs.getString("COM_ID")); // 프로시저의 PROC_SEL_SIDO안에 select문 
		obj.put("txt",rs.getString("COM_VAL"));  
		
		arr.add(obj);
		
	}
	response.setContentType("Application/json");
	out.println(arr);

%>