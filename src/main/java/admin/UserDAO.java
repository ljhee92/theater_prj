package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DbConnection;
import util.DbcpDbConnection;

public class UserDAO {

	private static UserDAO uDAO;
	
	private UserDAO() {
		
	}//생성자
	
	public static UserDAO getInstance() {
		if(uDAO == null) {
			uDAO = new UserDAO();
		}//end if
		return uDAO;
	}//getInstance
	
	
	///////////////////////회원가입///////////////////////////
	public int insertUserInfo(UserVO uVO) throws SQLException{
		int cnt = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		
DbConnection dbCon = DbConnection.getInstance();
		
		try {
			// 1. 데이터베이스 접속 정보
			String id = "son";
			String pass = "jimin";

			// 2. 데이터베이스 연결
			//3. Connection 얻기
			con = dbCon.getConnection(id, pass);
			
		//4. 쿼리문 생성 객체 얻기
			StringBuilder insertUser = new StringBuilder();
			insertUser.append("	insert into users	")
			.append("	(user_id, user_password, user_name, user_birthday, user_phone)	")
			.append("	values(?,?,?,?,?)	");

			pstmt = con.prepareStatement(insertUser.toString());
		//5. 바인드 변수에 값 설정
			pstmt.setString(1, uVO.getUserId());
			pstmt.setString(2, uVO.getUserPassword());
			pstmt.setString(3, uVO.getUserName());
			pstmt.setString(4, uVO.getUserBirthday());
			pstmt.setString(5, uVO.getUserPhone());
			
		//6. 쿼리문 수행 후 결과 얻기
			cnt = pstmt.executeUpdate();
		} finally {
		//7. 연결 끊기
			dbCon.dbClose(null, pstmt, con);
		}//end finally
		
		return cnt;
	}//insertWebMember
	
	
	///////////////////////아이디 중복 확인/////////////////////
	public String selectDupId(String userId) throws SQLException{
		String returnId="";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			// 1. 데이터베이스 접속 정보
			String id = "son";
			String pass = "jimin";

			// 2. 데이터베이스 연결
			//3. Connection 얻기
			con = dbCon.getConnection(id, pass);
			
		//4. 쿼리문 생성객체 얻기
			pstmt = con.prepareStatement("select user_id from users where user_id=?");
		//5. 바인드 변수에 값 설정
			pstmt.setString(1, userId);
		//6. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();
			if(rs.next()) {
				returnId = rs.getString("user_id");
			}//end if
		} finally {
		//7. 연결 끊기
			dbCon.dbClose(rs, pstmt, con);
		}//end finally
		
		return returnId;
		
	}//selectDupId
	
}//class
