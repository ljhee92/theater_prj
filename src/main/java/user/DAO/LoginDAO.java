package user.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import user.VO.UserVO;
import util.DbConnection;

public class LoginDAO {
	private static LoginDAO lDAO;
	public static LoginDAO getInstance() {
		if (lDAO == null) {
			lDAO = new LoginDAO();
		} // end if
		return lDAO;
	}
	
	/**
	 * 유저 로그인 기능구현부
	 * 
	 * @param uVO
	 * @return
	 * @throws SQLException
	 */
	public UserVO Login(UserVO uVO) throws SQLException {
		UserVO resultVO = null;
		DbConnection dbcon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			// 1. 데이터베이스 접속 정보
			String id = "son";
			String pass = "jimin";

			// 2. 데이터베이스 연결
			con = dbcon.getConnection(id, pass);

			// 3. SQL 쿼리 준비
			String selectQuery = "SELECT USER_ID, USER_NAME, to_char(USER_BIRTHDAY,'YYmmdd') USER_BIRTHDAY,USER_TEMPORARY_FLAG FROM USERS WHERE USER_ID = ? AND USER_PASSWORD = ?"
					+ "";
			pstmt = con.prepareStatement(selectQuery);

			// 4. SQL 쿼리에 파라미터 설정

			pstmt.setString(1, uVO.getUserId());
			pstmt.setString(2, uVO.getUserPassword());

			// 5. 쿼리 실행 및 결과 처리
			rs = pstmt.executeQuery();


			
			
			if (rs.next()) {
				resultVO = UserVO.builder()
                        .userId(rs.getString("USER_ID"))
                        .userName(rs.getString("USER_NAME"))
                        .userBirthday(rs.getString("USER_BIRTHDAY"))
                        .userTemporaryFlag(rs.getString("USER_TEMPORARY_FLAG").charAt(0))
                        .build();

			}
		} finally {
			// 6. 리소스 해제
			dbcon.dbClose(rs, pstmt, con);
		}

		return resultVO;
	}// Login
	
	/**
	 * 유저 로그인 기능구현부
	 * 
	 * @param uVO
	 * @return
	 * @throws SQLException
	 */
	public boolean updatePW(UserVO uVO) throws SQLException {
		boolean result = false;
		DbConnection dbcon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			// 1. 데이터베이스 접속 정보
			String id = "son";
			String pass = "jimin";

			// 2. 데이터베이스 연결
			con = dbcon.getConnection(id, pass);

			// 3. SQL 쿼리 준비
			String selectQuery = "	update USERS	"
					+ "	set USER_PASSWORD = ?, "
					+ "	USER_TEMPORARY_FLAG = 'N'	"
					+ "	where USER_ID = ?	";
			pstmt = con.prepareStatement(selectQuery);

			// 4. SQL 쿼리에 파라미터 설정

			pstmt.setString(1, uVO.getUserPassword());
			pstmt.setString(2, uVO.getUserId());

			// 5. 쿼리 실행 및 결과 처리
			
		int chk = 	pstmt.executeUpdate();
		
		if(chk==1){
			result = true;
			
		}


			
	
		} finally {
			// 6. 리소스 해제
			dbcon.dbClose(rs, pstmt, con);
		}

		return result;
	}// Login
	
	
	
	
}
