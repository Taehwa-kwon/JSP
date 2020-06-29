<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="org.json.simple.*"%>

<%


	String strParams = request.getParameter("params");

	String strURL = "jdbc:oracle:thin:@localhost:1521:XE";
	String useID = "testdb";
	String usePWD = "1234";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");//이 OracleDriver을 로딩하는 것

	Connection conn = DriverManager.getConnection(strURL,useID,usePWD);
	
	String strSql = "DELETE FROM MEMBER WHERE USERID IN " + strParams;
	
	PreparedStatement psmt = conn.prepareStatement(strSql);
	
	psmt.executeUpdate();
	
	
%>