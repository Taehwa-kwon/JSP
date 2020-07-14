package PKG_INIT;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//@WebFilter("/*")
public class InitFilter implements Filter {

	@Override
	//doFilter이 언제 실행되냐면.....
	//Index.java에서 service가 실행되기 전에  아니 뭐하는줄 모르겠음
	
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) //바꿔야함 매개변수 
			throws IOException, ServletException {
			
		HttpServletRequest request = (HttpServletRequest) req;
		ServletResponse response = (ServletResponse) res;
		
		String loginGubun = request.getParameter("gubun");
		System.out.println("InitFilter loginGubun"+loginGubun);
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		HttpSession session = request.getSession();
		
		String strUserID = (String)session.getAttribute("userID");
		if( strUserID ==null || strUserID.equals("")) {
			//로그인이 안되었을때
			String strURL = "./Members/login.jsp";
			boolean isSuc = false;
			request.setAttribute("isSuc", isSuc);
			
			RequestDispatcher dispatcher= request.getRequestDispatcher(strURL);
			dispatcher.forward(request, response);
		}
		else {
			System.out.println("-------------");
			
			chain.doFilter(req, res);
		}
		
		
		

	}

}
