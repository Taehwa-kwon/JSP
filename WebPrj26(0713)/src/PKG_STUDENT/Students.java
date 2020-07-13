package PKG_STUDENT;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import PKG_DB.DBCon;
 
@WebServlet("/Students") //어노테이션
public class Students extends HttpServlet {
   
   private static final long serialVersionUID = 1L;
       
    public Students() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			do_work(request,response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			do_work(request,response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	protected void do_work(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
				String strDoWork = request.getParameter("doWork");
				
				if(strDoWork.equals("list")) {
					student_List(request, response);
				}

				if(strDoWork.equals("detail")) {
					student_detail(request, response);
				}
				
				
			}
	
	
	protected void student_List(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException 
	{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		/*
		 * 방법 1 
		 * String strID = "STU001"; 
		 * String strName = "홍길동01"; 
		 * String strTel = "010-5555-4414";
		 * 
		 * 
		 * request.setAttribute("strID", strID);  //setAttribute는 선택한 요소에 속성값을 지정한다.
		 * request.setAttribute("strName",strName);//앞에는 string인 name 과 속성의 값인 value값 지정
		 * request.setAttribute("strTel", strTel);
		 */
		DBCon db = new DBCon("jdbc:oracle:thin:@localhost:1521:XE","jdbctest","1234");
		
		String strSql = " SELECT * FROM STUDENTS_TBL ";
		ResultSet rs= db.getResultSet(strSql); 
		//방법2
		//request.setAttribute("ResultSet", rs);/* resultSet으로 요청한다. */
		
		//방법3
		//ArrayList arrStudents = new ArrayList();
		//방법4
		ArrayList<Student> arrStudents = new ArrayList<>();
		while(rs.next()) {
		Student student = new Student();
		student.setStu_id(rs.getString("STU_ID"));
		student.setStu_name(rs.getString("STU_NAME"));
		student.setStu_tel(rs.getString("STU_TEL"));
		
		arrStudents.add(student);
		}
		request.setAttribute("students", arrStudents);
		
		
		///////
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/02_Students/students_list.jsp");  //이렇게 해서 students_list로 보내주고 
		dispatcher.forward(request,response);
	}
	
	protected void student_detail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
				request.setCharacterEncoding("UTF-8");
				response.setContentType("text/html;charset=utf-8");
				
				// 1. db연결 후 원하는 데이터 가져오기
				String strStu_ID = request.getParameter("stu_id");
				
				DBCon db = new DBCon("jdbc:oracle:thin:@localhost:1521:XE","jdbctest","1234");
				String sql = " SELECT * FROM STUDENTS_TBL WHERE STU_ID = '"+ strStu_ID +"' ORDER BY STU_ID ASC ";
				ResultSet rs = db.getResultSet(sql);
				rs.next();
				
				Student stud = new Student();
				stud.setStu_id(rs.getString("STU_ID"));
				stud.setStu_name(rs.getString("STU_NAME"));
				stud.setStu_tel(rs.getString("STU_TEL"));
				
				request.setAttribute("student", stud);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("/02_Students/students_detail.jsp");
				dispatcher.forward(request, response);  
				//준비상태(Ready)에서 실행상태(Running)로 상태전이(State Transition)된다고 한다. 이 과정을 디스패칭(dispatching)이라고 하고 디스패처(dispatcher)가 이 일을 수행한다
				
			}
	
	
	
}