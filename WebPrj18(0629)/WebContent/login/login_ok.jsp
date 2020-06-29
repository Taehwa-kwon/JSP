<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page language="java" import="java.sql.*" %>


<%
	//0. Client가 보낸 데이터를 받아야한다
	String strUserID = request.getParameter("userID");
	String strUserPwd = request.getParameter("userPass");
	
	out.println(strUserID + "----" + strUserPwd);
	
	
	
		String url    = "jdbc:oracle:thin:@localhost:1521:XE";
		String user   = "testdb";
		String pwd    = "1234";
	   
	   Class.forName("oracle.jdbc.driver.OracleDriver");
	   
	   Connection con = DriverManager.getConnection(url,user,pwd);
	   
	   String strProc = "CALL PKG_MEMBER.proc_login(?,?,?)";
	   
	   CallableStatement csmt = con.prepareCall(strProc);
	   csmt.setString(1,strUserID);
	   csmt.setString(2, strUserPwd);
	   csmt.registerOutParameter(3, oracle.jdbc.OracleTypes.CURSOR);
	   
	   csmt.execute();
	   
	   ResultSet rs = (ResultSet)csmt.getObject(3);
	   
	   rs.next();
	   String strCnt = rs.getString("CNT");
	   
	   if(strCnt=="1"){
		   
	   }
	   else
	   {
		   response.sendRedirect("./login.jsp?msg="+ "fail");
	   }
	   
	
%>