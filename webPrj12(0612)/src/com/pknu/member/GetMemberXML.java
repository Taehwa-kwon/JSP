package com.pknu.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GetMemberXML")
public class GetMemberXML extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 넘어온 정보
		//<form> 에서 넘어온 정보를 처리한다.(request)
		String userid = request.getParameter("userid");
		
		
		//조회
		String xml ="<member>";
		xml += "<class>red</class>";
		xml += "<msg>사용할 수 없는 아이디 입니다</msg>";
		xml += "</member>";
		
		
		//넘겨줄 정보
		response.setContentType("text/xml; charset=utf-8"); //text/xml로 수정 
		PrintWriter out = response.getWriter();

		out.print(xml);
		
		
		out.flush();
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
