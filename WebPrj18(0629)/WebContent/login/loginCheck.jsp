<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="org.json.simple.*"%>

<%
	String strUserID = request.getParameter("userID"); //이렇게 받아오고
	
	//response.sendRedirect("./login.jsp"); //이렇게 다시 넘겨줌 
	
	//1.DB정보 입력
	String strURL = "jdbc:oracle:thin:@localhost:1521:XE";
	String useID = "testdb";
	String usePWD = "1234";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");//이 OracleDriver을 로딩하는 것
	
	//2.Connection
	Connection con = DriverManager.getConnection(strURL,useID,usePWD);
	
	String strProc = "call PKG_MEMBER.proc_idcheck(?,?)";
	
	CallableStatement cstmt = con.prepareCall(strProc); //프로시저를 호출할때 callable하고 
	cstmt.setString(1,strUserID); //프로시저 첫번쨰 자리에 원하는 id를 입력하고
	cstmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR); 
	
	cstmt.execute();
	
	ResultSet rs = (ResultSet)cstmt.getObject(2);//o_cur을 받아와서 
	
	
	JSONArray arr = new JSONArray();
	
	//RS에 있는 데이터를 JSON으로 바꿔서 웹페이지로 돌려줘야 한다.
	while(rs.next()){
		JSONObject obj = new JSONObject();
		obj.put("CNT",rs.getString("CNT")); //rs안에 프로시저의 CNT를 읽어와서 obj안에 넣는다. 
		
		arr.add(obj);	//
		
	}
	
	
	response.setContentType("application/json"); //이렇게해야지 타입이 json으로 보낸다는것. contentType상단..
//	out.println("[{msg:'성공'},{msg:'실패'}]");
	
	out.println(arr);

	
%>