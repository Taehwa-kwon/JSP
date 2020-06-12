package com.pknu.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GetMember")
public class GetMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 넘어온 정보
		//<form> 에서 넘어온 정보를 처리한다.(request)
		String userid = request.getParameter("userid");
		
		
		//조회
		String msg ="";
		if(userid.equals("sky") ) //현재 userid는 null 이니깐 오류 500번이 뜸 || 다시 뒤에다가 저것을 추가하면 가능함  http://localhost:9090/webPrj12(0612)/GetMember?userid=sky 
			msg = "<b class='red'>사용가능한 ID입니다";
		else
			msg = "<b class='green'>사용가능할수 없는 ID입니다.";
		
		//넘겨줄 정보
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();

		out.print(msg);
		
		
		out.flush();
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
