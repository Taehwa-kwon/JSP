<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="org.json.simple.*"%>

<%
	String strUserID = request.getParameter("userID");
	String strUserName = request.getParameter("userName");
	String strUserPass = request.getParameter("userPass");
	//out.println(strUserID);

	String strURL = "jdbc:oracle:thin:@localhost:1521:XE";
	String useID = "testdb";
	String usePWD = "1234";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");//이 OracleDriver을 로딩하는 것

	Connection conn = DriverManager.getConnection(strURL,useID,usePWD);
	
	String strSQL = " INSERT INTO MEMBER(USERID, USERNAME, USERPASS) VALUES(?,?,?)";
	
	PreparedStatement pstm = conn.prepareStatement(strSQL);
	pstm.setString(1, strUserID);
	pstm.setString(2, strUserName);
	pstm.setString(3, strUserPass);
	
	pstm.executeUpdate();
	
	JSONObject obj = new JSONObject();
	JSONArray arr = new JSONArray();
	obj.put("suc", "1");
	arr.add(obj);
		
	response.setContentType("Application/json");
	out.println(arr);
	
	
	//out.println(strUserID + strUserPass + strUserName);//ajax 안에서 datatype : "json", //text/html 로 하고  success에서 매개변수 받고 alert(datas) 도 가능
	
	  
%>