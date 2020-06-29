<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="org.json.simple.*"%>

<%
	String strURL = "jdbc:oracle:thin:@localhost:1521:XE";
	String useID = "testdb";
	String usePWD = "1234";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");//이 OracleDriver을 로딩하는 것

	Connection conn = DriverManager.getConnection(strURL,useID,usePWD);
	
	String strSQL = " SELECT USERID, USERNAME, USERPASS FROM MEMBER";
	
	PreparedStatement psmt = conn.prepareStatement(strSQL);
	
	psmt.executeQuery(); //얘의 리턴타입이 resultset
	
	ResultSet rs = psmt.executeQuery();
	
	JSONArray arr = new JSONArray();
	
	while(rs.next()){
		JSONObject obj = new JSONObject();
		obj.put("userid",rs.getString("USERID"));
		obj.put("username",rs.getString("USERNAME"));
		obj.put("userpass",rs.getString("USERPASS"));
		
		arr.add(obj);
	}
	response.setContentType("Application/json");
	out.println(arr);
	


%>	