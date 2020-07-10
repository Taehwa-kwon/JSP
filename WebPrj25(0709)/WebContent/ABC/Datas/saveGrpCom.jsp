<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="PKG_DB.DBCon" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="org.json.simple.JSONArray" %>
<%@ page language="java" import="org.json.simple.JSONObject" %>
<%@ page language="java" import="org.json.simple.parser.JSONParser" %>
		<!-- grpSaveAjax의 ajax의 data를  받는다. --> 
<% 
	//webPrj23/01_students/datas/delStudents.jsp랑 비교하면 될듯 

	
	/* [ 
	 {"grp_id": "", "grp_name":"입력값" , "status" : "P" }
	 {"grp_id": "", "grp_name":"입력값" , "status" : "P" }
	]  이 객체로 값이 오는데 getParameter로 받아준다.*/
	
	String strAppend = request.getParameter("append"); //grid_commons.jsp의 grpSaveAjax 메소드의 data가 주는 형식에 따라서 받는다. 즉 url에 ?필드명=  이 값을 받아온다.  
	String strUpdate = request.getParameter("update");
	String strDelete = request.getParameter("delete");
	
	DBCon db = new DBCon("jdbc:oracle:thin:@localhost:1521:XE","jdbctest","1234");
	
	JSONParser parser = new JSONParser(); //JSONParser 은 json형태로 바꿔준다.
	JSONArray appendArr = (JSONArray)parser.parse(strAppend);     //얘는 strAppend string타입을 json배열타입으로 바꾸고 
	//parse 하면 [] << 이게 빠진다 . 
	//JSONArray를 받아와서 JSONObject로 각각을 뽑아낸다.
	
	int appendSize = appendArr.size(); //자바의 배열은 갯수를 알아야 하니깐 이렇게 해서 strGrpID를 위해서 여기서 갯수를 알아낸다.
	
	String[] strGrpIDs = new String[appendSize];
	String[] strGrpNames = new String[appendSize];
	String[] strGrpStatus = new String[appendSize];
	//내가 5개를 추가하면 apeendSize가 5개가 되고 한번에 5개의 값이 db로 전달시키기 위해서
	
	
	String[] strAppendParams = new String[1]; //이건 프로시저의 in out 개수를 말하는거고 
	
	String strAppendProc = "CALL PKG_SCORES.PROC_INS_GRPCOM(?)";
	
	for(int i=0; i<appendArr.size();i++){ //배열은 사이즈다.
		
		JSONObject obj = (JSONObject)appendArr.get(i); //appendArr은 Object 타입이니깐 타입을 변환시켜준다.
		
		strGrpIDs[i] = (String)obj.get("grp_id"); //get타입도 object 
		strGrpNames[i] = (String)obj.get("grp_name");  
		strGrpStatus[i] = (String)obj.get("status");  
		
		strAppendParams[0] = strGrpNames[i];
		
		db.setUpdate(strAppendProc,strAppendParams); //최종적으로 DBCon의 setUpdate의 형식에 맞춰주기 위해서 전부다 이리 한거네 
		
	}
	

	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	JSONArray updateArr = (JSONArray)parser.parse(strUpdate);  //parser.parse(strUpdate); 이게 object니깐 jsonArray로 파싱해준다.
	
	int updateSize = updateArr.size(); 
	
	String[] strGrpIDs2 = new String[updateSize];
	String[] strGrpNames2 = new String[updateSize];
	
	String[] strUpdateParams = new String[2]; 
	
	String strUpdateProc = "CALL PKG_SCORES.PROC_UP_GRPCOM(?,?)";
	
	for(int i=0; i<updateSize; i++){
		JSONObject obj = (JSONObject)updateArr.get(i); //updateArr의 구성요소  {"grp_id": "", "grp_name":"입력값" , "status" : "P" } 이거 한줄을 다시 JSONObject로 캐스팅을 한다.
		
		//이것을 방법1, 방법2
		//strGrpIDs2[i] = (String)obj.get("grp_id");
		//strGrpNames2[i] = (String)obj.get("grp_name");
		//방법1.
		strUpdateParams[0] = (String)obj.get("grp_id");
		strUpdateParams[1] = (String)obj.get("grp_name");
		//방법2.
		//strUpdateParams[0] = strGrpIDs2[0];
		//strUpdateParams[1] = strGrpNames2[1];
		
		db.setUpdate(strUpdateProc,strUpdateParams);
		
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	JSONArray deleteArr = (JSONArray)parser.parse(strDelete);
	
	int deleteSize = deleteArr.size(); //여기는 자바코딩이니깐 자바는 size()임.
	
	String[] strDeleteParams = new String[1];
	
	String strDeleteProc ="CALL PKG_SCORES.PROC_DEL_GRPCOM(?)";
	
	for(int i =0; i<deleteSize; i++){
		JSONObject obj = (JSONObject)deleteArr.get(i);
	
		strDeleteParams[0] = (String)obj.get("grp_id"); // strDeleteParams 너의 값은 뭐야? 는 이거야 
	
	
		db.setUpdate(strDeleteProc,strDeleteParams);
	}
	
	
	/* response.setContentType("Application/json");
	out.println(arr);
	*/
	
	%>