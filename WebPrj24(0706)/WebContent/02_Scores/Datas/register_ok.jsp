<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="PKG_DB.DBCon" %>
<%@ page language="java" import="java.sql.*" %>

    <%
    
    	String strSubject = request.getParameter("subject"); //name을 받는거다.
    	String strYear = request.getParameter("year"); //name을 받는거다.
    	String strSemester = request.getParameter("semester"); //name을 받는거다.
    	String strGubun = request.getParameter("gubun"); //name을 받는거다.
    	String strStu_ID = request.getParameter("student"); //name을 받는거다.
    	String strScore = request.getParameter("score"); //name을 받는거다.
    	String strExamDate = request.getParameter("examdate"); //name을 받는거다.
    	
    	DBCon db = new DBCon("jdbc:oracle:thin:@localhost:1521:XE","jdbctest","1234");

    	String strProcName = "CALL PKG_MEMBERS.PROC_INS_SCORES(?,?,?,?,?,?,?,?)";
    	
    	String[] strParams = new String[8];
    	strParams[0] =strSubject;
    	strParams[1] =strYear;
    	strParams[2] =strSemester;
    	strParams[3] =strGubun;
    	strParams[4] =strStu_ID;
    	strParams[5] =strScore;
    	strParams[6] =strExamDate;
    	strParams[7] ="";
    	
    	String[] strInOut = {"IN","IN","IN","IN","IN","IN","IN","OUT"};
    	int[] sqlTypes = {0,0,0,0,0,0,0,oracle.jdbc.OracleTypes.CURSOR};
    	
    	ResultSet rs = db.getResultSet(strProcName,strParams,strInOut,sqlTypes);
    	
    	rs.next();
    	
    	String strResult = rs.getString("RST");
    	
    	   if(strResult.equals("SUC")){
    		   response.sendRedirect("./scoreList.jsp");
    	 }else
    		   response.sendRedirect("");
    	
    	
    	
    
    	
    %>
    
    