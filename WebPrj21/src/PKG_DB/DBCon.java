package PKG_DB;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBCon {

	//속성
	private String url;
	private String userID;
	private String userPwd;
	
	//getter/setter
	public String getUrl() {
		return url;
	}


	public void setUrl(String url) {
		this.url = url;
	}


	public String getUserID() {
		return userID;
	}


	public void setUserID(String userID) {
		this.userID = userID;
	}


	public String getUserPwd() {
		return userPwd;
	}


	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	
	

	//생성자
	public DBCon() {}
	
	//생성자 오버로드
	public DBCon(String url, String userID, String userPwd) {
		this.url = url;
		this.userID = userID;
		this.userPwd = userPwd;
		
	}
					/* 			select 전용    				*/	
	//메소드 정의
	public Connection getConnection() {
		
		Connection con = null;
		try {
			con = DriverManager.getConnection(url,userID,userPwd);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
	
	//getPreparedStatement
	public PreparedStatement getPreparedStatement(Connection con,String strSql) {
		
		PreparedStatement psmt=null;
		try {
			psmt = con.prepareStatement(strSql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return psmt;
	}
	
	//select 일때
		public ResultSet getResultSet(String strSql) {  //getResultSet은 studentList.jsp에서 받아온다. 
			ResultSet rs = null;
			
			Connection con = getConnection();
			
			PreparedStatement psmt = getPreparedStatement(con, strSql);
			
			try {
				rs = psmt.executeQuery();						//executeQuery()가 select전용 
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return rs;
								
		}
				/* 			select 전용    				*/
		
	//insert, update, delete할때
		public void setCUD(String strSql) {
			Connection con = this.getConnection();
			PreparedStatement psmt = getPreparedStatement(con, strSql);
			
			try {
				psmt.executeUpdate();							//나머지 insert,update,delete는 executeUpdate() 
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
	//procedure 사용할때(login)	
		public ResultSet getResultSet(String strProcName,String[] strInParams ) {
			//strProcName 프로시저의 이름이다. 
			ResultSet rs=null; //이렇게 올리는 이유는 아래에서 result을 받을려고
			Connection con = this.getConnection();
			try {
				
				CallableStatement cst =con.prepareCall(strProcName);
				
				cst.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR);
				
				cst.execute();
				
				rs= (ResultSet)cst.getObject(1);
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} //프로시저 이름을 받고
			return rs;
		}
		
		
		
	
		
	
}
