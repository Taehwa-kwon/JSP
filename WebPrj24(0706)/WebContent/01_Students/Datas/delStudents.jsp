<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page language="java" import="PKG_DB.DBCon" %>
<%@ page language="java" import="java.sql.*" %>

<%@ page language="java" import="org.json.simple.JSONObject" %>  

<%@ page language="java" import="org.json.simple.JSONArray" %> 

<%@ page language="java" import="org.json.simple.parser.JSONParser" %>

<%
	//<!-- 객체 (주로 string)를 Json객체로 바꿔주거나 Json을 새로 만드는 역할을 한다. 기본구조: {String name : Value, String name2 : Value2 ...} --> -->
	//<!-- Json들이 들어있는 json 기본구조 : [{String name : Value}, {String name2 : Value2} ...] -->
	//방법2 [{stu_id :"STU001"},{stu_id :"STU001"},...]
	String strStu_ids = request.getParameter("jsonData");
//System.out.println(strStu_ids);
//	out.println(strStu_ids);
	
	DBCon db = new DBCon("jdbc:oracle:thin:@localhost:1521:XE","jdbctest","1234");
	
	JSONParser jsonParser = new JSONParser();
	
	JSONArray arr = (JSONArray)jsonParser.parse(strStu_ids);
	
	int arrSize= arr.size();
	String[] arrSTU_ID = new String[arrSize]; //예를들어 n개의 배열원소를 만든다.
	
	String[] strParams = new String[1];

	String strProcName = "CALL PKG_STUDENTS.PROC_DEL_STUDENTS(?)";
	
	for(int i=0; i<arrSize;i++){ //배열은 사이즈
		JSONObject obj = (JSONObject)arr.get(i); //뒤에놈이 json을 분리한다. {stu_id :"STU001"}  {stu_id :"STU001"} 이런식으로
		
		arrSTU_ID[i] = (String)obj.get("stu_id");
		
		strParams[0] = arrSTU_ID[i];
		
		db.setUpdate(strProcName,strParams);
		
	}
	//System.out.println(strStu_ids);
	
	/* 
	방법1
	
	String strStu_ids = request.getParameter("stu_ids"); 
	
	String strStu_ids ="STU002"; //이렇게 하면 단독으로 삭제가 된다
	String strStu_ids ="'STU002','STU003'";

	out.println(strStu_ids);
		
	DBCon db = new DBCon("jdbc:oracle:thin:@localhost:1521:XE","jdbctest","1234");

	String[] strParams = new String[1];
	strParams[0] = strStu_ids;
	
	String strProcName = "CALL PKG_STUDENTS.PROC_DEL_STUDENTS (?)";
	
	db.setUpdate(strProcName,strParams);
	
	out.println(strStu_ids); 
	*/

%>