<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="PKG_DB.DBCon" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="org.json.simple.JSONArray" %>
<%@ page language="java" import="org.json.simple.JSONObject" %>
<%@ page language="java" import="org.json.simple.parser.JSONParser" %>

<%
	DBCon db = new DBCon("jdbc:oracle:thin:@localhost:1521:XE","jdbctest","1234");


	String strJSONDatas = request.getParameter("jsonDatas");
	JSONParser parser = new JSONParser();
	
	out.println(strJSONDatas);
	 

	JSONObject jsonObj = (JSONObject)parser.parse(strJSONDatas);
	
	JSONArray arrAppend=(JSONArray)jsonObj.get("appendRows");
	JSONArray arrUpdate=(JSONArray)jsonObj.get("updateRows");
	JSONArray arrDelete=(JSONArray)jsonObj.get("deleteRows");
	
	int appendSize = arrAppend.size();
	int updateSize = arrUpdate.size();
	int deleteSize = arrDelete.size();
	
	String strProcName = "CALL PKG_SCORES.PROC_INS_COM(?,?,?,?)";
	 String[] strAppendParams = new String[4];
	
	for(int i=0; i<appendSize; i++){
		JSONObject obj = (JSONObject)arrAppend.get(i);
		
		String strGrpID = (String)obj.get("grp_id");
		String strComID = (String)obj.get("com_id");
		String strComVal = (String)obj.get("com_val");
		String strComLvl = (String)obj.get("com_lvl");
		String strParentID = (String)obj.get("parent_id");
		String strStatus = (String)obj.get("status");
		
		strAppendParams[0] = strGrpID;
		strAppendParams[1] = strComVal;
		strAppendParams[2] = strComLvl;
		strAppendParams[3] = strParentID;
		
		db.setUpdate(strProcName,strAppendParams);
	}
	
	
	String strProcName3 = "CALL PKG_SCORES.PROC_UP_COM(?,?,?,?)";
	String[] strParams3 = new String[4]; 
	
	
	for(int i=0; i<updateSize; i++){
		JSONObject obj = (JSONObject)arrUpdate.get(i);
		
		String strGrpID = (String)obj.get("grp_id");
		String strComID = (String)obj.get("com_id");
		String strComVal = (String)obj.get("com_val");
		String strComLvl = (String)obj.get("com_lvl");
		String strParentID = (String)obj.get("parent_id");
		String strStatus = (String)obj.get("status");
		
		strParams3[0] = strGrpID;
		strParams3[1] = strComID;
		strParams3[2] = strComVal;
		strParams3[3] = strComLvl;
		
		db.setUpdate(strProcName3,strParams3);
	}
	
	
	String strProcName2 = "CALL PKG_SCORES.PROC_DEL_COM(?,?)";
	String[] strParams2 = new String[2]; 
	
	
	for(int i=0; i<deleteSize; i++){
		JSONObject obj = (JSONObject)arrDelete.get(i);
		
		String strGrpID = (String)obj.get("grp_id");
		String strComID = (String)obj.get("com_id");
		String strComVal = (String)obj.get("com_val");
		String strComLvl = (String)obj.get("com_lvl");
		String strParentID = (String)obj.get("parent_id");
		String strStatus = (String)obj.get("status");
		
		strParams2[0] = strGrpID;
		strParams2[1] = strComID;
		
		db.setUpdate(strProcName2,strParams2);
	}
	 
	
	 
	
	

%>