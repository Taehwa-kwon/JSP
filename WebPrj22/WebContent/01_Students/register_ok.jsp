<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="PKG_DB.DBCon" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="org.json.simple.JSONArray" %>
<%@ page language="java" import="org.json.simple.JSONObject" %>

<%
	request.setCharacterEncoding("UTF-8");
	//register.jsp의 name을 받아오는거임 
	
	String strName = request.getParameter("stu_name"); //students.js에서 ajax안에  data를 어떻게 던져줄꺼냐
	
	String strAddr1 = request.getParameter("addr1");
	String strAddr2 = request.getParameter("addr2");
	String strAddr3 = request.getParameter("addr3");
	String strAddr4 = request.getParameter("addr4");
	
	String strStuAddr = "";
	
	if(strAddr4.equals("-")){
		strStuAddr = strAddr3;
		
	}else{
		strStuAddr = strAddr4;
	}
	
	String strDept1 = request.getParameter("dept1");
	String strDept2 = request.getParameter("dept2");

	String strTel = request.getParameter("tel11"); //register.jsp의 name 을 받아오네 
	
	
	String[] strInParams = {strName, strTel, strStuAddr, "GRP001", strAddr1, "GRP002", strDept2}; //이 빈값은 DB 프로시저의 O_CUR을 말하기도 함
	//이 getSido.jsp가 DBCon에서 연결해서 값을 가져오는 문구
	DBCon db = new DBCon("jdbc:oracle:thin:@localhost:1521:XE","jdbctest","1234");
	String strProcName = "Call PKG_STUDENTS.PROC_SAVE_STUDENT(?,?,?,?,?,?,?)";
			
	
	int updateCnt = db.setUpdate(strProcName, strInParams);
	
	
	
	response.sendRedirect("./students.jsp"); 
%>