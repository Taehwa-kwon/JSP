<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="PKG_DB.DBCon" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="org.json.simple.JSONArray" %>
<%@ page language="java" import="org.json.simple.JSONObject" %>
<%@ page language="java" import="org.json.simple.parser.JSONParser" %>

<%
	String strJSONDatas = request.getParameter("jsonDatas");
	JSONParser parser = new JSONParser();

	JSONObject jsonObj = (JSONObject)parser.parse(strJSONDatas);
	
	JSONArray arrAppend=(JSONArray)jsonObj.get("appendRows");
	JSONArray arrUpdate=(JSONArray)jsonObj.get("updateRows");
	JSONArray arrDelete=(JSONArray)jsonObj.get("deleteRows");
	
	
	

%>