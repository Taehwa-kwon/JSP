<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="PKG_DB.DBCon" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="org.json.simple.JSONArray" %>
<%@ page language="java" import="org.json.simple.JSONObject" %>
    
<%
	String strSido = request.getParameter("in_Sido"); 
	//이 getSido.jsp가 DBCon에서 연결해서 값을 가져오는 문구
	DBCon db = new DBCon("jdbc:oracle:thin:@localhost:1521:XE","jdbctest","1234");

	String strProcName = "call PKG_STUDENTS.PROC_SEL_GUGUN(?,?)"; //프로시저의 매개변수가 2개고
	
	Connection con =db.getConnection(); //DBCon에 있는걸 받아내고 ,  -- 이렇게 하는것은 DBCon에 있는걸 사용 안하니깐.
	//String[] strInParams = null;
	//ResultSet rs = db.getResultSet(strProcName, strInParams);
	CallableStatement csmt = con.prepareCall(strProcName);   // prepareCall 메쏘드에 의해 CallableStatement를 생성한다.
	
	
	csmt.setString(1,strSido); 										//1.여기와
	csmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);	//1.여기가 함께 프로시저에 셋팅이 되는거고
	
	
	csmt.execute();
	ResultSet rs = (ResultSet)csmt.getObject(2);	//output 할꺼 CURSOR
	
	JSONArray arr= new JSONArray();
	
	while(rs.next()){
		JSONObject obj = new JSONObject();
		obj.put("com_id",rs.getString("COM_ID")); // 프로시저의 PROC_SEL_SIDO안에 select문 
		obj.put("grp_id",rs.getString("GRP_ID"));  
		obj.put("com_val",rs.getString("COM_VAL"));
		
		arr.add(obj);
		
	}
	response.setContentType("Application/json");
	out.println(arr);

%>