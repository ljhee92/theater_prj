package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import lombok.Getter;
import util.DbConnection;

@Getter
public class AdminLoginDao {
	private static AdminLoginDao alDAO;
	public static AdminLoginDao getInstance() {
		if (alDAO == null) {
			alDAO = new AdminLoginDao();
		} // end if
		return alDAO;
	}
	
	/**
	 * 로그인 기능구현부
	 * 
	 * @param aVO
	 * @return
	 * @throws SQLException
	 */
	public AdminVO adminLogin(AdminVO aVO) throws SQLException {
		AdminVO aresultVO = null;
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
			String selectQuery = "SELECT ADMIN_ID, ADMIN_PASSWORD FROM admin WHERE ADMIN_ID = ? AND ADMIN_PASSWORD = ?";
			pstmt = con.prepareStatement(selectQuery);

			// 4. SQL 쿼리에 파라미터 설정

			pstmt.setString(1, aVO.getAdminId());
			pstmt.setString(2, aVO.getAdminPwd());

			// 5. 쿼리 실행 및 결과 처리
			rs = pstmt.executeQuery();

			if (rs.next()) {
				aresultVO = new AdminVO(rs.getString("ADMIN_ID"), rs.getString("ADMIN_PASSWORD"));
			}
		} finally {
			// 6. 리소스 해제
			dbcon.dbClose(rs, pstmt, con);
		}
		

		return aresultVO;
	}// AdminLogin
}
