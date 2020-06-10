package com.pknu.ex08;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetData
 */
@WebServlet("/get")
public class GetData extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//넘어오는값을 처리한다.
		request.setCharacterEncoding("utf-8");//클라이언트에서 보낸 정보를 읽는다. 
		String userid = request.getParameter("userid"); //name="userid" 속성에 있는것을 가져와야 한다.
		String userpass1 = request.getParameter("userpass1"); //test3에 있는걸 가져와서 HTML에 바꿔서 찍는다. 
		String username = request.getParameter("username");
		
		
		//출력할 HTML 모양을 만든다.response 웹 브라우저로 클라이언트 요청에 대한 응답할 응답 정보를 가지고 있는 개체
		// SERVLET이 하는 역할이 텍스트를 보내지만 너는 TEXT/HTML로 해석해서  출력될 내용을 HTML로 받아서 처리한다. 
		response.setContentType("text/html; charset=utf-8"); // contenttype의 지금 내가 내려준 정보를 html이  
		PrintWriter out = response.getWriter(); 
		String html = "<html>"; //이건 필수로 작성
		html += "<head>";
		html += "<meta content-type=text/html; charset=utf-8>";
		html += "</head>";
		html += "<body>";
		html += "<div> 아이디:" + userid +"</div>";
		html += "<div> 암호:" + userpass1 +"</div>";
		html += "<div> 이름:" + username +"</div>";
		html += "</body>";
		html += "</html>";
		
		out.print(html);
		
		out.flush();
		out.close();
		//reponse 내가 만들걸 html에 내려 보내는것
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	
	
	
	
//	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	}
//
//	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	}
//
//	protected void doHead(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	}
//
//	protected void doOptions(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	}
//
//	protected void doTrace(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	}

}
