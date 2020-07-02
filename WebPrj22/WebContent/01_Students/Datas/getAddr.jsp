<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="PKG_DB.DBCon" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="org.json.simple.JSONArray" %>
<%@ page language="java" import="org.json.simple.JSONObject" %>
    
<%
	request.setCharacterEncoding("UTF-8");

	String strAddr = request.getParameter("addr"); //COMID를 받아오고  // students.js에서 ajax안에  data를 어떻게 던져줄꺼냐 
	String strLVL = request.getParameter("lvl");
	//[{"val":"COM0001","txt":"인문과학대학"}, , , , , , , , , ,] 이러한 값들이 빠져나옴 
	
	//이 getSido.jsp가 DBCon에서 연결해서 값을 가져오는 문구
	DBCon db = new DBCon("jdbc:oracle:thin:@localhost:1521:XE","jdbctest","1234");

	String strProcName = "call PKG_STUDENTS.PROC_SEL_ADDR(?,?,?)"; 
	
	String[] strInParams = {strAddr, strLVL, ""}; //이 빈값은 DB 프로시저의 O_CUR을 말함, 어쩄뜬 프로시저의 자리값과 맞춰줘야해서
	String[] strInOut = {"IN","IN","OUT"};
	int [] sqlTypes= {0,0,oracle.jdbc.OracleTypes.CURSOR};
	
	ResultSet rs = db.getResultSet(strProcName, strInParams,strInOut,sqlTypes); 
	//strProcName 에 SQL문이 오고 csmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR); 이거 타입이 오는거지 
	
	JSONArray arr= new JSONArray();
	while(rs.next()){
		
		JSONObject obj = new JSONObject();
		obj.put("val",rs.getString("COM_ID")); // 프로시저의 PROC_SEL_SIDO안에 select문이며 COM_ID를 받아오고
		obj.put("txt",rs.getString("COM_VAL"));  // COM_VAL 서울부산대구광주 이런걸 받아오고 
		
		arr.add(obj);
		
	}
	response.setContentType("Application/json");
	out.println(arr);

%>