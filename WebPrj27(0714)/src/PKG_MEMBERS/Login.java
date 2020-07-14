package PKG_MEMBERS;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import PKG_DB.DBCon;



@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Login() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doWork(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doWork(request,response);
	}
	
	protected void doWork(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      
	      String strGubun = request.getParameter("gubun");  //이렇게 하면 로컬호스트?name(속성)=vlaue(값)
	      
	      //getParameter 은 속성의 value를 가지고 오네.
	      System.out.print("doWork strGubun" + strGubun); // value값을 가지고 오네. ㅇㅋ 
	      if(strGubun == null) {
	    	  
	      }
			
			  //ajax 요청오면 여기를 실행 
			  else if (strGubun.equals("ajax")) {
			  do_Ajax(request,response); }
			 
	      else if(strGubun.equals("login")) {
	    	  Login2(request,response);
	      }
	      else {
	         LogOut(request,response);
	      }
	   }
	private void do_Ajax(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
			//1.login
				String strUserID = request.getParameter("userID");
				String strUserPass = request.getParameter("userPass");
				// 2-1). Do business logic and get a bean that contains result - 비즈니스 로직의 결과를 포함하는 bean을 가져온다.
				DBCon db = new DBCon("jdbc:oracle:thin:@localhost:1521:XE","testdb","1234");
				
				String strProcName = " CALL PKG_MEMBER.PROC_LOGIN(?,?,?)";
				String[] strParams = {strUserID,strUserPass,""};
				String[] strInOut = {"IN","IN","OUT"};
				int[] sqlTypes = {0,0,oracle.jdbc.OracleTypes.CURSOR};
				
				ResultSet rs = db.getResultSet(strProcName,strParams,strInOut,sqlTypes);
				
				 
					try {
						rs.next();
						JSONObject obj = new JSONObject();
						
						obj.put("result", rs.getString("cnt"));
						
						PrintWriter out = response.getWriter();
						response.setContentType("Application/json");
						out.println(obj);
						System.out.println(obj);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			}

	private void Login2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. servlet reads request parameters  - form data를 가져온다.
		HttpSession session = request.getSession();
		
		//1.login
		String strUserID = request.getParameter("userID");
		String strUserPass = request.getParameter("userPass");
		// 2-1). Do business logic and get a bean that contains result - 비즈니스 로직의 결과를 포함하는 bean을 가져온다.
		DBCon db = new DBCon("jdbc:oracle:thin:@localhost:1521:XE","testdb","1234");
		
		String strProcName = " CALL PKG_MEMBER.PROC_LOGIN(?,?,?)";
		String[] strParams = {strUserID,strUserPass,""};
		String[] strInOut = {"IN","IN","OUT"};
		int[] sqlTypes = {0,0,oracle.jdbc.OracleTypes.CURSOR};
		
		ResultSet rs = db.getResultSet(strProcName,strParams,strInOut,sqlTypes);
		
		
		try {
			rs.next();
			int cnt = Integer.parseInt(rs.getString("CNT"));
			String strURL ="";
			boolean isSuc = false;
			
			if(cnt>0) {
				//로그인 성공시 index.jsp로 가고
				isSuc = true;
				
				//Session변수 생성
				session.setAttribute("userID", strUserID);
				
				request.setAttribute("isSuc", isSuc);
				strURL = "./index.jsp"; //웹컨텐츠를 기준으로 확인 
				
				
			}
			else {
				//로그인 실패시 login.jsp로 가고
				isSuc = false;
				request.setAttribute("isSuc", isSuc);
				strURL = "./Members/login.jsp";
			}
			
			RequestDispatcher dispatcher= request.getRequestDispatcher(strURL);
			dispatcher.forward(request, response);
		} catch (SQLException e) {
				
			
			
			e.printStackTrace();
		} 
		
		
		
		// 2-2). Store the bean in the request context  - 요청의 결과를 나타내는 bean을 HttpServletRequest(request), HttpSession(session) 또는 ServletContext(application)에 저장한다.
		// 3) Servlet invokes JSP page - jsp 페이지를 호출한다.
	}
	private void LogOut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session= request.getSession();
		session.invalidate();
		
		request.setAttribute("isSuc", false);
		
		String strURL = "./index.jsp";
		
		RequestDispatcher dispatcher= request.getRequestDispatcher(strURL);
		dispatcher.forward(request, response);
	
	}

}
