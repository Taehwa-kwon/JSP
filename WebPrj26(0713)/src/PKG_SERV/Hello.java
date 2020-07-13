package PKG_SERV;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/hi")
public class Hello extends HttpServlet {

	/*
	 * protected void service(HttpServletRequest request,HttpServletResponse
	 * response) throws ServletException, IOException //여기가 Controloer 컨트롤러가 된다. {
	 * 클라이언트에서 -> 서버단으로 보낼떄는 HttpServletRequest
	 * request.setCharacterEncoding("UTF-8"); 서버에서 -> 클라이언트로 보낼때는
	 * HttpServletResponse response.setContentType("text/html; charset=utf-8");
	 * 
	 * 
	 * PrintWriter out = response.getWriter();
	 * out.print("<font color='red'>Hello World!!!</font>");
	 * 
	 * String userID= request.getParameter("id");
	 * 
	 * //out.println("Hello" + userID);
	 * 
	 * String btn1 = request.getParameter("btn1"); String btn2 =
	 * request.getParameter("btn2"); //out.println("Hello"+ btn1 );
	 * //out.println("Hello"+ btn2 );
	 * 
	 * 
	 * //response.sendRedirect("./01_test/list.jsp");
	 * 
	 * request.setAttribute("id", userID); RequestDispatcher dispatcher =
	 * request.getRequestDispatcher("/01_text/list.jsp"); //얘는 WebContent를 기준으로 경로를
	 * 지정하면 ㄴ된다.
	 * 
	 * dispatcher.forward(request,response);
	 * 
	 * 현재 서버 write는 class를 바라보고 있다. 얘는 response로 응답받아서 request로 list로 보내준다.
	 * 
	 * }
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/* 클라이언트에서 -> 서버단으로 보낼떄는 HttpServletRequest */
		request.setCharacterEncoding("UTF-8");
		/* 서버에서 -> 클라이언트로 보낼때는 HttpServletResponse */
		response.setContentType("text/html; charset=utf-8");

		PrintWriter out = response.getWriter();
		out.print("<font color='red'>Hello World!!!</font>");

		String userID = request.getParameter("id");

		// out.println("Hello" + userID);

		String btn1 = request.getParameter("btn1");
		String btn2 = request.getParameter("btn2");
		// out.println("Hello"+ btn1 );
		// out.println("Hello"+ btn2 );

		// response.sendRedirect("./01_test/list.jsp");

		request.setAttribute("id", userID);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/01_text/list.jsp"); // 얘는 WebContent를 기준으로 경로를
																							// 지정하면 ㄴ된다.

		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/* 클라이언트에서 -> 서버단으로 보낼떄는 HttpServletRequest */
		request.setCharacterEncoding("UTF-8");
		/* 서버에서 -> 클라이언트로 보낼때는 HttpServletResponse */
		response.setContentType("text/html; charset=utf-8");

		PrintWriter out = response.getWriter();
		out.print("<font color='red'>Hello World!!!</font>");

		String userID = request.getParameter("id");

		// out.println("Hello" + userID);

		String btn1 = request.getParameter("btn1");
		String btn2 = request.getParameter("btn2");
		// out.println("Hello"+ btn1 );
		// out.println("Hello"+ btn2 );

		// response.sendRedirect("./01_test/list.jsp");

		request.setAttribute("id", userID);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/01_text/list.jsp"); // 얘는 WebContent를 기준으로 경로를
																							// 지정하면 ㄴ된다.

		dispatcher.forward(request, response);

	}
}
