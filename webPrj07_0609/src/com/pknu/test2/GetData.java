package com.pknu.test2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/GetData")
public class GetData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	//get방식으로 서브릿으로 호출하면  아래에 메소드로 처리하고 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 넘어온 정보 처리 부분 
		String snum = request.getParameter("num"); //request는 받는거니깐 숫자num을 글자로 바꾼다.만약 문자가 있다면 charset인코딩 필요하다 .
		int index = Integer.valueOf(snum); 

		// 넘겨줄 정보를 처리하는 부분 
		response.setContentType("text/html; charset=utf-8"); 
		PrintWriter out = response.getWriter(); //response 는 넘겨주는것 
		
		String [] list = {
				"1,태화1,010",
				"2,태화2,010",
				"3,태화3,010",
				"4,태화4,010",
				"5,태화5,010",
		};
		
		String msg = "";
		if(index > list.length) //실제크기보다 크다면 
			msg = "자료없음";
		else 
			 msg = list[index-1];  //실제크기보다 작다면 
		out.print(msg);
		
		out.flush(); //버퍼에 남아있는것을 원래 자리로 보내고 찌꺼리 처리한다. 
		out.close();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
