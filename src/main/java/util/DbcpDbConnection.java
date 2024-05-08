package util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DbcpDbConnection {
	private DbcpDbConnection() {
		
	} 
	private static DbcpDbConnection dbCon;
	
	public static DbcpDbConnection getInstance() {
		if(dbCon == null) {
			dbCon = new DbcpDbConnection();
		}
		return dbCon;
	}//getInstance
	
	public Connection getCon(String dbcpName) throws SQLException{
		
		Connection con = null;
		
		//1. JNDI 사용객체 생성
		try {
			Context ctx = new InitialContext();
			
			//2. DBCP에서 DataSource
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/" + dbcpName);
			
			//3. DataSource에서 Connection 얻기
			con = ds.getConnection();
		} catch(NamingException ne) {
			ne.printStackTrace();
		}//end try
		return con;
	}//getCon
	
	public Connection getCon() throws SQLException {

		Connection con = null;

		// 1. JNDI 사용객체 생성
		try {
			Context ctx = new InitialContext();

			// 2. DBCP에서 DataSource
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/dbcp");

			// 3. DataSource에서 Connection 얻기
			con = ds.getConnection();
		} catch (NamingException ne) {
			ne.printStackTrace();
		} // end try
		return con;
	}// getCon
	
	public void closeCon(ResultSet rs, Statement stmt, Connection con) throws SQLException {
		try {
			if(rs != null) {
				rs.close();
			}//end if
			if(stmt != null) {
				stmt.close();
			}//end if
		}finally {
			if(con != null) {
				con.close();
			}//end if
		}//end try
	}//closeCon
	
	
}//class
