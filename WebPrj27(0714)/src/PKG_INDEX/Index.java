package PKG_INDEX;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Index")
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Index() {
        super();
    }

    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. servlet reads request parameters  - form data를 가져온다.
		String strGubun = request.getParameter("gubun");
		System.out.print(strGubun);
		// 2-1). Do business logic and get a bean that contains result - 비즈니스 로직의 결과를 포함하는 bean을 가져온다.
		if(strGubun==null) {
			GoIndex(request,response);
		}
		else if ( strGubun.equals("login")) {
			GoLogin(request,response);
		}
		// 2-2). Store the bean in the request context  - 요청의 결과를 나타내는 bean을 HttpServletRequest(request), HttpSession(session) 또는 ServletContext(application)에 저장한다.
		
	}
	protected void GoIndex(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//index.jsp가 필요한 데이터들을 가져와서 index.jsp로 이동
		
		
		
		// 3) Servlet invokes JSP page - jsp 페이지를 호출한다.
		request.setAttribute("isSuc", false); 
//request에 담아서 JSP 페이지로 넘겨주기 위해서는 request.setAttribute() 를 써서 넘겨주고
		String strURL = "./index.jsp";
		RequestDispatcher dispatcher= request.getRequestDispatcher(strURL);
		dispatcher.forward(request, response);
//JSP 페이지에 요청을 전달한다. 
//Servlet은 상황에 적합한 JSP 페이지를 결정하고 RequestDispatcher의 forward 메서드를 사용하여 해당 JSP 페이지로 제어를 전송한다.
	}
	
	protected void GoLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//index.jsp가 필요한 데이터들을 가져와서 index.jsp로 이동
		
		
		
		// 3) Servlet invokes JSP page - jsp 페이지를 호출한다.
		request.setAttribute("isSuc", true); //처음에 값이들어갈때는 true로 받아들어간다.
		String strURL = "./Members/login.jsp";
		RequestDispatcher dispatcher= request.getRequestDispatcher(strURL);
		dispatcher.forward(request, response);
//JSP 페이지에 요청을 전달한다.
//Servlet은 상황에 적합한 JSP 페이지를 결정하고 RequestDispatcher의 forward 메서드를 사용하여 해당 JSP 페이지로 제어를 전송한다.
	}


}
